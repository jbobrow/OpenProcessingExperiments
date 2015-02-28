
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer ap;
Minim minim;

PImage img;

void setup() {
  size(600, 600);
  smooth();

  minim = new Minim(this);
  ap = minim.loadFile("Parklife.mp3");
  ap.play();

  img = loadImage("blur.png");
}

void draw() {

  float level = ap.mix.level();
  float r = level * width;

  background(constrain(120-r*6, 0, 50), constrain(r*2, 0, 255), constrain(r*4, 0, 255), constrain(r, 0, 255) );


  noStroke();
  fill(0);
  ellipse(width/4, height/4, constrain(r, 0, 200), constrain(r, 0, 200));
  image(img, 85, 240);
  img.resize(150, 80);


  noFill();
  stroke(255, 102, 0);
  strokeWeight(constrain(level*150, 10, 15));

  line(100, constrain(r*7, 500, 600), 100, 600); 
  line(200, constrain(r*6, 400, 600), 200, 600); 
  line(300, constrain(r*5, 300, 600), 300, 600); 
  line(400, constrain(r*4, 200, 600), 400, 600); 
  line(500, constrain(r*3, 100, 600), 500, 600); 

  line(50, constrain(r*9, 550, 600), 50, 600); 
  line(150, constrain(r*8, 450, 600), 150, 600); 
  line(250, constrain(r*7, 350, 600), 250, 600); 
  line(350, constrain(r*6, 250, 600), 350, 600); 
  line(450, constrain(r*5, 150, 600), 450, 600); 
  line(550, constrain(r*4, 50, 600), 550, 600);

  if (level == 0) {
    background (0);
    strokeWeight(0);
  }
}

void stop()
{
  minim.stop();

  super.stop();
}


