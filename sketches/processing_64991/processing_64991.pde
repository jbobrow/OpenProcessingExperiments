
//Sounding Gig Poster
//by Flo Wilson

import ddf.minim.*;

AudioPlayer player;
Minim minim;

PImage p, p1, p2;
int xRepeat = 200;
int yRepeat = 280;

int w, h;
float space, i;

void setup() 
{
  size(600, 840, P2D);
  minim = new Minim(this);
  player = minim.loadFile("Under the Booty.mp3", 2048);
  player.loop();
  player.play();
}

void draw() {
  myPattern();
}

void myPattern() {

  w = width;
  h = height;
  w = 0;
  h = 0;  

  if(mouseY < 600) {
   p = loadImage("sanfrancoolcultposter.jpeg");
    p.resize(600, 840);
    image(p, 0, 0);
    //filter(GRAY);
    tint(color(random(255), random(255), random(255)), 50);
    smooth();
  }

  if (mouseX < 250) {
    for (int i = 0; i < width/xRepeat; i++) {
      for (int j = 0; j < height/yRepeat; j++) {
        pushMatrix();
        translate(xRepeat*i, yRepeat*j);
        p1 = loadImage("sanfrancoolcultposter.jpeg");
        image(p1, 0, 0);
        tint(color(random(255), random(255), random(255)), 50);
        popMatrix();
        smooth();
      }
    }
  }
  if (mouseX == 300 ) {
    p2 = loadImage("manatee29.jpg");
    image(p2, w-60, h-20);
    smooth();
  }
}


void stop()
{
  player.close();
  minim.stop();
  super.stop();
}


