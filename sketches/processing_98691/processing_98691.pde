
//Import all Phys2D libraries
import pphys2d.bodies.*;
import pphys2d.joints.*;
import pphys2d.shapes.*;
import pphys2d.phys2d.raw.collide.*;
import pphys2d.phys2d.raw.strategies.*;
import pphys2d.phys2d.raw.forcesource.*;
import pphys2d.phys2d.util.*;
import pphys2d.phys2d.raw.shapes.*;
import pphys2d.*;
import pphys2d.phys2d.raw.*;
import pphys2d.phys2d.math.*;

//Create a PPhys2D world
PPWorld world = new PPWorld();

//Create an Array to hold the balls
PPCircle[] balls = new PPCircle[8];

//Value to increment the gravity
float theta =3;

void setup () {
  
  //Set size and framerate
  frameRate(30);
  size(500,500);
 smooth();
  noStroke();
  //Set a NO world gravity
  world.setGravity(0, 0);
  
  //Set world edges in dark gray
  world.setEdges(this, new java.awt.Color (40, 40, 255));
   
  //Create balls and add them to the world
  for(int i=0; i <8; i++) {    
    balls[i] = new PPCircle(random(20,50));
    balls[i].setFillColor(new java.awt.Color((int)random(160,255), (int)random(10,100), (int)random(0,140),(int)random(255)));
    balls[i].setStrokeColor(new java.awt.Color(190,250,10));
    balls[i].setStrokeWidth(2);   
    balls[i].setPosition(random(150,350), random(150,350));
    world.add(balls[i]);
  }
}



void draw() {
  //Clear
   background(0);
  
  
  //Refresh gravity force
  float factor = 100;
  float x = factor * cos(theta);
  float y = factor * sin(theta);  
  world.setGravity(x, y);
  theta += 0.0065;

  //Draw a line representing gravity force
  /*line(250,250, x+250, y+250);
  ellipseMode(CENTER);
  fill(255);
  ellipse(250,250, 10,10);
  */
  //Draw PPhys2D world
  world.draw(this);
  

}

/*void mouseReleased() {
  //creamos una nueva bola
 PPCircle balls = new PPCircle; 
  //y la aÃ±adimos al Array
 PPCircle.add(balls);
}*/
