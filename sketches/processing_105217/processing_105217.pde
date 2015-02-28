
/*import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import guru.ttslib.*;
Minim minim;
AudioPlayer player;
TTS tts;*/
int x = 50;
int y = 50;
int count =0 ;
void setup() {
 /* minim = new Minim(this);
  player = minim.loadFile("Pacman_Introduction_Music-KP-826387403.mp3");*/
  size (1920, 1080);
 // tts = new TTS();
}
void draw() {
 // player.play();
  fill(random(255),random(255),random(255));
noStroke();
  if (count==1) {
    fill(0);
    ellipse(100, 400, 2, 2);
    fill(255);
    ellipse(x, y, 50, 50);
textSize(100);
text("YOU WON!!! CONGRATULATIONS!!!", 100, 540);
   // tts.speak("You won! Congratulations!");
    noLoop();
  }
  else {
    background(random(255),random(255),random(255));
    ellipse(x, y, 50, 50);
    ellipse(100, 400, 2, 2);
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      //  background(0);
      fill(255);
      ellipse(x=x+25, y, 50, 50);
      if (x>1920) {
        x=1920;
      }
    }
    else if (keyCode == LEFT) {
      fill(255);
      ellipse(x=x-25, y, 50, 50);
      if (x<0) {
        x=0;
      }
    }
    else if (keyCode == UP) {
      ellipse(x, y=y-25, 50, 50);
      if (y>1080) {
        y=1080;
      }
    }
    else if (keyCode == DOWN) {
      // background(0);
      ellipse(x, y=y+25, 50, 50);
      if (y<50) {
        y=50;
      }
    }
  }
  if (x<50 && x>150 && y<350 && y>450) {
    ellipse(100, 400, 1, 1);
  }
  if (x>50 && x<150 && y>350 && y<450) {
    count=1;
  }
}


