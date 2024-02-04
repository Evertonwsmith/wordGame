class challengeModel {
  late String challenger;
  late List<dynamic> challenged;
  late String secretWord;
  late int length;
  late int guesses;
  late String status;
  late String date;
  late String state;
  late int id;

  //TODO: implement to return useable state
  String createState(challengeModel cm){
    return "%"+cm.challenger+"%"+cm.challenged.toString()+"%"+cm.secretWord+"%"+cm.length.toString()+"%"
        +cm.guesses.toString()+"%"+cm.status+"%"+cm.date+"%"+cm.id.toString();
  }
  challengeModel returnState(String state){
    List<String> params = state.split('%');
    challengeModel result = challengeModel(challenger: params[1],
    challenged: params[2].split(','), secretWord: params[3], length: int.parse(params[4]),
    guesses: int.parse(params[5]), status: params[6], date: params[7], state: state, id: -1);
    return result;
  }
  challengeModel(
      {required this.length,
      required this.guesses,
      required this.status,
      required this.date,
      required this.state,
      required this.challenger,
      required this.challenged,
      required this.secretWord,
      required this.id});
}
