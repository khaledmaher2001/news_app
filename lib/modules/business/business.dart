import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testnews/shared/components/components.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/cubit.dart';
import 'package:testnews/shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.business.length>0?ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildItem(cubit.business[index],context),
            separatorBuilder: (context, index) => cubit.isDark? Divider(color:Colors.white ,):Divider(color:Colors.black ,),
            itemCount: cubit.business.length):Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
