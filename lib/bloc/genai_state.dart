part of 'genai_bloc.dart';

sealed class GenaiState extends Equatable {
  const GenaiState();

  @override
  List<Object> get props => [];
}

final class GenaiInitial extends GenaiState {}

class MessageUpdate extends GenaiState {
  final List<ChatContent> contents;
  const MessageUpdate(this.contents);

  @override
  List<Object> get props => contents;
}
