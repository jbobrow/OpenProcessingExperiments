
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import controlP5.*; 


// main variable, holds info about levels, score, screen transitions, etc
Game game;

// processing setup
void setup(){ 
  size(600, 600);
  background(255);
  
  noStroke();
  
  // init the game
  game = new Game();
  game.controlP5 = new ControlP5(this);
  game.minim = new Minim(this);
  // prepare the transition to the intro screen
  game.loadNextScreen = true;
  // start the background music
  game.playMusic();
} 

// processing draw
void draw() {
  // if next screen needs to be loaded
  if (game.loadNextScreen) {
    // retrieve the next screen
    game.scr = game.nextScreen(game.scr, game.action);
    game.scr.setupMe();
    game.loadNextScreen = false;
  }
  
  game.scr.drawMe();

  // draw an X on top of the music icon if no music is playing  
  if (!game.song.isPlaying()) {
    stroke(0);
    strokeWeight(3);
    line(20, 20, 40, 40);
    line(20, 40, 40, 20);
  }
}

// handle the mouse clicked event
void mouseClicked() {
  // handle the click on the music icon
  // this will work in all screens
  if (dist(30, 30, mouseX, mouseY) < 30) {
    if (game.song.isPlaying()) {
      game.song.pause();
    } else {
      game.song.play();
    }
  }
  
  // forward the evemt to the current screen
  game.scr.mClicked();
}

// forward the evemt to the current screen
void mousePressed() {
  game.scr.mPressed();
}

// forward the evemt to the current screen
void mouseReleased() {
  game.scr.mReleased();
}

// forward the evemt to the current screen
void mouseDragged() {
  game.scr.mDragged();
}

// forward the evemt to the current screen
void controlEvent(ControlEvent theEvent) {
  game.scr.ctrlEvent(theEvent);
}

