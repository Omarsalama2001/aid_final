import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:aid_humanity/Features/home/domain/use_cases/get_all_requests_usecase.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/get_done_requests_usecase.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/get_live_requests_usecase.dart';
import 'package:aid_humanity/Features/home/domain/use_cases/update_request_usercase.dart';
import 'package:aid_humanity/core/constants/strings/faliures_strings.dart';
import 'package:aid_humanity/core/entities/request_entity.dart';
import 'package:aid_humanity/core/error/faliures.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllRequestsUseCase getAllRequestsUseCase;
  final UpdateRequestUseCase updateRequestUseCase;
  final GetLiveRequestsUseCase getLiveRequestsUseCase;
  final GetDoneRequestsUseCase getDoneRequestsUseCase;
  HomeBloc({
    required this.getAllRequestsUseCase,
    required this.updateRequestUseCase,
    required this.getLiveRequestsUseCase,
    required this.getDoneRequestsUseCase,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is GetAllRequestsEvent) {
        emit(GetAllRequestsLoading());

        final faliureOrRequests = await getAllRequestsUseCase();

        emit(_mapFaliureOrRequestToState(faliureOrRequests));
      }
      if (event is AcceptRequestEvent) {
        emit(AcceptRequsetLoadingState());
        final faliureOrUnit = await updateRequestUseCase(requestId: event.requestId, userId: event.deliveryId, status: event.status);

        faliureOrUnit.fold((l) => emit(AcceptRequsetErrorState()), (r) => emit(AcceptRequsetSuccessState()));
      }
      if (event is GetLiveRequestsEvent) {
        emit(GetLiveOrDoneRequestsLoading());
        final faliureOrRequests = await getLiveRequestsUseCase(userId: event.userId,isDonor: event.isDonor);
        faliureOrRequests.fold((faliure) => emit(GetLiveOrDoneRequestsFailure(message: _mapFaliureToMessage(faliure))), (requests) => emit(GetLiveOrDoneRequestsSuccess(requests: requests)));
      }
      if (event is GetDoneRequestsEvent) { 
        emit(GetLiveOrDoneRequestsLoading());
        final faliureOrRequests = await getDoneRequestsUseCase( event.userId,event.isDonor);
        faliureOrRequests.fold((faliure) => emit(GetLiveOrDoneRequestsFailure(message: _mapFaliureToMessage(faliure))), (requests) => emit(GetLiveOrDoneRequestsSuccess(requests: requests)));
      }
    });
  }

  HomeState _mapFaliureOrRequestToState(Either<Failure, List<RequestEntity>> faliureOrRequests) {
    return faliureOrRequests.fold((faliure) => GetAllRequestsFailure(message: _mapFaliureToMessage(faliure)), (requests) {
      return GetAllRequestsSuccess(requests: requests);
    });
  }

  String _mapFaliureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      // this to get the extended types while run time :)
      // ignore: type_literal_in_constant_pattern
      case ServerFaliure:
        return SERVER_FALIURE_MESSAGE;
      // ignore: type_literal_in_constant_pattern
      case OfflineFaliure:
        return OFFLINE_FALIURE_MESSAGE;
      // ignore: type_literal_in_constant_pattern
      case NoDataFaliure:
        return No_Data_FALIURE_MESSAGE;
      default:
        return UN_EXCPECTED_ERROR_MESSAGE;
    }
  }
}
