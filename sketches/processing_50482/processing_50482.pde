
//import processing.opengl.*;

//many bouncing balls



int ballCount = 30;
int ballSize = 30;
int ballSpeed = 3;

float[]xspeed = new float[ballCount];
float[]yspeed = new float[ballCount];
float[]xpos = new float[ballCount];
float[]ypos = new float[ballCount];
float[]wdth = new float[ballCount];
float[]ht = new float[ballCount];

// colors
float[] colours = {
  random(100), random(255), random(30, 100), random(60, 150)
  };



  // SETUP /////////////////////////////////////////
  void setup() {
    size(864, 486);
    background(0);
    smooth();

    //initialize values for all palls
    for (int i = 0; i<ballCount; i++) {

      //varied ball speed
      xspeed[i] = random(1, ballSpeed);
      yspeed[i] = random(-ballSpeed, ballSpeed);

      // ball varied sizes
      wdth[i] = random(1, ballSize);
      ht[i] = wdth[i];

      // initial ball placement
      xpos[i] = width/2 + random(-width/3, width/3);
      ypos[i] = height/2 + random(-height/3, height/3);
    }
    // turn off shape strokes
    noStroke();
    //framerate
    frameRate(30);
  }

// BEGIN ANIMTION LOOP /////////////////////////////////////////

void draw() {


 background(0);
//  fill(0, 20);
//  rect(0, 0, width, height);
//  noFill();

  for (int i=0; i<ballCount; i++) {
    //drawballs
    //    fill(colours[0], colours[1], colours[2]);
    //    fill(i*255/ballCount);
    noFill();
    strokeWeight(10);
    stroke(colours[0]*i, colours[1]+i, colours[2]*i, colours[3]);
    ellipse(xpos[i], ypos[i], wdth[i], ht[i]);

    noFill();

    //update position value
    xpos[i] += xspeed[i];
    ypos[i] += yspeed[i];

    // ball collision accounting for ball thickness
    if (xpos[i]+wdth[i]/2>=width || xpos[i]<wdth[i]/2) {
      xspeed[i]*=-1;
    }

    if (ypos[i]+ht[i]/2>=height || ypos[i]<ht[i]/2) {
      yspeed[i]*=-1;
    }

    //connect with lines
    //    stroke(255, 20);
    strokeWeight(3);
    stroke(colours[0], colours[1], colours[2], colours[3]);
    bezier(xpos[i], ypos[i], xpos[i/3],ypos[i/3], xpos[i/10],ypos[i/10], xpos[i/2], ypos[i/2]);
    noStroke();
  }
}


