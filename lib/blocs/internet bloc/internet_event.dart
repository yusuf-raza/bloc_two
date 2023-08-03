/*
* this class won't be used anywhere (it won't be instantiated, so keeping it abstract
* */
abstract class InternetEvent {}

class InternetGainedEvent extends InternetEvent {}

class InternetLostEvent extends InternetEvent {}
