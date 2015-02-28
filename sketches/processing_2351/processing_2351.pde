
/*

growingCircles

 ak@angelakwong.com
 June,2009
 
 
 
 */

float rot = PI; //setting the variable "rot" at "0"
float rad = (random (100,200)); //setting the variable "rad" at 200.
float speed = 0.02; //setting the variable "speed" at 0.01
float circleSize = (random (3,15));

float seed = 0;
float seed2 = 0;


void setup(){
  size(500,500);
  background(0);
  smooth();



};

void draw(){

  rad = noise(seed) * 500;
  seed = seed + 0.006;  
  
  circleSize = noise(seed2) *10;
  seed2 = seed2 + 0.03;
  
  translate(250,250);
  rotate(rot);
  stroke(random(255), random(255), random(255),50);
  line(0,0,rad,0);
  fill(random(255), random(255), random(255),50);
  rect(rad,0, circleSize, circleSize);


  rot = rot + speed; 


};

void keyPressed(){
  save("circle" + key + ".png");



};


