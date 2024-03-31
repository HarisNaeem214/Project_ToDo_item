import 'package:flutter/material.dart';
import 'package:projectlistview/Colors.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {

  List<Map<dynamic,dynamic>> todoitem = [
    { "work":"break fast", "isDone":false},
    { "work":"take bath", "isDone":false},
    { "work":"Working on a Mobile app 2 two hour", "isDone":false},
    { "work":"Buy Groceries", "isDone":false},
    { "work":"Gym", "isDone":false},
    { "work":"Playing Cricket", "isDone":false}
  ];

  
  // "break fast","take bath","Goto market","go to center",
  // "break fast","take bath","Goto market","go to center",
  // "break fast","take bath","Goto market","go to center",
  // "break fast","take bath","Goto market","go to center",
  // "break fast","take bath","Goto market","go to center"];

  TextEditingController todocontroller = TextEditingController();
  TextEditingController updatecontroller = TextEditingController();

  removeitem({forremove}){

   setState(() {
                todoitem.removeAt(forremove);
              });}


  updateitem(index){
    
                  updatecontroller.text = todoitem[index]["work"];

            showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Please Enter new Text"),
                    content: TextField(
                      
                      controller: updatecontroller,
                            
                    ),
                    actions: [ElevatedButton(onPressed: (){
                      setState(() {
                        todoitem[index]["work"] = updatecontroller.text;
                        updatecontroller.clear();
                        Navigator.pop(context);
                      });
                    }, child: Text("OK")),
                    ElevatedButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel"))],
                  );
            });
  }

  additem(){
    setState(() {
        setState(() {
            todoitem.add({ "work":todocontroller.text, "isDone":false});
          todocontroller.clear();
          });
      
    });
  }
 
 
  
 

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,
        centerTitle: true,
      backgroundColor:tb_grey,
      
        title: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Icon(Icons.menu,
        color: tb_black,size: 25,),
        Text("ToDo List",style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,
        color: tb_black),), CircleAvatar(backgroundImage: AssetImage("assets/images/HN.jpg"),) ],),
      ),
      body:SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,
            child: ListTile(
               tileColor: tb_grey,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

              title: TextField(
        controller: todocontroller,
      ),
      trailing: ElevatedButton(onPressed:() {
        additem();

        //It's button for add new work
        
        }, child: const Text("+")),
               ),)
            ,
            SizedBox(height:  MediaQuery.of(context).size.height * 0.02,),
            Expanded(

              //it's the list of Work
              child: Container(
                width:  MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(itemCount: todoitem.length,
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    
                    width: MediaQuery.of(context).size.width * 0.7 ,
                     decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Border ka color
                    width: 1.0, // Border ka width
                  ),
                  borderRadius: BorderRadius.circular(10.0), // BorderRadius set karein
                ),
                    child: ListTile(
                      tileColor: tb_grey,
                       contentPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                       leading: Checkbox(value: todoitem[index]["isDone"] , onChanged: (value){
                                  setState(() {
                    todoitem[index]["isDone"]=value;
                                  });
                                }),
                    // it for check and uncheck of todo item
                      title: Text(todoitem[index]["work"].toString(),
                      style: TextStyle(decoration: todoitem[index]["isDone"] ? TextDecoration.lineThrough : null ),),
                      trailing: Row(mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){
                            removeitem(forremove: index);
                          }, icon:const Icon(Icons.delete),
                    ), IconButton(onPressed: (){
                        updateitem(index);
                    }, icon:const Icon(Icons.edit)),
                              
                        ],
                      )),
                  );
                }
                ),
              ),
            ),
            // SizedBox(
            //   height: 50,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * 0.98,
            //    decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     border: Border.all(color: Colors.black,width: 2),
            //     color: Colors.grey),
                
            //     child: SearchBar(hintText:"Search",
            //     ),
            //   ),
            // )
            
          ],
          
        ),
      )
    );
  }
}