
// Sketch by Olivia Güthling
// - T R I M U R T I -
// Bahcesehir University 2012
// "Interactive Arts & Design", Burak Tamer
// 
// Use mousemovements to activate different squares
// Save .png with Mouse Press
// listen to music while using this code or speak to the microfone

// MOUSE
// move       : activate animations
// press      : save png

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//INNOCENCE
float speed1 = 0.0008;
float r1 = 3.145;
float branchLength = 95;
int numBranches = 6;

// CLARITY
int a, c, d;
int reihe;
float z;
int quantity = 6;

float[] xpos = new float [quantity];
float[] ypos = new float [quantity];
float[] yposinc = new float [quantity];
float[] speed3 = new float [quantity];
float[] phase = new float [quantity];
float[] phaseinc = new float [quantity];

//PASSION
bolt b;
float xn;
float yn;
float sound;

PImage Passion;
PImage Clarity;
PImage Innocence;


//SOUND
Minim minim;
AudioInput in;


void setup() {
  size(1200, 600);
  cursor(CROSS);
  //noCursor();
  background(0);
  smooth();


  //PICTURES
  Passion= loadImage ("PASSION.png");
  imageMode (CENTER);
  Clarity = loadImage ("CLARITY.png");
  imageMode (CENTER);
  Innocence = loadImage ("INNOCENCE5.png");
  imageMode (CENTER);


  //CLARITY
  for (int i=0; i<quantity; i++) {
    ypos [i] = random(height);
    yposinc[i] = random(2, 6);
    speed3[i] = random(1, 13);    
    phase [i] = i;
    phaseinc [i] = random (1, 7);
  }


  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO);
}



void draw() {

  //INNOCENCE
  noStroke();
  fill(#111111, 4);
  rect(0, 0, width, height);


  if ((mouseX > 0) && (mouseX<400)) {
    fractal(mouseX+100, mouseY--, -HALF_PI, numBranches);
    r1 += speed1;
  }

  if ((mouseX > 400) && (mouseX<800)) {
    secondcode();
  }

  if ((mouseX > 800) && (mouseX<1200)) {
    thirdcode ();
  }

  if ((keyPressed) == true) {
    fractal(mouseX+100, mouseY--, -HALF_PI, numBranches);

    secondcode();
    thirdcode();
  }
}


void fractal(float x, float y, float a, int c)
{
  image (Innocence, 200, 570);

  float nx = x + branchLength  * sin(a);
  float ny = y + branchLength  * cos(a);

  if (c >= 1 && c != 8) {    
    strokeWeight(abs(in.left.get(1)*150));


    stroke(#ffffff, 100);
    line(x, y, nx, ny);
  }


  if (c < numBranches) {
    stroke(#19888C, 90);
    fill(#ffffff, 250);

    noStroke();
    stroke(#2EF7FF, 20);
    fill(#19888C, 8);
  }

  if (c > 0) {
    fractal(nx, ny, (a + r1 / 2) * -3, c - 1);
    fractal(nx, ny, (a - r1 / 1) * -3, c - 1);
  }
}


// PASSION
//  frameRate(40);
void secondcode() {

  //  xn = random(mouseX-20, mouseX+20);
  // xn = random(mouseX-20, mouseX+20);
  xn= random(mouseX-20, mouseX+20);
  yn = 610; //hier
  b = new bolt(xn, yn, 1);
  b.draw();
  noStroke();
  fill(0, 13);
  rect(0, 0, width, height);
}

class bolt {
  float boltwidth;
  float l;
  float theta;
  float x0, y0, x1, y1;
  bolt(float x00, float y00, float bwidth) {
    boltwidth = bwidth;
    x0 = x00;
    y0 = y00;
    l = random(40, 60);
    theta = random(-HALF_PI, HALF_PI);
    x1 = x0-l*sin(theta);
    y1 = y0-l*cos(theta);
  }


  void draw() {

    sound=abs(in.left.get(1)*150);

    if (x0 >= 1 && x0 != 8) {
      strokeWeight(sound);
      if (sound>20) {
        background (0);
      }  
      image (Passion, 600, 570);

      stroke(229);
      line(x0, y0, x1, y1);
      //       ellipse(x1,y1,2,2);
      if (y1>0) {
        new bolt(x1, y1, 2).draw();
      }
    }
  }
}


// CLARITY

void thirdcode () {

  fill (0, 100);
  rect (0, 0, width, height);
  sound=abs(in.left.get(1)*150);

  for (int i=0; i<quantity; i++) {
    xpos [i] = mouseX;
    stroke(255);

    if (i >= 1 && i != 8) {
      fill (0, 50);
      strokeWeight(sound);
      // xpos[i]=random((mouseX-65), (mouseX+65));

      image (Clarity, 1000, 570);

      for (float a=0; a<=100; a+=3) {
        pushMatrix (); 
        translate (xpos[i]+sin(radians(phase[i]))*100, ypos[i]+yposinc[i]);
        rotate (a);
        fill(0, 180);
        line (0, 0, 0, 10+random(18));
        popMatrix ();
      }
      yposinc[i]-=speed3[i];
      phase[i]+=phaseinc[i];

      if ((ypos[i]+yposinc[i])<0) {
        ypos [i] = height+50;
        yposinc[i] = random(12, 14);
        speed3[i] = random(5, 10);
      }
    }
  }
}


void mousePressed () {
  saveFrame("Pro_####.jpg");
}


void stop()
{
  in.close();
  minim.stop();

  super.stop();
}



