
/*
World population growth rate by Lydier Han

 Original code source from Pawel Tokarz, Ka Kit Cheong
 Interactive Design 3 
 Instructor - Modified by Michael Kontopoulos
 */

//year count
int yearCount;

//map
PImage worldMap;
PFont knockout;
PFont aka;

//gif animation
import gifAnimation.*;
PImage[] animation;
Gif nonLoopingGif;
boolean pause = false;
color(HSB);
//particle 2
Particle[] particleArray = new Particle[100];

//particle3
float posStep = 5.1;
int   nParticles = 8000;
Particle[] particles;

void setup() {
  size(780, 480);
  smooth();
  colorMode(HSB, 360, 100, 100);
  frameRate(100);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  
  //gif animation
  Gif myAnimation = new Gif(this, "lavalamp.gif");
  myAnimation.play();

  knockout = loadFont("Knockout-HTF27-200.vlw");
  aka = loadFont("AkzidenzGroteskBQ-BdCndAlt-48.vlw");
  nonLoopingGif = new Gif(this, "lavalamp.gif");
  nonLoopingGif.play();
  nonLoopingGif.ignoreRepeat();
  // create the PImage array for the interactive display
  animation = Gif.getPImages(this, "lavalamp.gif");

  //particle2
  particles = new Particle[nParticles];

  for (int i=0; i<nParticles; i++) {
    particles[i] = new Particle();
  }

  for (int n = 0; n < 100; n ++) {
    particleArray[n] = new Particle ();
  }
}

void draw() {
  background(#231f20);
  image(nonLoopingGif, width/2 , height / 2 - 55 );
  textFont(knockout, 48);
  fill(255); //red 
  text(yearCount, width/2, 350);
  yearCount = int(millis()/2000 + 2010); //Declaring initial countdown year.

  textFont(aka, 12);
  fill(#cc0000); //red 
  text("The World Population Growth Rate: 1.14% [2013]", width/2, 400);


  //foreground particle
  for (int n = 0; n < 100; n++) {
    particleArray[n].particleMove();
    particleArray[n].particleDisplay();
  }

  //  background particle;
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  translate(width/2, height/2);

  for (int i=0; i<nParticles; i++) {
    particles[i].update();
    particles[i].show();
  }
}

void mousePressed() {
  nonLoopingGif.play();
  redraw();
}


void keyPressed() {
  if (key == ' ') {
    if (pause) {
      nonLoopingGif.play();
      pause = false;
    } 
    else {
      nonLoopingGif.pause();
      pause = true;
    }
  }
}

class Particle {
  PVector pos;
  float angle;
  float dRange;
  float dAngle;
  color c;
  //  PVector pos;
  int x;            
  int y;

  Particle() {
    pos = new PVector(0, 0);
    angle  = random(TWO_PI);
    dRange = 1;
    dAngle = 0;   
    //c = color(random(255),random(255),random(255));
  }

  void update() {
    float cor = dRange*atan(15*dAngle)/PI;
    float randNum = (random(2)-1)*dRange-cor;  //Random number from (-dRange, dRange)
    dAngle+=randNum;                       //We don't change the angle directly
    angle+=dAngle;                         //new angle is angle+dAngle
    pos.x+=posStep*cos(angle);            //just move on step
    pos.y+=posStep*sin(angle);
  }



  void particleDisplay() {   //particle2
    noStroke();
    fill(0, 150, 175, 125); //red 
    pushMatrix();
    translate(width/2-35, height/2+40);
    ellipse(x, y, 3, 3);
    popMatrix();

    pushMatrix();
    translate(width/2-100, height/2-60);
    ellipse(x, y, 3, 3);
    popMatrix();

    pushMatrix();
    translate(width/2-110, height/2-40);
    ellipse(x, y, 2, 2);
    popMatrix();
    
       pushMatrix();
    translate(width/2-60, height/2-40);
    ellipse(x, y, 1, 1);
    popMatrix();

    pushMatrix();
    translate(width/2+90, height/2-10);
    ellipse(x, y, 2, 2);
    popMatrix();

    pushMatrix();
    translate(width/2+50, height/2+30);
    ellipse(x, y, 2, 2);
    popMatrix();

    pushMatrix();
    translate(width/2, height/2-160);
    ellipse(x, y, 4, 4);
    popMatrix();

    pushMatrix();
    translate(width/2-40, height/2-150);
    ellipse(x, y, 2, 2);
    popMatrix();

  
  }

  void particleMove() {      //function that moves particle objects
    int choice = int(random(4));

    if (choice == 0) {         //particle objects move according random number generated before
      x = x + 1;
    }
    else if (choice == 1) {
      x = x - 1;
    }
    else if (choice == 2) {
      y = y + 1;
    }
    else {
      y = y - 1;
    }
  }

  //background particle
  void show() {
    pushMatrix();
    translate(0, -50);
    fill(0); 
    noStroke();
    ellipse(pos.x, pos.y, random(1), random(1));
    popMatrix();
  }
}



