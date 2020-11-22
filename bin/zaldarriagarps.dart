import 'dart:io';
import 'dart:math' show Random;
import 'package:emojis/emojis.dart'; // to use Emoji collection
import 'package:emojis/emoji.dart'; // to use Emoji utilities
void main() {
  Game g = new Game();

  String decisions = 'y';



  while (decisions == 'y'){
    print('===============================================================');
    print('This is GAME ${(g.total_games)+1}');
    decisions = g.mainPlay();
    if (g.total_games >= 3){
      print('Current score is now: Bot score = ${g.bot_score} Player score: ${g.player_score}');
    }
  }

  var botS = g.bot_score;
  var playerS = g.player_score;

  if (botS > playerS){
  print("Bot wins!");
  }
  if (playerS > botS){
  print("Player wins!");
  }
  if(playerS == botS){
  print("it's a tie!!");
  }

}
//================================================================================
class Game {
  static String userpick, botpick;
  var player_score, bot_score, total_games;
  Game(){
    player_score = 0;
    bot_score = 0;
    total_games = 0;
  }
  String mainPlay(){

    print('Sir basi wala ga print ang rock nga emoji.. kin witty ko nalang ang bato nga emoji hahaha');
    print("Papel, Gunting, Bato! What's your pick?\n:");
    String player = stdin.readLineSync();
    player.toLowerCase();
    col(player);
    print('');
    print("Bot is picking...\n:");
    var bot = Game.botPick();
    print(bot);
    col(bot);
    userpick = player;
    botpick = bot;
    print('');
    print('Your pick: $player vs Bot pick: $bot ');
    col(player);
    print('vs');
    col(bot);
    print('');


    String winner = judge();

    return winner;
  }


  static String botPick() {
    var list = ['papel', 'gunting', 'bato'];
    final randpick = new Random();
    var bot1 = list[randpick.nextInt(list.length)];
    return bot1;
  }
    Emojis col(String ans){
        if (ans == 'gunting'){
            print('${Emojis.scissors}');
        }
        if (ans == 'papel'){
            print('${Emojis.newspaper}');
        }
        if (ans == 'bato'){
            print('${Emojis.rock}');
            print('pusong bato >> ${Emojis.redHeart}');
        }

    }

   String judge(){

       if ((userpick == 'bato' && botpick == 'gunting') ||
           (userpick == 'papel' && botpick == 'bato') ||
           (userpick == 'gunting' && botpick == 'papel')) 
           {
                print('Player 1 Wins!');
                player_score += 1;
                total_games += 1;

                if (total_games >= 3){
                  print("Do you want to continue? Y/N\n:");
                String ta = stdin.readLineSync();
                ta.toLowerCase();
                return ta;

                }
                return 'y';
           }
       if ((botpick == 'bato' && userpick == 'gunting') ||
          (botpick == 'papel' && userpick == 'bato') ||
          (botpick == 'gunting' && userpick == 'papel')) 
          {
                print('Bot Wins!');
                bot_score += 1;
                total_games += 1;
                if (total_games >= 3){
                  print("Do you want to continue? Y/N\n:");
                String ta = stdin.readLineSync();
                ta.toLowerCase();
                return ta;

                }
                return 'y';
          }
       if (userpick == botpick) 
         {
                total_games += 1;
                print("It's a tie! ");
                if (total_games >= 3){
                  print("Do you want to continue? Y/N\n:");
                String ta = stdin.readLineSync();
                ta.toLowerCase();
                return ta;

                }
                return 'y';
         } 
       if (userpick != 'gunting' || userpick != 'papel' || userpick != 'bato') 
         {
                total_games = 0;
                 print('Invalid user input!');
                 print("Do you want to try again? Y/N\n:");
                  String ta = stdin.readLineSync();
                  ta.toLowerCase();
                  return ta;
         }
  }
}
