import 'package:flutter/material.dart';
import 'package:testnews/modules/web_view/web_view_screen.dart';

Widget buildItem(model,context) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>WebViewScreen(model['url'])));
    },
    child: Padding(

      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${model['urlToImage']}"),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 15.0,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${model['title']}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1
                    ),
                  ),
                  Text(
                    "${model['publishedAt']}",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget defaultTextFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required String labelText,
  @required Function validator,
   Function onChange,
  @required IconData prefix,
  Function suffixShow,
  bool obscure = false,
  IconData suffix,
}) =>
    TextFormField(
      onChanged: onChange,
      validator: validator,
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      decoration: InputDecoration(

          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(
              onPressed: suffixShow,
              icon: Icon(suffix)),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          )),
    );

