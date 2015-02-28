
/*=======================Pokémon Rock Paper Scissors=======================*/
/*==  Instructions:                                                      ==*/
/*==                                                                     ==*/
/*==  Like rock paper scissors, each Pokémon beats another. Grass beats  ==*/
/*==  Water which bets Fire which beats Grass.                           ==*/
/*==                                                                     ==*/
/*==  Bulbasaur - Grass                                                  ==*/
/*==  Squirtle - Water                                                   ==*/ 
/*==  Charmander - Fire                                                  ==*/
/*==                                                                     ==*/
/*==  Press the button that corresponds with the Pokémon that wins the   ==*/
/*==  rock paper scissors. Look at the example below. Squirtle is Water  ==*/
/*==  so it beats Charmander. The faster you click, the more points you  ==*/
/*==  get.                                                               ==*/
/*==                                                                     ==*/
/*==  BEST > GREAT > GOOD > OKAY > WRONG                                 ==*/
/*==                                                                     ==*/
/*==  The commented out code below was due to a possibility of           ==*/
/*==  implementing a high score system.                                  ==*/
/*==                                                                     ==*/
/*==  ~Code by Carolina Zarate~                                          ==*/
/*==  ~Music compiled from http://pokemongamemusic.tumblr.com/~          ==*/
/*==                                                                     ==*/
/*=========================================================================*/


import ddf.minim.*;
import java.util.*;
import java.io.File;

AudioPlayer player;
Minim minim;

File f = new File("highscores.txt");
PrintWriter output;

PImage bulbasaur;
PImage charmander;
PImage squirtle;
PImage beat;
PImage play;

PFont font;

String screen = "start";
String name = "";
int count = 0;

int timer = 0;
int timer2 = 99999999;
int timer3 = 0;
int timepress = 0;

int rand1 = 0;
int rand2 = 0;

int score = 0;
String result = "";

boolean begin = true;
boolean cont = false;
boolean drawnow = false;
boolean nopress = false;

/*String[][] highscores = new String[11][2];*/

void setup() {
  size(640, 480);

  minim = new Minim(this);
  player = minim.loadFile("PokemonMusic.mp3", 2048);
  player.play();
  player.loop();

  bulbasaur = loadImage("bulbasaur.png");
  squirtle = loadImage("squirtle.png");
  charmander = loadImage("charmander.png");
  beat = loadImage("beat.png");
  play = loadImage("play.png");

  font = loadFont("GameOver.vlw");

  /*loadData();*/
}



