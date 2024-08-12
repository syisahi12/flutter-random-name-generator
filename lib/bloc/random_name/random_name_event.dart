part of 'random_name_bloc.dart';

@immutable
sealed class RandomNameEvent {}

class FetchRandomName extends RandomNameEvent {}