
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Rock petRock;      //for the class
Minim backgroundMusic;    //trying a Minim thing, for science
AudioPlayer player;        //for playing the WAV

void setup() {
  size(300, 300);
  petRock = new Rock(150, 150);
  //backgroundMusic = new Minim(this);
  //player = backgroundMusic.loadFile("bgMusic.wav", 2048);      //load a file. Works but the music is obnoxious. 
  //player.play();                                               //play the file
  //player.loop();                                               //loop annoying noises forever
}

void draw() {
  petRock.display();            //places Rock on the screen
  petRock.stateRock();        //controls the State attribute/action
}

class Rock {
  PImage rk, tx;
  int x, y;
  int pol = 70;
  int play = 100;
  float mood = 100;
  int passTime = millis() + 1000;
  
  int rockText;

  Rock(int xpos, int ypos) {
    rk = loadImage("rock.png");
    tx = loadImage("fineText.png");
    x = xpos;
    y = ypos;
  }

  void display() {
    background(0);
    image(rk, x, y);
    image(tx, 20, 40);
    
    if (pol < 40) {
      rk = loadImage("dirtyRock.png");
      tx = loadImage("dirtyText.png");
    } 
    else if (pol > 39 && pol < 80) {
      rk = loadImage("rock.png");
      tx = loadImage("fineText.png");
    } 
    else if (pol > 81) {
      rk = loadImage("polishRock.png");
      tx = loadImage("polishText.png");
    }
  }

  void stateRock() {
    if (millis() >= passTime) {
      pol -= 1;
      play -= 1;
      mood -= .5;
      passTime = millis() + 1000;
      println("Polish" + "=" + pol);
      println("Play" + "=" + play);
      println("Mood" + "=" + mood);
    }

    if (key == CODED) {
      if (keyPressed == true) {
        if (keyCode == UP) {
          pol += 1;
        }
        if (keyCode == DOWN) {
          play += 1;
        }
        if (keyCode == LEFT) {       //scold, try to play a bad noise
          mood -= 1;
        }
        if (keyCode == RIGHT) {      //praise, play good noise
          mood += 1;
        }
      }
    }
  }
}



