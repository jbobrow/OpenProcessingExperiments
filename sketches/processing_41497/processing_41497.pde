
import ddf.minim.*;
float colour1 = 232;
float colour2 = 255;
float colour3 = 255;
float dist1 = 100;
Minim m;
AudioPlayer clap1;

int clicked = 0;

void setup() {
  size(700,400);
  background(0);
  m = new Minim(this);
  clap1 = m.loadFile("808-clap.wav");
}

void draw() {
  background(0);
  smooth();

  fill(255,colour2,colour3);
  ellipse(mouseX + dist1,mouseY,70,70);
  ellipse(mouseX - dist1,mouseY,70,70);

  fill(255);
  ellipse(70,330,50,50);
  ellipse(180,330,50,50);

  ellipse(70,60,35,35);
  ellipse(180,60,35,35);

  if(clicked > 0) {
    if(clap1.isPlaying() == false) {
      clap1.loop(0);
    }
    colour2 = 44 ;
    colour3 = 12;
    dist1 = 35;

    clicked = clicked - 1;
  } else {
    dist1 = 100;
    colour2 = 255;
    colour3 = 255;
  }
}

void mousePressed() {
  if(clicked == 0) {
    clicked = 8;
  }
}



