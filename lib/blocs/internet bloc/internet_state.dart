//making internet state class abstract because it won't be instantiated
//any where
abstract class InternetState {}

class InternetInitialState extends InternetState {}

class InternetGainedState extends InternetState {}

class InternetLostState extends InternetState {}
