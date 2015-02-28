
PFont txt;
float R=0;
boolean play=false;
boolean Guess=true;
float N=0;
import ddf.minim.*;
Minim minim;
AudioPlayer Guess1;

void setup() {
  size(250,250);
  smooth();
  frameRate(60);
  ellipseMode(CENTER);
  txt = loadFont("Dialog.bold-48.vlw");
  minim = new Minim(this);
  Guess1 = minim.loadFile("Woman.mp3", 512);
}

void draw() {
  background(255);

  pushMatrix();
  translate(width/2,height/2);

    if(!play) {
      Guess1.pause();
    }

    rotate(R);
    if (play) {
      R+=.05;
      N=random(-.5,.5);
      Guess1.play();
    }

  fill(5);
  stroke(0);
  ellipse(0,0,210,210);

  fill(255);
  ellipse(0,0,30,30); 

  fill(0);
  ellipse(0,0,1,1);

  noFill(); 
  stroke(90);
  strokeWeight(6);
  ellipse(0,0,40,40);

  for (int i=0; i<80; i+=3) {
    strokeWeight(.2);
    ellipse(0,0,120+i,120+i);
  }

  fill(#ffefc1);
  textFont(txt,35);
  text("L7P3R9",-60,-40);

  stroke(100);
  strokeWeight(1);
  noFill();
  ellipse(0,0,60,60);
  ellipse(0,0,110,110);
  popMatrix();

  pushMatrix();
  translate(width/2,height/2);
  rotate(5.5);
  for (int i=0; i<40; i+=2) {
    fill(200,10);
    noStroke();  
    ellipse(N,70,5,50+i);

    pushMatrix();
    rotate(6.5);
    ellipse(N,60,1,20+i); 
    popMatrix();

    pushMatrix();
    rotate(3.2);
    ellipse(N,60,5,30+i); 
    popMatrix();
  }
  popMatrix();
}

void keyPressed() {
  if(key==' ') {
    if (play) {
      play=false;
    }
    else if (!play) {
      play=true;
    }
  }
}