void draw() {
  background(125);

  if (screen.equals("start")) {
    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("POKÉMON ROCK PAPER SCISSORS", width / 2, 60);

    fill(60, 87, 164);
    textFont(font, 100);
    text("PLAY", width / 2, 380);
    /*text("HIGH SCORES", width / 2, 440);*/

    image(bulbasaur, width / 4 - 42.5, 200, 100, 85);
    image(squirtle, width / 2 - 40.5, 200, 100, 81);
    image(charmander, 3 * width / 4 - 43.75, 200, 100, 87.5);

    if (mouseX > width / 2 - 60 && mouseX < width / 2 + 60 && mouseY > 340 && mouseY < 390) {
      noStroke();
      rect(width / 2 - 60, 340, 120, 50);
      fill(255, 204, 3);
      text("PLAY", width / 2, 380);

      if (mousePressed) {
        screen = "instructions1";
      }
    }
    /*else if (mouseX > width / 2 - 60 && mouseX < width / 2 + 60 && mouseY > 400 && mouseY < 450) {
      fill(60, 87, 164);
      noStroke();
      rect(width / 2 - textWidth("HIGH SCORES") /  2, 480, textWidth("HIGH SCORES" + 40), 50);
      fill(255, 204, 3);
      text("HIGH SCORES", width / 2, 440);

      if (mousePressed) {
        screen = "end";
      }
    }*/
  }
  else if (screen.equals("instructions1")) {
    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("INSTRUCTIONS", width / 2, 60);

    fill(60, 87, 164);
    noStroke();
    rect(50, 100, 540, 330, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(LEFT);
    textFont(font, 50);
    text("Like rock paper scissors, each Pokémon beats another.", 60, 130);
    text("Grass beats Water which beats Fire which beats", 60, 150);
    text("Grass.", 60, 170);
    image(beat, width / 2 - 75.63, 200, 200, 151.27);

    textAlign(CENTER);
    textFont(font, 100);
    text("Next", 520, 410);

    textAlign(CENTER);
    textFont(font, 100);
    text("Prev", 120, 410);

    if (mouseX > 470 && mouseX < 570 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(470, 370, 100, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Next", 520, 410);

      if (mousePressed) {
        screen = "instructions2";
        timer = millis();
      }
    }
    else if (mouseX > 70 && mouseX < 180 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(70, 370, 100, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Prev", 120, 410);
      if (mousePressed && millis() - timer > 200) {
        screen = "start";
      }
    }
  }
  else if (screen.equals("instructions2")) {
    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("INSTRUCTIONS", width / 2, 60);

    fill(60, 87, 164);
    noStroke();
    rect(50, 100, 540, 330, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(LEFT);
    textFont(font, 50);
    text("Bulbasaur - Grass", 60, 130);
    text("Squirtle - Water", 60, 220);
    text("Charmander - Fire", 60, 310);
    image(bulbasaur, width / 2 - 40, 120, 80, 68);
    image(squirtle, width / 2 - 40, 210, 80, 64.8);
    image(charmander, width / 2 - 40, 300, 80, 70);

    textAlign(CENTER);
    textFont(font, 100);
    text("Next", 520, 410);

    textAlign(CENTER);
    textFont(font, 100);
    text("Prev", 120, 410);

    if (mouseX > 470 && mouseX < 570 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(470, 370, 100, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Next", 520, 410);

      if (mousePressed && (millis() - timer > 200)) {
        screen = "instructions3";
        timer = millis();
      }
    }
    else if (mouseX > 70 && mouseX < 180 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(70, 370, 100, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Prev", 120, 410);
      if (mousePressed && millis() - timer > 200) {
        screen = "instructions1";
        timer = millis();
      }
    }
  }
  else if (screen.equals("instructions3")) {
    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("INSTRUCTIONS", width / 2, 60);

    fill(60, 87, 164);
    noStroke();
    rect(50, 100, 540, 330, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(LEFT);
    textFont(font, 50);
    text("Press the button that corresponds with the Pokémon", 60, 130);
    text("that wins the rock paper scissors. Look at the", 60, 150);
    text("example below. Squirtle is Water so it beats Charmander.", 60, 170);
    text("The faster you click, the more points you get.", 60, 190);
    image(play, width / 2 - 100, 220, 200, 151.27);

    textAlign(CENTER);
    textFont(font, 100);
    text("Play", 520, 410);

    textAlign(CENTER);
    textFont(font, 100);
    text("Prev", 120, 410);

    if (mouseX > 470 && mouseX < 570 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(470, 370, 100, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Play", 520, 410);

      if (mousePressed && (millis() - timer > 200)) {
        screen = "play";
        timer = millis();
      }
    }
    else if (mouseX > 70 && mouseX < 180 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(70, 370, 100, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Prev", 120, 410);
      if (mousePressed) {
        screen = "instructions2";
        timer = millis();
      }
    }
  }
  else if (screen.equals("play")) {
    if (millis() - timer2 > 2000) {
      begin = false;
      cont = true;
      drawnow = false;
      timer2 = 9999999;
      result = "";
      nopress = false;
      if (count == 10) {
        screen = "end"/*"score"*/;
      }
    }

    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("POKÉMON ROCK PAPER SCISSORS", width / 2, 60);

    if (begin && !cont && (millis() - timer > 1000)) {
      textAlign(LEFT);
      textFont(font, 120);

      if (millis() - timer > 2000) {
        text("READY", width / 2 - textWidth("READY") / 2, 170);
      }

      if (millis() - timer > 3000) {
        text("SET", width / 2 - textWidth("SET") / 2, 210);
      }

      if (millis() - timer > 4000) {
        text("GO!", width / 2 - textWidth("GO!") / 2, 250);
      }

      if (millis() - timer > 5000) {      
        begin = false;
        cont = true;
      }
    }

    if (!begin && cont) {
      rand1 = round(random(0.5, 3.5));
      rand2 = round(random(0.5, 3.5));
      timer = millis();
      int mx = 0;
      int my = 0;

      begin = false;
      cont = false;
      drawnow = true;

      timepress = millis();
    }

    if (drawnow) {
      pushMatrix();
      scale(-1.0, 1.0);
      if (rand1 == 1) {
        image(bulbasaur, -(160 + 42.5), 120, 100, 85);
      }
      else if (rand1 == 2) {
        image(squirtle, -(160 + 40.5), 120, 100, 81);
      }
      else if (rand1 == 3) {
        image(charmander, -(160 + 43.75), 120, 100, 87.5);
      }
      popMatrix();

      if (rand2 == 1) {
        image(bulbasaur, 480 - 42.5, 120, 100, 85);
      }
      else if (rand2 == 2) {
        image(squirtle, 480 - 40.5, 120, 100, 81);
      }
      else if (rand2 == 3) {
        image(charmander, 480 - 43.75, 120, 100, 87.5);
      }

      if (result.equals("WRONG.")) {
        fill(255, 0, 0);
      }
      else {
        fill(0, 255, 0);
      }
      textAlign(LEFT);
      textFont(font, 120);
      text(result, width / 2 - textWidth(result) / 2, 170);
      text("Score: " + score, width / 2 - textWidth("Score: " + score) / 2, 240);

      strokeWeight(10);

      fill(255, 128, 0);
      stroke(217, 108, 0);
      rect(75, 300, 150, 150);

      fill(96, 168, 196);
      stroke(65, 145, 175);
      rect(245, 300, 150, 150);

      fill(0, 178, 45);
      stroke(0, 157, 39);
      rect(415, 300, 150, 150);

      strokeWeight(1);

      if (!nopress && (millis() - timer > 200) && mouseX > 65 && mouseX < 235 && mouseY > 290 && mouseY < 460) {
        strokeWeight(10);
        fill(217, 108, 0);
        stroke(255, 128, 0);
        rect(75, 300, 150, 150);
        strokeWeight(1);

        if (mousePressed) {
          timepress = millis() - timepress;
          score = score + timescore(timepress, 1);
          count++;
          timer = millis();
          timer2 = millis();
          nopress = true;
        }
      }

      if (!nopress && (millis() - timer > 200) && mouseX > 235 && mouseX < 405 && mouseY > 290 && mouseY < 460) {
        strokeWeight(10);
        fill(65, 145, 175);
        stroke(96, 168, 196);
        rect(245, 300, 150, 150);
        strokeWeight(1);

        if (mousePressed) {
          timepress = millis() - timepress;
          score = score + timescore(timepress, 2);
          count++;
          timer = millis();
          timer2 = millis();
          nopress = true;
        }
      }

      if (!nopress && (millis() - timer > 200) && mouseX > 405 && mouseX < 555 && mouseY > 290 && mouseY < 440) {
        strokeWeight(10);
        fill(0, 157, 39);
        stroke(0, 178, 45);
        rect(415, 300, 150, 150);
        strokeWeight(1);

        if (mousePressed) {
          timepress = millis() - timepress;
          score = score + timescore(timepress, 3);
          count++;
          timer = millis();
          timer2 = millis();
          nopress = true;
        }
      }
    }
  }
  /*else if (screen.equals("score")) {
    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("YOUR SCORE", width / 2, 60);

    fill(60, 87, 164);
    noStroke();
    rect(50, 100, 540, 330, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(LEFT);
    textFont(font, 50);
    text("Your Score: " + score, 60, 130);
    text("Please enter your name. Press the ENTER button when", 60, 170);
    text("you are finished. BACKSPACE works.", 60, 190);
    text("Maximum of 20 characters.", 60, 210);
    text("" + name, 60, 250);

    if (keyPressed && (millis() - timer3 > 120)) {
      if (key == '\n') {
        if (name.equals("")) {
          name = "-";
        }

        screen = "end";
      }
      else if (key == BACKSPACE) {
        if (name.length() > 1) {
          name = name.substring(0, name.length() - 1);
        }
        else {
          name = "";
        }
        timer3 = millis();
      }
      else if (name.length() <= 20) {
        name = name + key;
        timer3 = millis();
      }
    }
  }*/
  else if (screen.equals("end")) {
    fill(60, 87, 164);
    noStroke();
    rect(50, 20, 540, 50, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(CENTER);
    textFont(font, 80);
    text("SCORE", width / 2, 60);

    fill(60, 87, 164);
    noStroke();
    rect(50, 100, 540, 330, 18, 18, 18, 18);

    fill(255, 204, 3);
    textAlign(LEFT);
    textFont(font, 50);
    text("Your Score: " + score, 60, 130);
    /*text("Highscores", 60, 170);
    for (int i = 0; i < 10; i++) {
      text(highscores[i][0], 60, 190 + 20 * i);
      text(highscores[i][1], 400, 190 + 20 * i);
    }*/

    textAlign(CENTER);
    textFont(font, 100);
    text("Again", 520, 410);

    if (mouseX > 460 && mouseX < 580 && mouseY > 370 && mouseY < 420) {
      fill(255, 204, 3);
      rect(460, 370, 120, 50);
      fill(60, 87, 164);
      textAlign(CENTER);
      text("Again", 520, 410);

      if (mousePressed && (millis() - timer > 200)) {
        screen = "start";
        restart();
      }
    }
  }
}

int timescore(int time, int ans) {
  if (rightans(ans)) {
    if (time < 525) {
      result = "BEST!";
      return 6;
    }
    else if (time < 750) {
      result = "GREAT!";
      return 4;
    }
    else if (time < 1100) {
      result = "GOOD!";
      return 2;
    }
    else {
      result = "OKAY!";
      return 1;
    }
  }
  else {
    result = "WRONG.";
    return -1;
  }
}

boolean rightans(int ans) {
  if (rand1 == 1) {
    if (rand2 == 1) {
      if (ans == 2) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (rand2 == 2) {
      if (ans == 1) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (rand2 == 3) {
      if (ans == 3) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  else if (rand1 == 2) {
    if (rand2 == 1) {
      if (ans == 3) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (rand2 == 2) {
      if (ans == 2) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (rand2 == 3) {
      if (ans == 1) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  else if (rand1 == 3) {
    if (rand2 == 1) {
      if (ans == 1) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (rand2 == 2) {
      if (ans == 3) {
        return true;
      }
      else {
        return false;
      }
    }
    else if (rand2 == 3) {
      if (ans == 2) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  return false;
}

void restart() {
  count = 0;
  timer = 0;
  timer2 = 99999999;
  timepress = 0;

  rand1 = 0;
  rand2 = 0;

  score = 0;
  result = "";
  name = "";

  begin = true;
  cont = false;
  drawnow = false;
  nopress = false;

  /*loadData();*/
}

/*void loadData() {
  String[] lines = loadStrings("highscores.txt");
  for (int i = 0; i < lines.length; i++) {
    String[] split = split(lines[i], "\t");
    highscores[i][0] = split[0];
    highscores[i][1] = split[1];

    println(highscores[i][0] + "\t" + highscores[i][1]);
  }
}

void outputData() {
  if (f.exists()) {
    f.delete();
  }
  output = createWriter("highscores.txt");
  for (int i = 0; i < 10; i++) {
    output.println(highscores[i][0] + "\t" + highscores[i][1]);
  }
  output.flush();
}

void arrangeData() {
  String holdstr = "";
  int holdscr = 0;

  for (int i = 0; i < 10; i++) {
    if (score > highscores[i][1]) {
      holdstr = highscores[i][0];
      holdscr = highscores[i][1];
      for (int j = i + 1, j < 10
    } 
  }
}*/


