import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:name_generator/data/models/random_name_model.dart';
import 'package:name_generator/data/resources/random_name_resource.dart';

part 'random_name_event.dart';
part 'random_name_state.dart';

class RandomNameBloc extends Bloc<RandomNameEvent, RandomNameState> {
  final RandomNameResource _randomNameResource;

  RandomNameBloc(this._randomNameResource) : super(RandomNameInitial()) {
    on<FetchRandomName>(_onFetchRandomName);
  }

  void _onFetchRandomName(
      FetchRandomName event, Emitter<RandomNameState> emit) async {
    emit(RandomNameLoading());

    try {
      final randomName = await _randomNameResource.fetchRandomName();
      emit(RandomNameLoaded(randomName: randomName));
    } catch (e) {
      emit(RandomNameError(message: 'Failed to load random name'));
    }
  }
}
