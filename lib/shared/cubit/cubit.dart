import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testnews/modules/business/business.dart';
import 'package:testnews/modules/science/science.dart';
import 'package:testnews/modules/settings/settings.dart';
import 'package:testnews/modules/sports/sports.dart';
import 'package:testnews/network/local/cache_helper.dart';
import 'package:testnews/network/remote/dio_helper.dart';
import 'package:testnews/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isDark = false;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  void changeBottomNavBar(index) {
    currentIndex = index;
    if (currentIndex == 1)
      getSportsData();
    else if (currentIndex == 2) getScienceData();
    emit(ChangeBottomNavBar());
  }

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeMode({bool fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        print('Moode $isDark');
        emit(ChangeAppModeState());
      });
    }
  }

  List<dynamic> business = [];

  void getBusinessData() {
    emit(GetBusinessDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'aea7141f19ca4efc854f3b73f85ae1e5'
    }).then((value) {
      business = value.data["articles"];
      emit(GetBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetBusinessDataErrorState());
    });
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(GetSportsDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'aea7141f19ca4efc854f3b73f85ae1e5'
    }).then((value) {
      sports = value.data["articles"];
      emit(GetSportsDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSportsDataErrorState());
    });
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(GetScienceDataLoadingState());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'aea7141f19ca4efc854f3b73f85ae1e5'
    }).then((value) {
      science = value.data["articles"];
      emit(GetScienceDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetScienceDataErrorState());
    });
  }

  List search = [];

  void getSearch(String value) {
    search=[];
    emit(GetSearchDataLoadingState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': 'aea7141f19ca4efc854f3b73f85ae1e5'
    }).then((value) {
      search = value.data["articles"];
      emit(GetSearchDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSearchDataErrorState());
    });
  }
}
