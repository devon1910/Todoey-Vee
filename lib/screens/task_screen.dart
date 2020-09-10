import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/notifierClass.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:intl/intl.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'bottom_sheet_screen.dart';

class TasksScreen extends StatefulWidget {

  @override
  _TasksScreenState createState() => _TasksScreenState();
}
var dt = DateTime.now();

class _TasksScreenState extends State<TasksScreen> {
  var newDt = DateFormat.yMMMEd().format(dt);
  var time= DateFormat.jm().format(dt);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: ,
      backgroundColor: Colors.transparent,
      /*  floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
             isScrollControlled: true,
              context: (context),
              builder:(context)=> AddTask(
//                setState(() {
//                  tasks.add(Task(task: newVal));
//                });
                )/*SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTask()))*/
          );
    },
      ),*/
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.025,0.2,0.8],
                  colors: [Color(0xFFEF0BFB),Color(0xFF6283E7),Color(0xFF00DCDC)]),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20.0, right: 20.0,bottom: 30.0,left: 30.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            children: [
                              Icon(Icons.work, color: Colors.white),
                              SizedBox(width: 30.0,),
                              Text('What To Do!',
                                  style: TextStyle(fontSize: 20.0,color: Colors.white))]),
                        SizedBox(height: 10.0,),
                        Text('$time',style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.bold)),
                        Text('$newDt',style: TextStyle(fontSize: 20.0,color: Colors.white)),
                        SizedBox(height: 10.0,),
                        Text('${Provider.of<TaskData>(context).taskCount} Tasks',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0),topRight:(Radius.circular(50.0))),
                        ),
                        child: TaskData().tasks==null ? Text('No Task added yet') : TasksList()
                    ),
                  ),
                  Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                        color: Colors.white
                    ),
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SingleChildScrollView(
                                child:Container(
                                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                  child: AddTaskScreen(),
                                )
                            )
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Center(
                          child: Material(
                            borderRadius: BorderRadius.only(
                                topLeft:Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0)),
                            color: Color(0xFFEF0BFB),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('+  Add ',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.0),),
                            ),
                            elevation: 20.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ]
            )
        ),
      ),
    );
  }
}




