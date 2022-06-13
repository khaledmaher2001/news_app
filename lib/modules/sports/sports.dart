import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testnews/shared/components/components.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.sports.length>0 ? ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildItem(cubit.sports[index],context),
            separatorBuilder: (context, index) => Divider(),
            itemCount: cubit.sports.length):Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
