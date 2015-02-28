
// create an empty array ready to put particles in
Particle[] pickles = new Particle[0]; 

// set the maximum number of particles allowed at once
int maxParticles = 100;
int c = 150;
int w = 0;
int h = 0;

PImage particleImage;

void setup(){
  size(400,400);
  particleImage = loadImage("4.png");
  ellipseMode(CENTER);
  smooth(); 
  noStroke();
  noCursor();
}

void draw(){

  image (particleImage, 0, 0, 400, 400);


  //stoveheat
  noStroke();
  fill(255, 50, 50, h);
  ellipse(95, 335, 180, 90);
  fill(255, 150, 50, h);
  ellipse(95, 335, 150, 60);
  h+=1;
  if(h>190){
    h-=10; 
  } 
  else if(h<10){
    h+=10;
  }

  //kettle
  fill(c);
  ellipse(mouseX, 240, 30, 30);
  ellipse(mouseX, 340, 175, 40);
  arc(mouseX, 340, 176, 190, -PI, 0);
  stroke(c);
  strokeWeight(15);
  line(mouseX+80, 300, mouseX+120, 275);
  strokeWeight(10);
  stroke(c);
  noFill();
  ellipse(mouseX-50, 290, 100, 100);



  //steam
  if (mouseX>25 && mouseX<150){
    w= 255;
  }
  else{
    w=0;
  }
  noStroke();
  // add 2 new particles into the array :
  for(int i=0; i<2; i++) {
    // adding a new particle into the array
    pickles = (Particle[]) append(pickles, new Particle());
  }

  // update and draw all the particles
  for (int i=0; i<pickles.length; i++) {
    pickles[i].update();
  }
  // while we have more than the max number of particles...
  while (pickles.length>maxParticles) {
    // take the oldest of the front of the array
    pickles = (Particle[]) subset(pickles, 1);
  }
}

class Particle {

  // position properties for our particle
  float x;
  float y;

  // velocity is the change in position every frame.
  float velX;
  float velY;

  float drag;

  // the colour of the particle
  color c;

  float particleSize;
  float shrink;

  float gravity;
  int opacity;
  int fade;

  // constructor : this is a special function that is
  // called whenever a Particle is instantiated.
  Particle() {

    // set the x and y position to be in the middle of the screen.
    x = mouseX+120;
    y = 275;

    // set the velocity to be a random number between
    // -10 and 10 in both x and y directions.
    velX = random(-2, 2);
    velY = random(-2, 2);

    drag = 0.96;

    c = color(255, w);

    particleSize = random(2,10);
    shrink = 1.04;

    gravity = -0.2;
    opacity = 255;
    fade = 5; 
  }

  void update() {

    // apply drag to our velocity
    velX*=drag;
    velY*=drag;

    // add gravity;
    velY+=gravity;

    // add the velocity to the position
    x+=velX;
    y+=velY; 

    particleSize *= shrink;
    opacity-=fade;

    // only draw the particle if it's not completely transparent
    if(opacity>0) {
      fill(c, opacity);
      // set the fill colour and draw the particle
      ellipse(x, y, particleSize, particleSize);
    }
  }
}








