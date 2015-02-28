
import processing.serial.*;
import ddf.minim.*;
import processing.video.*;

Capture cam;
PImage spiegel;

color trackColor = color(255,0,0);
color trackColor2 = color(0,0,255);

AudioPlayer klik, roterendeklik, succes, verkeerd;
Minim minim; 
Movie myMovie;

int counter, counter2 = 0;
int stage = 0;

PImage[] puzzles;
PImage[] masks;
PImage backdrop, intro, einde;

PImage pijllinks, pijlrechts, pijl2, pijl1;

int selection = 4;

int[] rads = { 
  -40, 200, 20, 60, 60
};

void setup() {
  minim = new Minim(this);
  klik = minim.loadFile("klik.mp3");
  roterendeklik = minim.loadFile("roterendeklik.mp3");
  succes = minim.loadFile("succes.mp3");
  verkeerd = minim.loadFile("verkeerd.mp3");
  imageMode(CENTER);
  intro = loadImage("intro.jpg");
  einde = loadImage("einde.jpg");
  puzzles = new PImage[5];
  masks = new PImage[5];
  for ( int t=0; t < 5; t++ ) {
    puzzles[t] = loadImage("puzzle" + str( t+1 ) + ".jpg");
    masks[t] = loadImage("puzzle" + str( t+1 ) + "mask.jpg");
  }  

  size(1200, 700, P2D);
  cam = new Capture(this, 500, 480, 60);
  spiegel = createImage (500, 480, RGB);
}

void draw() {    
  switch(stage) {
  case 0:
    background(0, 0, 0);
    image(intro, 700, height/2);
    break;

  case 1:
    background(0, 0, 0);

    if (cam.available() == true) {
      cam.read();
    }
    cam.loadPixels();
  
  int bestRedindex = 0;
  int bestBlueindex = 0;

  float bestScore = 50000; // heel groot getal

  for (int i = 0; i < cam.pixels.length; i ++ ) {

    float distance = colorDist(cam.pixels[i], trackColor);

    if (distance < bestScore) {

      bestScore = distance;

      bestRedindex = i;

    }

  }
  
    for (int t = 0; t < cam.pixels.length; t ++ ) {

    float distance = colorDist(cam.pixels[t], trackColor2);

    if (distance < bestScore) {

      bestScore = distance;

      bestBlueindex = t;

    }

  }
    
    for (int i = 0; i <cam.pixels.length; i++) {
      spiegel.pixels[i] = cam.pixels[cam.width + (cam.width*(i/cam.width)) - 1 - i%cam.width]; //hier gebeurd de spiegel magie.
    }
    spiegel.updatePixels();
    image(spiegel, 280, height/2);
    
    int bestRedX = bestRedindex % cam.width;
int bestRedY = bestRedindex / cam.width;

int bestBlueX = bestBlueindex % cam.width;
int bestBlueY = bestBlueindex / cam.width;

stroke(0);
line(bestRedX, bestRedY, bestBlueX, bestBlueY);
    
    for ( int t = 0; t < rads.length; t++ ) {
      rads[t]%=360;
    }
    selection = constrain( selection, 0, 4 );
    for ( int t = 4; t >= 0; t-- ) {
      pushMatrix();
      translate(850, height/2);
      tint(255, (selection==t)?255:153);
      rotate(radians(rads[t]));
      puzzles[t].mask(masks[t]);
      image(puzzles[t], 0, 0);
      popMatrix();
    }
    break;

  case 2:
    fill(0, 10);
    rectMode(CORNER);
    rect(0, 0, width, height);
    counter++;
    if (counter > 10) {
      stage = 3;
    }
    break;

  case 3:
    background(0);
    image(einde, 700, height/2);
    break;

  case 4:
    rectMode(CORNER);
    fill(0, 0, 0);
    rect(0, 0, width, height);
    selection = 4;
    rads[0] = -40;
    rads[1] = 200;
    rads[2] = 20;
    rads[3] = 60;
    rads[4] = 60;
    counter = 0;
    counter2 = 0;
    stage = 0;
    break;
  }
}

void keyPressed() {
  switch(stage) {
  case 0:
    if (key == ' ') {
      stage = 1;
    }
    break;

  case 1:
    if (key == CODED) {
      if (keyCode == DOWN) {
        roterendeklik.play();
        selection++;
        roterendeklik.rewind();
      }
      if (keyCode == UP) {
        roterendeklik.play();
        selection--;
        roterendeklik.rewind();
      }
      if (keyCode == RIGHT) {
        klik.play();
        switch( selection ) {
        case 0:
          rads[0]+=10;
          break;
        case 1:
          rads[1]+=10;
          break;
        case 2:
          rads[2]+=10;
          break;
        case 3:
          rads[3]+=10;
          break;
        case 4:
          rads[4]+=10;
          break;
        }
        klik.rewind();
      }
      else if (keyCode == LEFT) {
        klik.play();
        rads[selection]-=10;
        klik.rewind();
      }
    }
    if (key == ENTER || key == RETURN) {
      if (rads[0] == 0 && rads[1] == 0 && rads[2] == 0 && rads[3] == 0 && rads[4] == 0) {
        stage = 2;
        succes.play();
        delay(2000);
        succes.rewind();
      }
      else {
        verkeerd.play();
        delay(1000);
        verkeerd.rewind();
      }
    }

    break;
  case 3:
    if (key == ENTER || key == RETURN) {
      stage = 4;
    }
  }
}

float colorDist(color c1, color c2){

  return dist(red(c1), green(c1), blue(c1), red(c2), green(c2), blue(c2));

}

