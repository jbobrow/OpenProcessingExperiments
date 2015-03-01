
/* @pjs preload="norfolk.jpg,postcard_back.jpg"; 
crisp="true";
 */

float x,y,z;
PImage p;

void setup() {
  size(500,500,P3D);
  x = width/2;
  y = height/2;
  z = 0; 
  smooth();
  p = loadImage("norfolk.jpg");
  p2 = loadImage("postcard_back.jpg");
}

void draw() {
  background(127);
  float n = noise(z*0.01)-0.5;
  translate(x,y,0);
  //println("Noise is "+n+", z is"+z);
  stroke(0);
  fill(255);
  rotateY(0.02*z*PI/8);
  rotateX(n*PI*0.2);
  beginShape();
   texture(p2);
   vertex(-141,-100,-1,0,0);
   vertex(141,-100,-1,282,0);
   vertex(141,100,-1,282,200);
   vertex(-141,100,-1,0,200);
  endShape();

beginShape();
   texture(p);
   vertex(-141,-100,1,0,0);
   vertex(141,-100,1,282,0);
   vertex(141,100,1,282,200);
   vertex(-141,100,1,0,200);
  endShape();

//box(282,200,2);

  //rectMode(CENTER);
    //box(296,210,2);
   //translate(0,0,1); 
  //rect(0,0,286,200);
  //translate(0,0,-2);
  //rect(0,0,286,200);

spotLight(255, 0, 0, width/2, height/2, 400, 0, 0, -1, PI/4, 2);
  z++; // The box moves forward as z increments.
}




