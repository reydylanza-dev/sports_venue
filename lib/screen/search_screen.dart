import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/sport_field.dart';
import '../theme.dart';
import '../utils/dummy_data.dart';
import '../widget/sport_field_list.dart';

class SearchScreen extends StatefulWidget {
  String selectedDropdownItem;
  List<SportField> fieldList = sportFieldList;

  SearchScreen({required this.selectedDropdownItem});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = "";
  String _selectedDropdownItem = "All";
  List<SportField> _fieldList = [];
  List<SportField> _selectedListByCategory = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _query = widget.selectedDropdownItem;
    _fieldList = widget.fieldList;

    if (_query != "") {
      _selectedDropdownItem = widget.selectedDropdownItem;
      for (int i = 0; i < _fieldList.length; i++) {
        if (_selectedDropdownItem == "All") {
          _selectedListByCategory = _fieldList;
        } else if (_fieldList[i].category.name == _selectedDropdownItem) {
          _selectedListByCategory.add(_fieldList[i]);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue100,
      appBar: AppBar(
        elevation: 0.0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: primaryColor500,
            statusBarIconBrightness: Brightness.light),
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
            color: primaryColor500,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(CupertinoIcons.arrow_left),
                  color: colorWhite,
                ),
                showDropdown()
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Column(
                    children: _selectedListByCategory
                        .map((fieldEntity) => SportFieldList(
                              field: fieldEntity,
                            ))
                        .toList())
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget showDropdown() {
    return DropdownButton<String>(
        value: _selectedDropdownItem,
        iconEnabledColor: colorWhite,
        iconDisabledColor: darkBlue500,
        dropdownColor: darkBlue500,
        style: normalTextStyle.copyWith(color: colorWhite),
        icon: const Icon(Icons.filter_alt),
        isDense: false,
        isExpanded: false,
        underline: const SizedBox(),
        alignment: Alignment.centerRight,
        items: <String>[
          "All",
          "Basketball",
          "Futsal",
          "Table Tennis",
          "Tennis",
          "Volley"
        ]
            .map<DropdownMenuItem<String>>((value) => DropdownMenuItem(
                  child: Text(value),
                  value: value,
                ))
            .toList(),
        onChanged: (value) {
          _selectedListByCategory = [];
          setState(() {
            _selectedDropdownItem = value.toString();
            for (int i = 0; i < _fieldList.length; i++) {
              if (_selectedDropdownItem == "All") {
                _selectedListByCategory = _fieldList;
              } else if (_fieldList[i].category.name == _selectedDropdownItem) {
                _selectedListByCategory.add(_fieldList[i]);
              }
            }
          });
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
