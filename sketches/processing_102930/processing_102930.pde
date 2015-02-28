
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
float time = 0;
boolean press = false;

void setup() {
  size(400, 400);
  background(0);
  frameRate(25);
  minim = new Minim(this);
  player = minim.loadFile("atmos1.wav");
}


void draw() {
  if (press) {

    float d = map(dist(width/2, height/2, mouseX, mouseY), 0, 290, 0, 1);

    player.setGain(map(d, 0, 1, -20, 14));
    //Gain's unit is dB and range is -80.0 to 14.0
    
    if (player.position() + 100 > player.length()){
     player.rewind(); 
    }

    time = time + 0.01;
    background(0);
    translate(width/2, height/2);
    int r = int(map(mouseX, 0, 400, 0, 255));
    int g = int(map(mouseY, 0, 400, 0, 255));

    for (int i = 0; i < 20; i ++) {
      rotate(time);
      noFill();
      int b = int(i*255/20);
      stroke(r, g, b);
      rect(i, i, i*8*d, i*8*d);
    }
  }
}

void mousePressed() {

  press = !press;

  if (press) {
    player.play();
  } 
  else {
    player.pause();
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}


