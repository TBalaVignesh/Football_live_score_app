class FootballMatch{

  Fixture fixture;
  Team home;
  Team away;
  Goal goal;

  FootballMatch(this.fixture, this.home, this.away, this.goal);
  
  factory FootballMatch.fromJson(Map<String,dynamic> json){
    return FootballMatch(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.fromJson(json['goals'])
    );
  }
}
class Fixture{
  int id;
  String date;
  Status status;

  Fixture(this.id, this.date, this.status);
  
  factory Fixture.fromJson(Map<String,dynamic> json){
    return Fixture(json['id'], json['date'], Status.fromJson(json['status']));
  }
}
class Status{
  int elapsed;
  String long;

  Status(this.elapsed, this.long);

  factory Status.fromJson(Map<String,dynamic> json){
    return Status(json['elapsed'], json['long']);
  }
}
class Team{
  int id;
  String name;
  String logo;
  var winner;

  Team(this.id, this.name, this.logo, this.winner);

  factory Team.fromJson(Map<String,dynamic> json){
    return Team(json['id'], json['name'], json['logo'], json['winner']);
  }
}
class Goal{
  int home;
  int away;

  Goal(this.home,this.away);

  factory Goal.fromJson(Map<String,dynamic> json){
    return Goal(json['home'], json['away']);
  }

}