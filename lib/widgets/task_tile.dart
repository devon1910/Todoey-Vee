import 'package:flutter/material.dart';
// ignore: must_be_immutable
class TaskTile extends StatefulWidget {
  bool isChecked;
  final String name;
  final Function toggleCheckBox;
  final Function delTile;

  TaskTile({this.name,this.isChecked,this.toggleCheckBox,this.delTile});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      elevation: 35.0,
      child: ListTile(
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.play_arrow,size: 15.0,color: Colors.grey),
              SizedBox(width: 20.0),
              Text(widget.name,
                style: TextStyle(fontSize: 20.0,
                    decoration: widget.isChecked ? TextDecoration.lineThrough : null
                ),),
            ],
          ),
          trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Checkbox(
                   // hoverColor: Colors.blue,
                    activeColor: Colors.green,
                    value: widget.isChecked,
                    onChanged:(bool value){
                      setState(() {
                        widget.isChecked=value;
                      });
                    }//widget.toggleCheckBox,
                ),
                IconButton(
                  icon: Icon(Icons.delete,color: Colors.red),
                  onPressed: widget.delTile,
                ),
              ]
          )
      ),
    );
  }
}
























/*
class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final Function toggleCheckBox;
  final Function delTile;
  TaskTile({this.name,this.isChecked,this.toggleCheckBox,this.delTile});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: delTile,
      title: Text(name,
      style: TextStyle(
        decoration: isChecked ? TextDecoration.lineThrough : null
      ),),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isChecked,
        onChanged:toggleCheckBox,
    ),
    );
  }
}*/
