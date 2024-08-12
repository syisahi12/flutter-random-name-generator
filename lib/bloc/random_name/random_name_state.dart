part of 'random_name_bloc.dart';

@immutable
sealed class RandomNameState {}

final class RandomNameInitial extends RandomNameState {}
final class RandomNameLoading extends RandomNameState {}

final class RandomNameLoaded extends RandomNameState {
  final RandomName randomName;

  RandomNameLoaded({required this.randomName});
}

final class RandomNameError extends RandomNameState {
  final String message;

  RandomNameError({required this.message});
}