
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
}

//-----------------Interactions
/*Place any interactions here.  We'll go over this later*/
void mouseReleased(){
 Particle instance = new Particle();
 instance.display();
 particleArray = (Particle[])append(particleArray,instance);
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
    accel = random(1000,1020)/1000.0;
    pradius = random(5,50);
    xvel = random(5);
    yvel = random(5);
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
    if (xvel > width/8 || yvel > height/8) {
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

