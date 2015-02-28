
Particle[] particles=new Particle[0];
boolean free=true;  //when this becomes false, the particles move toward their goals

float pAccel=.05;  //acceleration rate of the particles
float pMaxSpeed=2;  //max speed the particles can move at

color bgColor=color(255);

PImage [] words = new PImage [5];  //holds the image container the words
color testColor=color(0);  //the color we will check for in the image.

class Particle {

  float x, y;  //x and y locaiton of particle
  float xVel, yVel;  //x and y velocity of particle
  float xVelMax, yVelMax;  //will hold the maximum velocity for the particle
  float xAccel, yAccel;  //x and y accelaration
  float ang;  //angle ind egrees that particle should be moving at

  float xGoal, yGoal;  //the point that the particle wants to return to


  //constructor
  Particle(float newXGoal, float newYGoal) {

    x=random(width);
    y=random(height);
    xGoal=newXGoal;
    yGoal=newYGoal;
    ang=random(0, 2*PI);  //we're using radians
    xVel=0;
    yVel=0;

    xAccel=pAccel*cos(ang);
    yAccel=pAccel*sin(ang);
  }

  //deals with the frame to frame changes of the particle
  void Update() {

    //println(degrees(ang));
    x+=xVel;
    y+=yVel;

    xVel+=xAccel;
    yVel+=yAccel;

    //if the particles are not free, move this particle toward its goal
    if (!free) {
      //get the angle of the thing point the particle should move toward
      ang= atan2(yGoal-y+2, xGoal-x+2); //revolves around the object (higher the number, higher the distance)
      xAccel=pAccel*cos(ang);
      yAccel=pAccel*sin(ang);

      //slow it down a lot if it's close to the point
      if (!free && abs(x-xGoal) <xVel*2 || abs(y-yGoal)<yVel*2) {
        xVel*=0.6;
        yVel*=0.6;
      }
    }

    else {
      //make it bounce off edges if it's free moving
      CheckEdge();
    }



    //when mouse hovers over particles in place, it scatters it for a while
    if (abs(mouseX - xGoal) < abs(x-xGoal+10) &&
      abs(mouseY - yGoal) < abs(y-yGoal+10)) {
      x += random(-50, 50);
      y += random(-50, 50);
    }

    Draw();
  }

  //draws the particle on screen

  void Draw() {
    point (x, y);
  }

  void CheckEdge() {

    if (x>width || x<0 || y>height || y<0) {
      xVel=0;
      yVel=0;
      if (y>height) {
        yAccel*=-1;
        y=height-1;
      }
      else if (y<0) {
        yAccel*=-1;
        y=1;
      }
      else if (x>width) {
        xAccel*=-1;
        x=width-1;
      }
      else if (x<0) {
        xAccel*=-1;
        x=1;
      }
    }
  }
}



void newstart() {
  for (int i=0; i<words.length; i++) {
    words[i] = loadImage("s" + i + ".png");
  }
  //go through the image, find all black pixel and create a particle for them
  //start by drawing the background and the image to the screen
  background(bgColor);

  image(words[(int)random(5)], 0, 0);  //draw the image to screen

  loadPixels();  //work with the pixels currently on screen



  //go through the entire array of pixels, creating a particle for each black pixel
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      if (pixels[GetPixel(x, y)] == testColor) {
        particles=(Particle[])append(particles, new Particle(x, y));
      }
    }
  }
}

void setup() {
  size(500, 610);
  //  noCursor();

  newstart();
}



void draw() {

  background(bgColor);


  for (int i=0; i<particles.length; i++) {
    if (particles[i].y<0) {
    }

    particles[i].Update();
  }
}
void mouseMoved () {
  free=false;
}

void mousePressed() {
  free=true;

  newstart();
}

//returns the locaiton in pixels[] of the point (x,y)
int GetPixel(int x, int y) {
  return(x+y*width);
}


