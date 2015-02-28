
import hypermedia.video.*;
import hypermedia.video.*; 

import processing.opengl.*;
import processing.video.*;
PImage bg;
OpenCV opencv;                    //  Creates a new OpenCV Object

// add image to sketch
PImage particleImg;

Particle[] particles; 

final int MAX_PARTICLES = 150; 

void setup()
{

  size(1000,250); 
  frameRate(30); 
  bg= loadImage ("sky7.jpg");  
  opencv = new OpenCV( this );    //  Initialises the OpenCV object
  opencv.capture( 250,250);     //  Opens a video capture stream

  particles = new Particle[0];  
  particleImg = loadImage("shining star.png");
}


void draw()
{


  noStroke();
  noTint();  
  imageMode(CORNER); 

  opencv.read();                  //  Grabs a frame from the camera




  background (bg);


  opencv.absDiff();               //  Calculates the absolute difference


  imageMode(CENTER); 

  updateParticles();

  makeParticles(opencv.image());

  if(particles.length>MAX_PARTICLES)   
    particles = (Particle[]) subset(particles, particles.length-MAX_PARTICLES); 

  opencv.remember();              //  Remembers the current frame
}

void updateParticles()
{

  for(int i =0; i<particles.length; i++)
  {

    Particle p = particles[i]; 

    p.update(); 
    p.draw();
  }
}


void makeParticles(PImage img)
{

  Particle p;
  for(int i= 0; i<200; i++)
  {
    int xpos = (int) random(img.width); 
    int ypos = (int) random(img.height); 
    if(brightness(img.get(xpos,ypos))>50)
    {
      p = new Particle(width - (xpos*4), ypos); 
      p.draw(); 
      particles = (Particle[]) append(particles, p);
    }
  }
}


class Particle
{

  float xPos; 
  float yPos; 
  float xVel; 
  float yVel; 

  float rotation = 0; 
  float spin; 

  float currentAlpha = 255; 
  float currentScale = 0.5; 

  float drag = 0.2; 
  float fadeSpeed = -5; 
  float shrink = 0.9; 
  float gravity  = -0.1; 

  Particle(float xpos, float ypos)
  {
    this.xPos = xpos; 
    this.yPos = ypos; 
    this.xVel = random(-20,20); 
    this.yVel = random(-20,20); 
    this.currentScale = random(0.01,0.10);
    this.currentAlpha = random (0,255);    
    this.rotation = random(0,360);   
    this.spin =  random(-2,-5);
  }


  void update()
  {
    xVel*=drag; 
    yVel*=drag;

    yVel+=gravity; 

    xPos += xVel; 
    yPos += yVel; 
    currentAlpha -=fadeSpeed; 
    currentScale*=shrink; 
    rotation+=spin;
  }

  void draw() 
  {
    if(currentAlpha<=0) return; 

    pushMatrix();

    tint(255,currentAlpha);
    translate(xPos, yPos); 
    scale(currentScale); 
    rotate(radians(rotation)); 
    image(particleImg, 0, 0);
    popMatrix();
  }
}




