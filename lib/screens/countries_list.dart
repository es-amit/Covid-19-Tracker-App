import 'package:covid_19_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {

  TextEditingController searchController = TextEditingController();
  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        
      ),
      body: SafeArea(child: 
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 15),
            child: TextFormField(
              controller: searchController,
              onChanged: (value){
                setState(() {
                  
                });
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                labelText: 'Search',
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: statesServices.countriesListApi(), 
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
                if(!snapshot.hasData){
                  return ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade700, 
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                      children: [
                        ListTile(
                          title: Container(height: 10,width: 90,color: Colors.white,),
                          subtitle: Container(height: 10,width: 90,color: Colors.white,),
                          leading: Container(height: 50,width: 50,color: Colors.white,),
                        )
                      ],
                    )
                      );
                  }));
                }
                else{
                  return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    String name = snapshot.data![index]['country'];
                    if(searchController.text.isEmpty || name.toLowerCase().contains(searchController.text.toLowerCase())){
                      return Column(
                      children: [
                        ListTile(
                          title: Text(snapshot.data![index]['country'].toString()),
                          subtitle: Text(snapshot.data![index]['cases'].toString()),
                          leading: Image(image: NetworkImage(snapshot.data![index]['countryInfo']['flag']),
                          height: 50,
                          width: 50,),
                        )
                      ],
                    );
                    }
                    else{
                      return Container();
                    }
                  }));
                }
              }))
        ],
      )),
    );
  }
}