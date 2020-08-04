import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harpy/components/application/bloc/application_event.dart';
import 'package:harpy/components/application/bloc/application_state.dart';
import 'package:harpy/components/authentication/bloc/authentication_bloc.dart';
import 'package:harpy/core/theme/harpy_theme.dart';
import 'package:harpy/core/theme/predefined_themes.dart';
import 'package:meta/meta.dart';

/// The [ApplicationBloc] contains application level state and handles
/// initialization of the app upon start.
class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc({
    @required this.authenticationBloc,
  }) {
    add(const InitializeEvent());
  }

  final AuthenticationBloc authenticationBloc;

  /// The [HarpyTheme] used in the root [MaterialApp].
  HarpyTheme harpyTheme = predefinedThemes.first;

  static ApplicationBloc of(BuildContext context) =>
      BlocProvider.of<ApplicationBloc>(context);

  @override
  ApplicationState get initialState => const AwaitingInitializationState();

  @override
  Stream<ApplicationState> mapEventToState(
    ApplicationEvent event,
  ) async* {
    yield* event.applyAsync(currentState: state, bloc: this);
  }
}
