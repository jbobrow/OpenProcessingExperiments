
float Z = 5;
 //spirally line drawing
void setup() {
  size(250, 250);
  smooth();
  rectMode(CENTER);
  frameRate(24); //15 for slow laserlike stuttering effect pace
  background(0);
  
}
void draw() {
  Z+=.5;
 
  translate(width/2, height/2);//div 2*nts
  rotate(Z);
   
  translate(10, 20); //line coord 1
  rotate(Z*-5);
 
  translate(20, 40);//line coord 2
  rotate(Z*-.5);
  
    translate(100, 100);// line coord 3
  rotate(Z*-.5);
   
   translate(0*R, 0);
  rotate(Z*-.5);

strokeWeight(0.5);// stroke/random line properties here 
stroke(random(60),random(200), 0+Z, 95);
line(10, 10, -100, -100);
}
 
 



