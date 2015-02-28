
import beads.*;

AudioContext   ac;
Gain           g;

PImage spin1;
PImage spin2;
PImage spin3;
PImage spin4;
PImage spin1Slow;
PImage spin2Slow;
PImage spin3Slow;
PImage spin4Slow;

float a = 0;
float b = .15;
float c = .2;
float d = .25;
float slowA = 0;


int circleX, circleY;  // Position of circle button
int circleSize1 = 700; 
int circleSize2 = 560; 
int circleSize3 = 420; 
int circleSize4 = 280; // Diameter of circle

color baseColor;

boolean circleOver1 = false;
boolean circleOver2 = false;
boolean circleOver3 = false;
boolean circleOver4 = false;


//daniel math
float[] diff = new float[20];
int count = 0;
boolean filled = false;
float average = 0;

void setup() {
  size(1024, 768, P3D);
  background(0);
  imageMode(CENTER);
  fill(255, 15);
  noStroke();
  spin1 = loadImage("spin1.png");
  spin2 = loadImage("spin2.png");
  spin3 = loadImage("spin3.png");
  spin4 = loadImage("spin4.png");
  spin1Slow = loadImage("spin1Slow.png");
  spin2Slow  = loadImage("spin2Slow.png");
  spin3Slow  = loadImage("spin3Slow.png");
  spin4Slow = loadImage("spin4Slow.png");
  //
  circleX = width/2;
  circleY = height/2;
  ellipseMode(CENTER);

  //beads
  ac = new AudioContext();
  g = new Gain(ac, 1, 0.5);

  ac.out.addInput(g);
  ac.start();

  String sourceFile = dataPath("finalAudio.mp3");
  try {
    SamplePlayer sp = new SamplePlayer(ac, new Sample(sourceFile));
    sp.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS ); 
     Glide pitchValue = new Glide(ac, 1);
     sp.setPitch(pitchValue);
    
    sp.setKillOnEnd(true);
    
    g.addInput(sp);
    sp.start();
    // sp.loop();
  }
  catch (Exception e) {
    println("Exception loading sample: " + sourceFile);
    e.printStackTrace();
  }
}

void draw() {
  a+=.1;
  b+=.2;
  c+=.3;
  d+=.4;
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  image(spin1, 0, 0);
  popMatrix(); 

  pushMatrix();
  translate(width/2, height/2);
  rotate(b);
  image(spin2, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(c);
  image(spin3, 0, 0);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(d);
  image(spin4, 0, 0);
  popMatrix();


  //daniel math start
  diff[count] = abs(mouseX-pmouseX)+abs(mouseY-pmouseY);

  update(mouseX, mouseY);

  if (filled) {
    float sum = 0;
    for (int i = 0; i<diff.length; i++) {
      sum += diff[i];
    }
    average = sum/diff.length;
    if (circleOver1) {
      if (average > .1 && average < 1.75) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(slowA);
        image(spin1Slow, 0, 0);
        popMatrix();
        /* if (ctr<2) {
         ctr = (ctr + 1) % guitarPitches.length;
         }*/
      }
    }
    if (circleOver2) {
      if (average > .1 && average < 1) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(slowA);
        image(spin2Slow, 0, 0);
        popMatrix();
      }
    }

    if (circleOver3) {
      if (average > .1 && average < 1) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(slowA);
        image(spin3Slow, 0, 0);
        popMatrix();
      }
    }

    if (circleOver4) {
      if (average > .1 && average < 1) {
        pushMatrix();
        translate(width/2, height/2);
        rotate(slowA);
        image(spin4Slow, 0, 0);
        popMatrix();
      }
    }
    else {
      a+=.1;
      b+=.2;
      c+=.3;
      d+=.4;
    }
  }
  slowA += .005;

  count++;
  if (count>=diff.length) {
    count = 0;
    filled = true;
  }
  /* ellipse(circleX, circleY, circleSize1, circleSize1);
   ellipse(circleX, circleY, circleSize2, circleSize2);
   ellipse(circleX, circleY, circleSize3, circleSize3);
   ellipse(circleX, circleY, circleSize4, circleSize4);*/

  //daniel math end^

  //beads
  /* SamplePlayer sp = new SamplePlayer(ac, new Sample(sourceFile));
   sp.setRate(new Glide(ac, pitchRatio));
   sp.setKillOnEnd(true);
   g.addInput(sp);
   sp.start();*/
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize1) ) {
    circleOver1 = true;
  } 
  else {
    circleOver1 = false;
  }

  if ( overCircle(circleX, circleY, circleSize2) ) {
    circleOver2 = true;
  } 
  else {
    circleOver2 = false;
  }

  if ( overCircle(circleX, circleY, circleSize3) ) {
    circleOver3 = true;
  } 
  else {
    circleOver3 = false;
  }

  if ( overCircle(circleX, circleY, circleSize4) ) {
    circleOver4 = true;
  } 
  else {
    circleOver4 = false;
  }
}
boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}



