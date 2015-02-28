

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
AudioPlayer hic;
AudioPlayer laugh;
AudioPlayer song;

PImage bg;
PImage bird1static;
PImage bird2static;
PImage bird3static;
PImage bird4static;
PImage bird4fire;


PImage[] bird1 = new PImage[3];
PImage[] bird2 = new PImage[5];
PImage[] bird3 = new PImage[8];
PImage[] bird4 = new PImage[3];
//PImage[] bird3dance = new PImage[2];

int numFires = 200;

float[] fireX = new float[numFires];
float[] fireY = new float[numFires];
float[] fireXSpeed = new float[numFires];
float[] fireYSpeed = new float[numFires];

color[] fireColors = new color[numFires];

float gravity;


void setup() {
  size(500, 500);
  smooth();
  noStroke();

  //colorMode(HSB);

  gravity = .1;

  for (int i = 0; i < fireX.length; i++) {
    fireX[i] = 0;
    fireY[i] = 0;
    fireXSpeed[i] = 0;
    fireYSpeed[i] = 0;
  }

  minim = new Minim(this);

  player = minim.loadFile("surfinusa.mp3", 512);
  player.loop();

  hic = minim.loadFile("20471.mp3", 512);
  laugh = minim.loadFile("1982.mp3", 512);
  song = minim.loadFile("abc.mp3", 512);


  bg= loadImage("bg.jpg");
  bird1static= loadImage("bird1.png");
  bird2static= loadImage("bird2.png");
  bird3static= loadImage("bird3.png");
  bird4static= loadImage("bird4.png");
  bird4fire= loadImage("bird4b.png");


  frameRate(24);


  bird1[0] = loadImage("bird1.png");
  bird1[1] = loadImage("bird1a.png");
  bird1[2] = loadImage("bird1b.png");

  bird2[0] = loadImage("bird2a.png");
  bird2[1] = loadImage("bird2.png");
  bird2[2] = loadImage("bird2b.png");
  bird2[3] = loadImage("bird2c.png");
  bird2[4] = loadImage("bird2d.png");

  bird3[0] = loadImage("bird3.png");
  bird3[1] = loadImage("bird3a.png");
  bird3[2] = loadImage("bird3b.png");
  bird3[3] = loadImage("bird3dancea.png");
  bird3[4] = loadImage("bird3danceb.png");
  bird3[5] = loadImage("bird3acopia.png");
  bird3[6] = loadImage("bird3acopia.png");
  bird3[7] = loadImage("bird3acopia.png");

  bird4[0] = loadImage("bird4.png");
  bird4[1] = loadImage("bird4a.png");
  bird4[2] = loadImage("bird4c.png");

}

void draw () {
  background (0);
  image(bg, 0, 0);

  for (int i = 0; i < fireX.length; i++) {

    fireX[i] += fireXSpeed[i];
    fireY[i] += fireYSpeed[i];

    fireYSpeed[i] += gravity;
  }

  for (int i = 0; i < fireX.length; i++) {
    fill(fireColors[i]);
    rect(fireX[i], fireY[i], 5, 5);
  }

  // image(bird1static, 80, 186);
  // image(bird2static, 231, 118);
  // image(bird3static, 386, 126);
  // image(bird4fire, 318, 135);

  if (player.isPlaying() || song.isPlaying()) {

    image(bird1[int(random(3))], 80, 186);
    image(bird2[int(random(5))], 219, 118);
    image(bird3[int(random(8))], 377, 118);
    image(bird4[int(random(3))], 318, 135);
  }else{
      
    image(bird1[int(random(1))], 80, 186);
    image(bird2[int(random(1))], 231, 118);
    image(bird3[int(random(1))], 386, 126);
    image(bird4fire, 318, 135);
  }
}

void mousePressed() {

  if (mouseX > 318 && mouseX < 384 && mouseY > 135 && mouseY < 216) {
    for (int i = 0; i < fireX.length; i++) {

      fireX[i] = mouseX;
      fireY[i] = mouseY;

      fireXSpeed[i] = random(-2, 2);
      fireYSpeed[i] = random(-7, -3);

      fireColors[i] = color(random(255), random(255), random(255));
    }

    image(bird4fire, 318, 135);
    hic.play();
    hic.rewind();
  }
}

void mouseClicked() {
  //if (mouseX > 70 && mouseX < 140 && mouseY > 160 && mouseY < 288) {

  //player.pause();
  //}
  if (player.isPlaying()) { //si esta corriendo y el mouse esta en la zona = pausa
    if (mouseX > 70 && mouseX < 140 && mouseY > 160 && mouseY < 288) {
      player.pause();
      laugh.play();
    }
  } 
  else {
    if (mouseX > 70 && mouseX < 140 && mouseY > 160 && mouseY < 288) {
      player.play();
    }
  }
  
   if (mouseX > 387 && mouseX < 450 && mouseY > 126 && mouseY < 226) {
    song.play();
  }
  
}  

void keyPressed() {
  
  if ( key == 'p' ) {
    song.pause();
  }
}

void stop() {
  player.close();
  hic.close();
  song.close();
  minim.stop();

  super.stop();
}


