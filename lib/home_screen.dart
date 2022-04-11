import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical/utils/color-utils.dart';
import 'package:practical/utils/size-manage-utils.dart';
import 'package:practical/utils/string-utils.dart';
import 'package:practical/utils/validation-util.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> todo = ['Buy milk','Buy eggs', 'Buy bread'];
  var _validationUtil = ValidationUtil();
  List<bool> _isAcceptTC = [false, false, false];

  Widget _buildNameField() => Padding(
    padding: const EdgeInsets.fromLTRB(25,15.0,25,25),
    child: TextFormField(
      // controller: _nameController,
      validator: (value) =>
          _validationUtil.validateField(value!, 'Please enter task'),
      decoration: new InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color:ColorUtils.appColor, width: 5),
          ),
          // prefixIcon: Icon(Icons.person, color: Color(0xff220501)),
          // contentPadding:
          // new EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: ColorUtils.appColor, width: 5),
          ),
          labelText: 'Description',
          labelStyle: TextStyle(color: ColorUtils.appColor),
          hintStyle: new TextStyle(color: ColorUtils.hintColor),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white),
      style: TextStyle(
          fontSize: SizeConfig.extraSmallfontSize, color: Colors.black),
    ),
  );

  Widget _buildSubmitButton(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left:25.0,right:25,top:10),
    child: Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical! * 7,
      child: RaisedButton(
        onPressed: () {
          //hide keyboard
          FocusScope.of(context).requestFocus(FocusNode());
        },
        // color: Color(0xff7f5539),
        color: ColorUtils.appColor,
        child: Text(
          'Add',
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfig.normalfontSize,
              fontWeight: FontWeight.w400),
        ),
        padding: const EdgeInsets.all(10.0),

      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorUtils.appColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left:SizeConfig.blockSizeHorizontal!*15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height:SizeConfig.blockSizeVertical!*6
                  ),
                  CircleAvatar(
                    radius: SizeConfig.blockSizeVertical!*4.5,
                    backgroundColor: ColorUtils.bgColor,
                    child:Icon(Icons.list, color:ColorUtils.appColor, size: SizeConfig.headerfontSize)
                  ),
                  SizedBox(
                      height:SizeConfig.blockSizeVertical!*6
                  ),
                  Text(StringUtils.appName,style: TextStyle(color: ColorUtils.bgColor,fontSize: SizeConfig.extrabigfontSize,fontWeight: FontWeight.w800),),
                  Text(todo.length.toString() + StringUtils.task,style: TextStyle(color: ColorUtils.bgColor,fontSize: SizeConfig.smallfontSize,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: SizeConfig.blockSizeVertical!*60,
              decoration: BoxDecoration(
                  color: ColorUtils.bgColor,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20))
              ),
              child: ListView.builder(
                  itemCount: todo.length,
                  padding: EdgeInsets.fromLTRB(SizeConfig.blockSizeHorizontal!*7,SizeConfig.blockSizeVertical!*4,SizeConfig.blockSizeHorizontal!*7,0),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            todo[index],
                            style: TextStyle(
                              decoration:_isAcceptTC[index] ? TextDecoration.lineThrough:TextDecoration.none,
                                fontSize: SizeConfig.smallfontSize,
                                color: ColorUtils.blackColor,
                                fontWeight: FontWeight.w400),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: ColorUtils.blackColor,
                            ),
                            child: Checkbox(
                              value: this._isAcceptTC[index],
                              focusColor: ColorUtils.bgColor,
                              activeColor: ColorUtils.appColor,
                              hoverColor: ColorUtils.bgColor,

                              onChanged: (bool? value) {
                                setState(() {
                                  this._isAcceptTC[index] = value!;
                                });
                              },
                            ),
                          ),

                        ],
                      )
                    );
                  }),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding:  EdgeInsets.all(SizeConfig.blockSizeVertical!*2.5),
        child: FloatingActionButton(
          backgroundColor:ColorUtils.appColor,
          onPressed: (){
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                isScrollControlled: true,
                context: context,
                builder: (builder){
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: new Container(
                      height: SizeConfig.blockSizeVertical!*40,
                      color: Colors.transparent,
                      child: new Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(14.0),
                                  topRight: const Radius.circular(14.0))),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top:15.0),
                                child: Text(StringUtils.addTask,style: TextStyle(color: ColorUtils.appColor,fontSize: SizeConfig.mediumfontSize,fontWeight: FontWeight.w400),),
                              ),
                              _buildNameField(),
                              _buildSubmitButton(context)
                            ],
                          )),
                    ),
                  );
                }
            );
          },
          tooltip: 'Add Task',
          child: Icon(Icons.add,color: Colors.white,size: SizeConfig.bigfontSize,),
        ),
      ),
    );
  }
}