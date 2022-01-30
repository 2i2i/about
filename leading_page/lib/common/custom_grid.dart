import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget{

  final List<Widget> children;

  final int crossAxisCount;

  const CustomGridView({Key? key, required this.crossAxisCount, required this.children}) : super(key: key);


  List<List<Widget>> makeListOfRow(){
    List<List<Widget>> listOfRow = [];
    List<Widget> list = List.from(children);
    int verticalCount = (list.length ~/ crossAxisCount) + (list.length % crossAxisCount == 0 ? 0 : 1);
    for(int i=0;i<verticalCount;i++){
      if(list.length>=crossAxisCount) {
        listOfRow.add(List.from(list.sublist(0, crossAxisCount)));
        list.removeRange(0, crossAxisCount);
      }else{
        listOfRow.add(List.from(list));
        list.clear();
      }
    }
    return listOfRow;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        makeListOfRow().length,
            (index) {
          List<Widget> subItems = makeListOfRow()[index];
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(subItems.length, (i) {
              return subItems[i];
            }),
          );
        },
      ),
    );
  }
}
