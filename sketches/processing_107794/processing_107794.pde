
/***********************************************************
 Programmed by Jason Barles 

  Licence: Creative Commons Attribution 3.0 Unported 
  http://creativecommons.org/licenses/by/3.0/deed.en_US
  
 Date: 2/Apr/2013
 
 Description:
 Draws circular particles of orange and purple allowing you
 to control it with a mouse. A white circle randomly moves 
 around the screen.
 **********************************************************/
int MAX_PARTICLES = 50; // maximum number of particles for each type
int BACKGROUND_COLOUR = 15; // background colour
ArrayList orangeParticles; // list of Orange particles
ArrayList purpleParticles; // list of Purple particles
float noiseX, noiseY, pnoiseX, pnoiseY; // random locations for drawing the particles

void setup() {
  size(400,400);  
  noiseX = width * noise(50);  
  noiseY = height * noise(60);
  orangeParticles = new ArrayList();
  purpleParticles = new ArrayList();  
}

void draw() { 
  // update the noise pixel location so that it randomly draws
  // within the boundaries of the window
  pnoiseX = noiseX; pnoiseY = noiseY;
  noiseX = width * noise(50 + frameCount * 0.01); 
  noiseY = height * noise(60 + frameCount * 0.02); 
  
  // draw the orange and purple particles at the mouse location
  PVector randomLocation = new PVector(mouseX, mouseY);  
  orangeParticles.add(new Orange(randomLocation));
  purpleParticles.add(new Purple(randomLocation));   
  
  // refresh the background after drawing on the partices 
  // on the screen 
  background(BACKGROUND_COLOUR);  
  // draw a grid on the background
  drawGrid();  
    
  // draw the Orange particles
  for (int i = 0; i < orangeParticles.size(); i++ ) { 
    Orange op = (Orange) orangeParticles.get(i);
    op.run();   
    // draw a circle at the random noise location  
    fill(255);
    ellipse(noiseX, noiseY, 20, 20);       
  }
  
  // draw the Purple particles
  for (int i = 0; i < purpleParticles.size(); i++ ) { 
    Purple pp = (Purple) purpleParticles.get(i);
    pp.run();
  }  

  // remove the first particle in the array if it reaches 
  // the maximum size
  if (orangeParticles.size() > MAX_PARTICLES) {
    orangeParticles.remove(0); 
  } 
  if (purpleParticles.size() > MAX_PARTICLES) {
    purpleParticles.remove(0); 
  } 
}

/*
 drawGrid(): draws a grid with circles on the intersections
*/
void drawGrid(){
  stroke(55);
  strokeWeight(1);
  // draw the verticle grid lines
  for(int x=100; x < width; x+=100){
    line(x, 0, x, height);  
  } 
  // draw the horizontal grid lines
  for(int y=100; y < height; y+=100){
    line(0, y, width, y);
  } 
  // draw circles at the grid line intersections  
  for(int x=100; x < width; x+=100){
    for(int y=100; y < height; y+=100){
      fill(255);
      float size=random(5,10);
      ellipse(x, y, size, size);
    }
  }
}

/***********************************************************
 Programmed by Jason Barles
 Date: 2/Apr/2013
  
 Particle class that allows for subclasses to extend it. 
 **********************************************************/
class Particle{
  PVector velocity;
  PVector location;
  PVector acceleration;
  float timeToLive;

  Particle(PVector l) {
    acceleration = new PVector(0, 0);  
    velocity = new PVector(random(-2, 2), random(-2, -2));
    location = l.get();
    timeToLive =  random(10,120);
  }

  void run() {
    update();
    display();
  }

  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    timeToLive -= 1;
  }
  
  void display() {  
    // blank to allow sub classes to extend this function
  }
  
  void addGravity(PVector gravity){
    acceleration.add(gravity);
  }
} 

/***********************************************************
 Programmed by Jason Barles
 SID: 430515442
 Date: 2/Apr/2013
  
 An orange particle that extends the time to live. This class
 inherits the Particle class.
 **********************************************************/
class Orange extends Particle {
  Orange(PVector l){
    super(l);
    timeToLive =  random(10,130); // extend the time to live
  }
  
  void display(){
    noStroke();
    fill(255, 136, 8, timeToLive); // add orange colour     
    ellipse(location.x, location.y, random(8,48), random(8,48));   
  }
}

/***********************************************************
 Programmed by Jason Barles
 Date: 2/Apr/2013
  
 A purple particle that applies gravity. This class
 inherits the Particle class.  
 **********************************************************/
class Purple extends Particle {
  float gravityY = 0.01; // the gravity amount to apply on each display call
  
  Purple(PVector l){
    super(l);
    // apply a wider velocity between the x and y axis
    velocity = new PVector(random(-4, 4), random(-2, -2));    
  }
  
  void display(){
    strokeWeight(1);
    stroke(255);
    fill(245, 17, 215, timeToLive); // add purple colour     
    ellipse(location.x, location.y, random(8,48), random(8,48));   
    addGravity(new PVector(0,gravityY));    
  }
}



