
import ddf.minim.*;
float colour1 = 232;
float colour2 = 255;
float colour3 = 255;
float dist1 = 100;
float xpos = 0;
float ypos = 0;

/////// Area 1
int active1 = 0;
float offset = 25;
float xc1 = 50;
float yc1 = 200;

float xc2 = 150;
float yc2 = 200;

AudioPlayer ac1_clap;
//////

Minim m;
AudioPlayer clap1;

int clicked = 0;

void setup() {
  size(700,400);
  background(0);
  m = new Minim(this);
  clap1 = m.loadFile("808-clap.wav");
  ac1_clap = m.loadFile("808-clap.wav");
}

void draw() {
  background(0);
  smooth();
  
  ////Area 1
  noStroke();
  fill(25, 50, 200);
  
  //Take the MODULO
  float temp = (active1 % offset);
  
  ellipse(xc1+temp, yc1, 50, 50);
  ellipse(xc2-temp, yc2, 50, 50);
  if(active1 > 0) {
    active1 = active1 - 2;
    println(active1 + " TEMP: " + temp);
  }
  
  if(temp == 1.0) {
    if(ac1_clap.isPlaying() == false) {
      ac1_clap.loop(0);
    }
  }
  ////
  
  
  fill(255,colour2,colour3);
  ellipse(mouseX + dist1,mouseY,70,70);
  ellipse(mouseX - dist1,mouseY,70,70);

  fill(255);
  //ellipse(random(150, 550), random(100, 300), 30, 30);
  //ellipse(random(150, 550), random(100, 300), 30, 30);
  //ellipse(180,330,50,50);

  //ellipse(xpos,ypos,35,35);
  //xpos = xpos + 1;
  //ypos = ypos + 1;
 

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
    if(dist(mouseX, mouseY, (xc2 - xc1)/2 + xc1, yc1) < 200){
      active1 = active1 +50;
    }
  }  
}

