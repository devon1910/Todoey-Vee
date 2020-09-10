import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/notifierClass.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_list.dart';



// ignore: camel_case_types
class AddTaskScreen extends StatelessWidget {
// final Function addCallBack;
  //bool status;
  @override
  Widget build(BuildContext context) {
    String txtValue;
    return Container(
      color: Color(0xFF757575),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('Today\'s List',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey)),
              SizedBox(height: 25.0),
              TextField(

                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(12)
                    ),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12)
                  ),


                  //hintText: 'What to do today',

                  prefixIcon: Icon(Icons.work,color: Colors.blue,),
                  labelText: 'What to do',//The magic--Key--check
                  labelStyle: TextStyle(color: Colors.grey)
                ),
                //textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                //autofocus: true,
                style: TextStyle(
                color:Colors.black),
                //Color(0xFFD0B9DB)
                onChanged: (value){
                  txtValue=value;
                },


              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: (){

                  Provider.of<TaskData>(context).addTask(txtValue);

                  Navigator.pop(context);
                },
                // padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Add',style: TextStyle(color: Colors.blue,fontSize: 20.0),textAlign: TextAlign.end,),
              )
            ],
          )
      ),
    );
  }
}
