import 'package:flutter/material.dart';

import '../category.dart';
import '../categoryList.dart';

class CategoryAlert extends StatefulWidget {
  final List<Category> alreadySelected;
  CategoryAlert(this.alreadySelected);
  @override
  _CategoryAlertState createState() => _CategoryAlertState();
}

class _CategoryAlertState extends State<CategoryAlert> {
  TextEditingController categoryNameController = new TextEditingController();
  List<bool> selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedCategory = [];
    for (int i = 0; i < categoryList.length; i++) {
      if (widget.alreadySelected.contains(categoryList[i])) {
        selectedCategory.add(true);
      } else
        selectedCategory.add(false);
    }
  }

  void onSubmitDone() {
    List<Category> finalSelectedCategory = [];
    for (int i = 0; i < selectedCategory.length; i++) {
      if (selectedCategory[i] == true) {
        finalSelectedCategory.add(categoryList[i]);
      }
    }
    Navigator.of(context).pop(finalSelectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 250.0,
        width: 0.0,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return CheckboxListTile(
              value: selectedCategory[index],
              onChanged: (value) {
                setState(() {
                  selectedCategory[index] = !selectedCategory[index];
                });
              },
              title: Text(categoryList[index].categoryName),
            );
          },
          itemCount: categoryList.length,
        ),
      ),
      title: Center(
        child: Text('Select Categories'),
      ),
      actions: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width - 130.0,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Category Name'),
                        content: Container(
                          height: 50.0,
                          child: TextField(
                            controller: categoryNameController,
                            autofocus: true,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          RaisedButton(
                            onPressed: () {
                              categoryList.add(
                                Category(
                                    categoryName: categoryNameController.text,
                                    imageIcon:
                                        Image.asset('images/sadness.jpg')),
                              );
                              Navigator.pop(context);
                            },
                            child: Text('Add'),
                            color: Colors.amber,
                            textColor: Colors.black,
                          )
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Add Category',
                  ),
                  color: Colors.amber,
                  padding: EdgeInsets.all(16.0),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: RaisedButton(
                  textColor: Colors.black,
                  onPressed: onSubmitDone,
                  child: Text(
                    'Done',
                  ),
                  color: Colors.red,
                  padding: EdgeInsets.all(16.0),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
