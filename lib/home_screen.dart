import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 140,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(14),
                           color: Colors.redAccent
                         ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.category,color: Colors.white,size: 50,),
                              Text('Catogery',style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,color: Colors.white,size: 50,),
                              Text('Mail',style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],
                          ),
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.blue.shade300
                          ),
                        ),
                      ),
                    ),
        
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.redAccent
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.category,color: Colors.white,size: 50,),
                              Text('Catogery',style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Card(
                        elevation: 10,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person,color: Colors.white,size: 50,),
                              Text('Mail',style: TextStyle(color: Colors.white,fontSize: 20),)
                            ],
                          ),
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.blue.shade300
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
