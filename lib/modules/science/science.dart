import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testnews/shared/components/components.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.science.length>0?ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildItem(cubit.science[index],context),
            separatorBuilder: (context, index) => Divider(),
            itemCount: cubit.science.length):Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
