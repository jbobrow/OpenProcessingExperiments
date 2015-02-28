
//creating and 
Particle[] pickles = new Particle[0];



void setup () {
  size (600, 600);
  smooth ();
  noCursor();


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

  if (pickles.length>70) {

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
  float drag = 0.96;
  float x2;
  float y2;
  float particleSize;
  float gravity = 0.5;
  
  color c;
  float opacity;
  float fade;
  float strokeW;
  


  //constructo this is a special function is
  //called whenever a particle is instanciated

  Particle() {

    x =mouseX;
    y =mouseY;


    // set the velocity  to be random number between 
    // -10 and 10 in both x and y direction
    velX = random (-15, 15);
    velY = random (-15, 15);
  }

  void update() {

    //add the velocity to the position
    velX *=drag;
    velY *=drag;
    x += velX;
    y += velY;
    velY +=gravity; 
    x2 +=x;
    y2+=y;
    particleSize = random(2, 5);
    particleSize *=0.5;
    opacity = 75;
    fade = random (0,20);
    opacity -= fade;
 opacity = constrain(opacity,0,10);
 
    strokeW = abs(pmouseX-mouseX);
    strokeW  = constrain(strokeW,0,10);


    //set the fill colour and draw the particle
    stroke (255, 255, 255, 15);
    fill (200, random(100, 255), opacity);
    ellipse (x, y, particleSize, particleSize);
    fill (170, random(100, 255), 255, opacity);
    stroke (161, random(100, 255), 255, opacity);
    ellipse (x, y, particleSize+3, particleSize+3);
    stroke (121, random(100, 255), 255, 5);
    ellipse (x2, y2, particleSize+3, particleSize+3);
    stroke (255, random(190, 230), 60, 35);
    strokeWeight(strokeW);
    line (pmouseX, pmouseY, mouseX, mouseY);
    strokeWeight(strokeW/2);
    line (pmouseX, pmouseY, mouseX, mouseY);
    strokeWeight(strokeW/1.5);
    line (pmouseX, pmouseY, mouseX, mouseY);
    noStroke();
    strokeWeight(0);
  }

  void checkCollision() {

    if ((x<0) || (x>width))
      velX = -velX;
    if ((y<0) || (y>height))
      velY = -velY;
  }
}


