import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentBox extends StatelessWidget {
  Widget child;
  dynamic formKey;
  dynamic sendButtonMethod;
  dynamic commentController;
  String userImage;
  String labelText;
  String errorText;
  Widget sendWidget;
  Color backgroundColor;
  Color textColor;
  bool withBorder;
  Widget header;
  FocusNode focusNode;
  CommentBox(
      {this.child,
      this.header,
      this.sendButtonMethod,
      this.formKey,
      this.commentController,
      this.sendWidget,
      this.userImage,
      this.labelText,
      this.focusNode,
      this.errorText,
      this.withBorder = true,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        ListTile(
          tileColor: Colors.white,
          leading: Icon(
            Icons.add_comment,color: Colors.black,
          ),
          title: Form(
            key: formKey,
            child: TextFormField(
              maxLines: 4,
              minLines: 1,
              focusNode: focusNode,
              cursorColor: textColor,
              style: TextStyle(color: textColor),
              controller: commentController,
              decoration: InputDecoration(
                enabledBorder: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                ),
                focusedBorder: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                ),
                border: !withBorder
                    ? InputBorder.none
                    : UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                ),
                labelText: labelText,
                focusColor: textColor,
                fillColor: textColor,
                labelStyle: TextStyle(color: textColor),
              ),
              validator: (value) => value.isEmpty ? errorText : null,
            ),
          ),
          trailing: GestureDetector(
            onTap: sendButtonMethod,
            child: sendWidget,
          ),
        ),
        Expanded(child: child),
        Divider(
          height: 1,
        ),
        header ?? SizedBox.shrink(),

      ],
    );
  }
}
