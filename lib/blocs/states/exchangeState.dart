import 'package:equatable/equatable.dart';
import 'package:exchangex/models/currency_model.dart';
import 'package:exchangex/models/user_model.dart';

abstract class ExchangeState extends Equatable{
  const ExchangeState();

  @override
  List<Object> get props => [];
}

class ExchangeStateInitial extends ExchangeState{}
class ExchangeStateFetching extends ExchangeState{}
class ExchangeStateFailedFetched extends ExchangeState{}

class ExchangeStateSubmittingTransaction extends ExchangeState{}

class ExchangeStateSuccessFetched extends ExchangeState{
  final List<Currency> currenciesList;
  final Currency chosenCurrency;
  final double fromAmount;
  final double toAmount;
  final bool isSell;
  final User user;
  final String message;
  ExchangeStateSuccessFetched(this.user, this.message, {
    required this.currenciesList, required this.chosenCurrency,required this.fromAmount,required this.toAmount, required this.isSell});
  List<Object> get props => [chosenCurrency,isSell,fromAmount,toAmount];
}
