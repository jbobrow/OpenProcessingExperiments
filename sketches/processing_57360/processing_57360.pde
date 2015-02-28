
//-----------------Globals
/* These are variables that you want to exist throughout the entire sketch.*/
Particle[] particleArray = {};

//-----------------Setup
/*The code in setup() will only be run once in your sketch.  Use this space to set things up like
the sketch size, background color, framerate, etc. etc.*/
void setup(){
  size(500,500);
  background(0);
  smooth();
  frameRate(30);
  noStroke();
  fill(150,50);
}

//-----------------Main Loop
/*This is the main loop of your sketched.  This loop gets called over and over again until you quit the sketch.*/
void draw(){
  fill(0,25);
  rect(0,0,width,height);
  for (int i = 0; i < particleArray.length; i++) {
    Particle instance = particleArray[i];
    if (!instance.dead){
      instance.update();
      instance.display();
    }
  }
  for (int i = 0; i < (particleArray.length-1); i++) {
    while (particleArray[i].dead) {
      i++;
      if (i >= (particleArray.length-1)) {
        break;
      }
    }
    for (int j = i+1; j < particleArray.length; j++) {
      while (particleArray[j].dead) {
        j++;
        if (j == particleArray.length) {
          break;
        }
      }
      if (i < particleArray.length && j < particleArray.length) {
        checkCollision(particleArray[i], particleArray[j]);
      }
    }
  }
}

//-----------------Interactions
/*Place any interactions here.  We'll go over this later*/
void mouseReleased(){
 Particle instance = new Particle();
 instance.display();
 particleArray = (Particle[])append(particleArray,instance);
 }

void checkCollision(Particle p1, Particle p2)
{
  float xdist = p1.x - p2.x;
  float ydist = p1.y - p2.y;
  float absdist = sqrt(xdist*xdist + ydist*ydist);
  if (absdist < ((p1.pradius+p2.pradius)/2)) {
    float vel1 = sqrt(p1.xvel*p1.xvel + p1.yvel*p1.yvel);
    float vel2 = sqrt(p2.xvel*p2.xvel + p2.yvel*p2.yvel);


    p1.xvel = vel1*xdist/absdist;
    p1.yvel = vel1*ydist/absdist;
    p2.xvel = -vel2*xdist/absdist;
    p2.yvel = -vel2*ydist/absdist;
  }
}

//-----------------Defined Classes
/*Place any defined classes here.  We'll go over this later*/
class Particle {
  //particle properties go here
  //each particle should have a position and velocity, as well as color (at minimum; feel free to add more!)
  float x, y;
  float xvel, yvel;
  float accel;
  float pradius;
  color pcolor;
  boolean dead;
  //this is the constructor
  Particle() {
    x = random(width);
    y = random(height);
    accel = random(1000,1003)/1000.0;
    pradius = random(15,50);
    xvel = random(3);
    yvel = random(3);
    pcolor = color(random(1,255),random(1,255),random(1,255),100);
    dead = false;
  }
  
  //and these are the methods
  void display() {
    fill(pcolor);
    ellipse(x,y,pradius,pradius);
  }  
  
  void update() {
    x += xvel;
    y += yvel;
    xvel *= accel;
    yvel *= accel;
    if ((xvel*xvel+yvel*yvel) > pradius*16) {
      dead = true;
    }
    if (x > width || x < 0) {
      xvel = -xvel;
    }
    if (y > height || y < 0) {
      yvel = -yvel;
    }
  }
}

