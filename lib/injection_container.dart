import 'package:aid_humanity/Features/donation_details/data/remote_data_source.dart';
import 'package:aid_humanity/Features/donation_details/data/repositories_impl/details_repository_impl.dart';
import 'package:aid_humanity/Features/donation_details/domain/repository/details_repository.dart';
import 'package:aid_humanity/Features/donation_details/domain/use_cases/add_request_use_case.dart';
import 'package:aid_humanity/Features/donation_details/presentaion/bloc/details_bloc.dart';
import 'package:aid_humanity/Features/home/data/data_sources/remote_data_source.dart';
import 'package:aid_humanity/Features/home/data/reposatories_imp/home_repository_impl.dart';
import 'package:aid_humanity/Features/home/domain/repositories/home_repository.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/get_all_requests_usecase.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/get_done_requests_usecase.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/get_live_requests_usecase.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/update_request_usercase.dart';
import 'package:aid_humanity/Features/home/presentation/bloc/home_bloc.dart';
import 'package:aid_humanity/core/network/connection/network_connection.dart';
import 'package:aid_humanity/core/utils/theme/cubit/theme_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> init() async {
//! Features-details
// bloc
  getIt.registerFactory(() => DetailsBloc(getIt()));
  getIt.registerFactory(() => HomeBloc(getAllRequestsUseCase: getIt(), getLiveRequestsUseCase: getIt(), updateRequestUseCase: getIt(), getDoneRequestsUseCase: getIt()));
  getIt.registerFactory(() => ThemeCubit(getIt()));

//usecases

  getIt.registerLazySingleton(() => AddRequestUSeCase(detailsRepository: getIt()));
  getIt.registerLazySingleton(() => GetAllRequestsUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => UpdateRequestUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => GetLiveRequestsUseCase(homeRepository: getIt()));
  getIt.registerLazySingleton(() => GetDoneRequestsUseCase(homeRepository: getIt()));

// repositories
  getIt.registerLazySingleton<DetailsRepository>(() => DetailsRepositoryImpl(detailsRemoteDataSource: getIt(), connctionInfo: getIt()));
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(homeRemoteDataSource: getIt(), networkInfo: getIt()));

  //dataSources
  getIt.registerLazySingleton<DetailsRemoteDataSource>(() => DetailsRemoteDataSourceImplWithFireBase(firestore: getIt()));
  getIt.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImplWithFireBase(firebaseFirestore: getIt()));

  // core
  getIt.registerLazySingleton<ConnctionInfo>(() => ConnectionInfoImpl(internetConnectionChecker: getIt()));

  //externel
  getIt.registerLazySingleton(() => InternetConnectionChecker());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  getIt.registerLazySingleton(() => firestore);
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  // getIt.registerLazySingleton<AuthRemoteDataSource>(
  //       () => AuthRemoteDataSourceImpl(),
  // );
  //
  // getIt.registerLazySingleton<AuthRepoImpl>(
  //       () => AuthRepoImpl(
  //     authRemoteDataSource: getIt<AuthRemoteDataSource>(),
  //     networkInfo: getIt<ConnctionInfo>(),
  //   ),
  // );
}
