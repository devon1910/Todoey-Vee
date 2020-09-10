import 'package:flutter/material.dart';
import 'package:provider/provider.dart';//i was formerly relying on you for data,levels don change now, Firebase way!
import 'package:todoey_flutter/models/notifierClass.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {
//  List<TaskTile> TT = [];
//  final _firestore = Firestore.instance;
//  TaskData taskD;
  //List<Task> P=[];

//  void updateState(Task task){
//    task.toggleState();
//    //notifyListeners();
//  }
//  /*int get taskCount{
//    return TT.length;
//  }*/
//  void delTask(Task task){
//    TT.remove(task);
  // notifyListeners();
  @override
  Widget build(BuildContext context) {

    return Consumer<TaskData>( //always specify the stated object from the main.dart file
        builder: (context, taskdata, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskdata.tasks[index];
              return TaskTile(
                delTile: () { //or use a Flat Button, both works
                  taskdata.deleteTask(task);
                },
                name: task.name,
                isChecked: task.isDone  ,
                toggleCheckBox: (value) {
                  taskdata.updateTask(task);
                },
              );
            },
            itemCount: taskdata.taskCount,
          );
        }
    );
//    return StreamBuilder<QuerySnapshot>(
//        stream: _firestore.collection('tasks').snapshots(),
//        builder: (context, snapshot) {
//          if (!snapshot.hasData) {
//            return Center(
//              child: CircularProgressIndicator(
//                backgroundColor: Colors.lightBlue,
//              ),
//            );
//          }
//          final task = snapshot.data.documents;
//
//          for (var t in task) {
//            final snapTask = t.data['task'];
//            final tk = Task(name: snapTask);
//            final taskBub=TaskTile(delTile: ()=>
//                delTask(tk),
//                name: tk.name,
//                isChecked: tk.done,
//                toggleCheckBox:(value)=>updateState(tk));
//            //P.add(tk);
//            TT.add(taskBub);
//          }
//          print(TT.length);
//          //TaskData td;
//          return ListView(
//            children: TT,
//          );
//        }
//    );
  }
}


/*final taskBub = TaskTile();
            print(tsk.name);
            print(tsk.done);
            TT.add(taskBub);
            print(P.length);
            TT.add(taskBub);*/

/*itemBuilder: (context,index){
            final tsk = P[index];
            return TaskTile(
                delTile: ()=> taskD.delTask(tsk),
                name:tsk.name ,
                isChecked: tsk.done,
                toggleCheckBox: (value)=>taskD.updateState(tsk));
          },
          itemCount:P.length*/


//RETURNING OF DATA USING THE PRODUCER AND CONSUMER PACKAGES
/* return Consumer<TaskData>( //always specify the stated object from the main.dart file
        builder: (context, taskdata, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskdata.privTask[index];
              return TaskTile(
                delTile: () { //or use a Flat Button, both works
                  taskdata.delTask(task);
                },
                name: task.name,
                isChecked: task.done,
                toggleCheckBox: (value) {
                  taskdata.updateState(task);
                },
              );
            },
            itemCount: taskdata.taskCount,
          );
        }
    );*/
//}
//}
//Note to future self, Now i want to Make it possible to access data from my Firebase so the Consumer package is therefore redundant