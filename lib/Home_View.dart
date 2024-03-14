import 'package:flutter/material.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {

  List todoitem = ["break fast","take bath","Goto market","go to center",
  "break fast","take bath","Goto market","go to center",
  "break fast","take bath","Goto market","go to center",
  "break fast","take bath","Goto market","go to center",
  "break fast","take bath","Goto market","go to center",
  "break fast","take bath","Goto market","go to center"];

  TextEditingController todocontroller = TextEditingController();
  TextEditingController updatecontroller = TextEditingController();

  removeitem({forremove}){

   setState(() {
                todoitem.removeAt(forremove);
              });}


  updateitem(index){
    
                  updatecontroller.text = todoitem[index];

            showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Please Enter new Text"),
                    content: TextField(
                      
                      controller: updatecontroller,
                            
                    ),
                    actions: [ElevatedButton(onPressed: (){
                      setState(() {
                        todoitem[index] = updatecontroller.text;
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

  bool ischecked = false;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.purpleAccent,
        title: Text("ToDo List",style: TextStyle(fontWeight:FontWeight.bold ),),
      ),
      body:SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,
            child: ListTile(
              tileColor:Colors.grey,
              title: TextField(
        controller: todocontroller,
      ),
      trailing: ElevatedButton(onPressed:() {
          setState(() {
            todoitem.add(todocontroller.text);
          todocontroller.clear();
          });
        }, child: Text("+")),
               ),)
            ,
            Expanded(
              child: ListView.builder(itemCount: todoitem.length,
              itemBuilder: (context,index){
                return Container(margin: EdgeInsets.only(bottom: 5),
                  child: ListTile(
                  
                    title: Text(todoitem[index].toString()),
                    trailing: Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){
                          removeitem(forremove: index);
                        }, icon:Icon(Icons.delete),
                  ), IconButton(onPressed: (){
                      updateitem(index);
                  }, icon:Icon(Icons.edit)),
                            
                      ],
                    )),
                );
              }
              ),
            ),
            SizedBox(
              height: 50,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.98,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black,width: 2),
                color: Colors.grey),
                
                child: SearchBar(hintText:"Search",
                ),
              ),
            )
            
          ],
          
        ),
      )
    );
  }
}