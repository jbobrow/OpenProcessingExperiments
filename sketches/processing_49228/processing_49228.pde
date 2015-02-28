
import processing.opengl.*;

//creating and 
Particle[] pickles = new Particle[0];
PImage particleImage;
PImage particleImage2;
PImage particleImage3;



void setup () {
  size (600, 600, OPENGL);
  smooth ();
  noCursor();
  imageMode(CENTER);
  particleImage = loadImage("ParticleWhite.png");
  particleImage2 = loadImage("ParticleWhite2.png");
  particleImage3 = loadImage("ParticleWhite3.png");





  //for(int i=0; i<pickles.length; i++) {

  //pickles[i] = new Particle ();
  //}
}


void draw () {
  fill (191, 70, 20, 50);
  rect (0, 0, width, height);

  //adding a new particle into the array
  pickles = (Particle[])append(pickles, new Particle());
  for (int i=0; i<pickles.length; i++) {

    pickles[i].update();
    pickles[i].checkCollision();
  }

  if (pickles.length>51) {

    //casting now

    pickles = (Particle[]) subset (pickles, 1);
  }
}


class Particle {

  //
  float x;
  float y;

  //it's the change in position
  float velX;
  float velY;
  float drag = 0.65;
  float x2;
  float y2;
  float particleSize;
  float gravity;

  color c;
  float opacity;
  float fade;
  float strokeW;
  float rotation;
  float spin;


  //constructo this is a special function is
  //called whenever a particle is instanciated

  Particle() {

    x =mouseX;
    y =mouseY;


    // set the velocity  to be random number between 
    // -10 and 10 in both x and y direction
    velX = random (-10, 10);
    velY = random (-20, 20);
  }

  void update() {

    //add the velocity to the position
    gravity = random (-2.5, -3.95);
    velX *=drag;
    velY *=drag;
    x += velX;
    y += velY;
    velY +=gravity; 
    x2 +=x;
    y2+=y;
    particleSize = random(10, 50);
    //particleSize *=0.5;
    opacity = random (50,75);
    fade = random (0, 60);
    opacity -= fade;
    // opacity = constrain(opacity, -2, 75);

    strokeW = abs(pmouseX-mouseX);
    strokeW  = constrain(strokeW, 0, 10);
    rotation = random (0, 360);
    spin = random (-5, 5);
    rotation += spin;


    //set the fill colour and draw the particle
    //stroke (255, 255, 255, 15);
    //fill (200, random(100, 255), opacity);
    //ellipse (x, y, particleSize, particleSize);
    //fill (170, random(100, 255), 255, opacity);
    //stroke (161, random(100, 255), 255, opacity);
    //ellipse (x, y, particleSize+3, particleSize+3);
    //stroke (121, random(100, 255), 255, 5);
    //ellipse (x2, y2, particleSize+3, particleSize+3);
    //stroke (255, random(190, 230), 60, 35);
    //strokeWeight(strokeW);
    //line (pmouseX, pmouseY, mouseX, mouseY);
    //strokeWeight(strokeW/2);
    //line (pmouseX, pmouseY, mouseX, mouseY);
    //strokeWeight(strokeW/1.5);
    //line (pmouseX, pmouseY, mouseX, mouseY);
    //noStroke();
    //strokeWeight(0);
    pushMatrix();
    translate (x, y);
    rotate(radians(rotation));

    tint(random(0,255), opacity/3);
    image(particleImage, 0, 0, particleSize/10, particleSize/10);
    image(particleImage, 0+random(-2, 3), 0+random(-2, 3), particleSize/2, particleSize/2);
    pushMatrix();
    translate (x, y);
    rotate(radians(rotation));
    image(particleImage2, 0+random(-2, 3), 0+random(-2, 3), particleSize/3, particleSize/3);
    popMatrix();
    tint(random(0,255), opacity/2);
    image(particleImage2, 0, 0, particleSize/50, particleSize/50);
    popMatrix();
    pushMatrix();
    translate (x, y);
    rotate(radians(rotation));
    tint(random(0,255), opacity/5);
    image(particleImage3, 0+random(-2, 3), 0+random(-2, 3), particleSize, particleSize);
    popMatrix();
  }

  void checkCollision() {

    if ((x<0) || (x>width))
      velX = -velX;
    if ((y<0) || (y>height))
      velY = -velY;
  }
}


