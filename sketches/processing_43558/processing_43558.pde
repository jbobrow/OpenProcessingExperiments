
//Project 2
//Tommy Coggin
//attraction code pulled from peter yi's Final Project code

/*Pollock Replicator- colors taken from a Pollock painting and then attraction point brings them
in and flings them back out to create a composition in Pollock's "random" style. If the mouse
is clicked "paint" is splattered in dots across the composition, while also randomly moving the
attraction point.*/


PImage img; 

import traer.physics.*;

ParticleSystem system1;
Particle[] particles;
Particle force1;


//creates an array of dots
Dots [] littledots;


//location of dots
float xpos;
float ypos;

//creates number of dots
int numlittledots= 50;

void setup(){
  size (300,300);
  
  //loads the image of the Pollock painting
  img= loadImage("pollock.jpg");
  img.loadPixels();
  
  //sets background as Pollock painting
  //background(img);
  
  //sets up particle system
  system1= new ParticleSystem(0, 0.02);
  
  //particles are created and control the dots
  particles= new Particle[50];
  littledots= new Dots [50];
  
  //initial location for dots to be drawn to 
  xpos= random(0,width);
  ypos= random(0,height);
 
  
  for(int i=0; i < numlittledots; i++){
    
    //sets variable to control colors
    int a= int(random(0, img.width));   
    int b = int(random(0, img.height));
    color myColor=img.get(a,b);
    
    //sets where color is pulled from in pollock painting
    particles[i] = system1.makeParticle(1, a, b, 0.0);
    
    //sets up dots
    littledots[i]= new Dots(200, 200 , random(5,15), particles[i], color(myColor));
  }
  
  
  //sets the forces (force not fixed to allow constant motion)
  force1=system1.makeParticle(1.0, xpos, ypos, 0);
  //force1.makeFixed();
  
  //sets force to be an attraction force
  for (int i=0; i< numlittledots; i++){
    system1.makeAttraction( force1, particles[i], 200, 5);
  }  
}

void draw(){
  
  //run the physics system
  system1.tick();
  
   

    
  //moves attraction point when mouse is clicked
  if (mousePressed){
    force1.position().set(random(0,width), random(0, height),0);
  }
  

 for(int i=0; i < numlittledots; i++){
    
    //sets variable to control color
    int a= int(random(0, img.width));   
    int b = int(random(0, img.height));
    color myColor=img.get(a,b);
   
    
    //makes it so when you hold mouse colors placed for attraction point are taken from pollock
    fill(myColor);
    
    //sets size and position of attraction point
    ellipse(force1.position().x(),force1.position().y(), 5,5);
    
    
    littledots[i].move();
    littledots[i].display();
 }
}
  
  

class Dots {
    
  //location of dots
  float xpos;
  float ypos;
  
  //the partice that controls the dots
  Particle p;
  
  //size of dots
  float r;
  
  //sets color
  color c;
  
  Dots (float x_, float y_, float r_, Particle p_, color c_){
    xpos= x_;
    ypos= y_;
    r= r_;
    p= p_;
    c= c_;
  }
  
  //dots move in correlation with particle
  void move() {
    xpos= p.position().x();
    ypos= p.position().y();
  }
  
  
    
  //displays dots
  void display(){
    noStroke();
    fill(c);
    ellipse(xpos, ypos, r, r);
  }
}
    

