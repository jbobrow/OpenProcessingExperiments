
//Jeremy Bader
//Assignment1

import processing.opengl.*;

PImage space;
Planet[] planets = new Planet[9];

void setup()
{
  
  size(1400, 800, OPENGL);
  space = loadImage("space.jpg"); 
  planets[0] = new Planet(400, 35, 5, .1, color(255, 72, 0));
  planets[1] = new Planet(600, 50, -.5, .1, color(0, 188, 0));
  planets[2] = new Planet(800, 45, -.5, .1, color(0, 125, 255));
  planets[3] = new Planet(1000, 40, -.5, .1, color(255, 0, 0));
  planets[4] = new Planet(1300, 150, -.5, .1, color(255, 128, 0));
  planets[5] = new Planet(1700, 125, -.5, .1, color(255, 217, 0));
  planets[6] = new Planet(2025, 75, -.5, .1, color(0, 255, 193));
  planets[7] = new Planet(2250, 60, -.5, .1, color(0, 40, 255));
  planets[8] = new Planet(2400, 30, -.5, .1, color(0, 25, 155));  
}

void draw()
{
  background(space);
  lights();
    
  fill(255, 255, 0);
  noStroke();
  
  translate(width/2, height/2, 0);
  scale(.25);
  
  rotateX(map(mouseY, 0 , height, -PI, PI));
  
  pushMatrix();
  rotate((millis() * TWO_PI / 10000) % TWO_PI);
  sphere(300);
  popMatrix();
  
  for (int j = 0; j < planets.length ; j++)
  {
    planets[j].display();
  }
}

class Planet
{
  
  int distanceFromSun;
  float diameter;
  float theta;
  float orbitDirection;
  float orbitSpeed;
  color planetColor;  
  
  Planet(int distanceFromSun_, float diameter_, float orbitDirection_, float orbitSpeed_, color planetColor_)
  {
    distanceFromSun = distanceFromSun_;
    diameter = diameter_;
    orbitDirection = orbitDirection_;
    orbitSpeed = orbitSpeed_;
    planetColor = planetColor_;
  }
  
  void display()
  {
    rotate(theta / 5);
    theta += orbitSpeed * orbitDirection;
    
    fill(planetColor);
    
    pushMatrix();
    translate(distanceFromSun, 0, 0);
    rotate((millis() * TWO_PI / 10000) % TWO_PI);
    sphere(diameter);
    popMatrix();
  }
}

