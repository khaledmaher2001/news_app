import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testnews/shared/components/components.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/states.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var searchController = TextEditingController();
        var model = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    AppCubit.get(context).getSearch(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ConditionalBuilder(
                  builder: (BuildContext context) => ListView.separated(
                      itemBuilder: (context, index) =>
                          buildItem(model[index], context),
                      separatorBuilder: (context, index) =>
                          AppCubit.get(context).isDark
                              ? Divider(
                                  color: Colors.white,
                                )
                              : Divider(
                                  color: Colors.black,
                                ),
                      itemCount: model.length),
                  condition: model.length > 0,
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
