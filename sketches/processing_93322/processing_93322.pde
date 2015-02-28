
import java.util.*;
import java.io.*;
import java.lang.Math.*;

float sunX;
float sunY;

ArrayList<planet> Planets = new ArrayList<planet>();
ArrayList<planet> Moons = new ArrayList<planet>();

PImage stars;
PImage sun;


void setup(){
  size(700, 700);
  smooth();
  background(0);
  
  sunX = 350;
  sunY = 350;
  
  stars = loadImage("stars1.png");
  sun = loadImage("sun1.png");
  
}

void keyPressed(){
  Planets.clear();
  Moons.clear();
  image(stars, 0, 0);
  image(sun, sunX-40, sunY-40);
}

void mouseReleased(){
  

  
  float a = abs(mouseX-sunX);
  float b = abs(mouseY-sunY);
  float c = sqrt(a*a + b*b);
  println(c);

  
  boolean planetCreated = false;

  
  if (c > 50 && c < 350){

    
    for(planet currentPlanet: Planets){
      if (abs(currentPlanet.getRadius() - c) <30){
        // if the mouse is near to another orbit...
         planet newMoon = new planet(int(random(5, 10)), 20, currentPlanet);
         //create a moon.
         Moons.add(newMoon);
         planetCreated = true;
      }
    }
    if(!planetCreated){
  
     planet newPlanet = new planet(int(random(10,25)), c, null);
     Planets.add(newPlanet);}

  }
}
        

void draw(){

for (planet currentPlanet: Planets){
  currentPlanet.display();
}
  
for (planet currentPlanet: Moons){
  currentPlanet.display();

}
  tint(255, 30);
  image(stars, 0, 0);
  
  tint(255, 255);
  image(sun, sunX-40, sunY-40);

}
  

class planet{
  
  int count = 1;

  float Xposn;
  float Yposn;
  int size;
  float radius;
  planet orbit;

  
  
  int red = int(random(255));
  int green = int(random(255));
  int blue = int(random(255));

  
  planet(int givenSize, float givenRadius, planet givenOrbit){
    
    size = givenSize;
    radius = givenRadius;
    orbit = givenOrbit;

  }
  
  void display(){
    
    float orbitX;
    float orbitY;
    
    if(orbit == null){
      orbitX = sunX;
      orbitY = sunY;

    }
    
    else{
      orbitX = orbit.getXposn();
      orbitY = orbit.getYposn();
    }

  count += 350/radius;


Yposn = radius * sin(count/180.0*PI) + orbitY;
Xposn = radius * cos(count/180.0*PI) + orbitX;

  fill(100);
  noStroke();
  fill(red, green, blue);
  ellipse(Xposn, Yposn, size, size);

  }
  
  float getXposn(){
    return Xposn;}
    
  float getYposn(){
    return Yposn;}
    
  float getRadius(){
    return radius;}
}


