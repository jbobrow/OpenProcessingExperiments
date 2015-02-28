

//Gravity Swarm by Claudio Gonzales, licensed under Creative Commons Attribution-Share Alike 3.0 license.
//Work: http://openprocessing.org/visuals/?visualID=2363
//License: http://creativecommons.org/licenses/by-sa/3.0

//new by Sasha Cordingley
 
particle[] Z = new particle[6000]; 
float colour = random(100); 
 
void setup() { 
  smooth(); 
  size(600,600,P2D);   
  background(255); 
   
  for(int i = 0; i < Z.length; i++) { 
    Z[i] = new particle( random(width), random(height), 5, 5, 1); 
  } 
   
  frameRate(60); 
  colorMode(RGB,255); 
 
} 
 
void draw() { 
   
  filter(INVERT); 
 
  float r; 
 
  stroke(0); 
  fill(255); 
  rect(0,0,width,height); 
   
  colorMode(HSB,1); 
  for(int i = 0; i < Z.length; i++) { 
    if( mousePressed && mouseButton == LEFT ) { 
      Z[i].gravitate( new particle( mouseX, mouseY, 10, 0, 5 ) ); 
    } 
    else if( mousePressed && mouseButton == RIGHT ) { 
      Z[i].repel( new particle( mouseX, mouseY, 0, 0, 20) ); 
    } 
    else { 
      Z[i].deteriorate(); 
    } 
    Z[i].update(); 
    r = float(i)/Z.length; 
    stroke( colour, pow(r,0.1), 1-r, 0.15 ); 
    Z[i].display(); 
  } 
  colorMode(RGB,255); 
   
  colour+=random(5); 
  if( colour > 5 ) {  
    colour = colour%1; 
  } 
 
  filter(INVERT); 
   
} 
 
 

