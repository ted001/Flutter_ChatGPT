// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SessionState {
  List<Session> get sessionList => throw _privateConstructorUsedError;
  Session? get activeSession => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionStateCopyWith<SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStateCopyWith<$Res> {
  factory $SessionStateCopyWith(
          SessionState value, $Res Function(SessionState) then) =
      _$SessionStateCopyWithImpl<$Res, SessionState>;
  @useResult
  $Res call({List<Session> sessionList, Session? activeSession});
}

/// @nodoc
class _$SessionStateCopyWithImpl<$Res, $Val extends SessionState>
    implements $SessionStateCopyWith<$Res> {
  _$SessionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionList = null,
    Object? activeSession = freezed,
  }) {
    return _then(_value.copyWith(
      sessionList: null == sessionList
          ? _value.sessionList
          : sessionList // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      activeSession: freezed == activeSession
          ? _value.activeSession
          : activeSession // ignore: cast_nullable_to_non_nullable
              as Session?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionStateCopyWith<$Res>
    implements $SessionStateCopyWith<$Res> {
  factory _$$_SessionStateCopyWith(
          _$_SessionState value, $Res Function(_$_SessionState) then) =
      __$$_SessionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Session> sessionList, Session? activeSession});
}

/// @nodoc
class __$$_SessionStateCopyWithImpl<$Res>
    extends _$SessionStateCopyWithImpl<$Res, _$_SessionState>
    implements _$$_SessionStateCopyWith<$Res> {
  __$$_SessionStateCopyWithImpl(
      _$_SessionState _value, $Res Function(_$_SessionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionList = null,
    Object? activeSession = freezed,
  }) {
    return _then(_$_SessionState(
      sessionList: null == sessionList
          ? _value._sessionList
          : sessionList // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      activeSession: freezed == activeSession
          ? _value.activeSession
          : activeSession // ignore: cast_nullable_to_non_nullable
              as Session?,
    ));
  }
}

/// @nodoc

class _$_SessionState implements _SessionState {
  const _$_SessionState(
      {required final List<Session> sessionList, required this.activeSession})
      : _sessionList = sessionList;

  final List<Session> _sessionList;
  @override
  List<Session> get sessionList {
    if (_sessionList is EqualUnmodifiableListView) return _sessionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessionList);
  }

  @override
  final Session? activeSession;

  @override
  String toString() {
    return 'SessionState(sessionList: $sessionList, activeSession: $activeSession)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionState &&
            const DeepCollectionEquality()
                .equals(other._sessionList, _sessionList) &&
            (identical(other.activeSession, activeSession) ||
                other.activeSession == activeSession));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_sessionList), activeSession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionStateCopyWith<_$_SessionState> get copyWith =>
      __$$_SessionStateCopyWithImpl<_$_SessionState>(this, _$identity);
}

abstract class _SessionState implements SessionState {
  const factory _SessionState(
      {required final List<Session> sessionList,
      required final Session? activeSession}) = _$_SessionState;

  @override
  List<Session> get sessionList;
  @override
  Session? get activeSession;
  @override
  @JsonKey(ignore: true)
  _$$_SessionStateCopyWith<_$_SessionState> get copyWith =>
      throw _privateConstructorUsedError;
}
