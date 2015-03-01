
color start=color(0,0,0);
color finish;
float amt = 0.0;
float circleX = 10;
//These codes above tell the program what things are//

void setup() {
  size(255,255);
 background(start); 
 finish = color(random(255),random(255),random(255));
}
/*This code sets the program to be able to change the background 
color*/

void draw() {
  if(circleX>400){
circleX=10;}
ellipse(circleX,circleX,20,20);
circleX = circleX + 1;
fill(circleX, 255, 255); 
 amt+=.01;
 if (amt >= 1) {
   amt = 0.0;
   start = finish;
   finish = color(random(255),random(255),random(255));
 }
 background(lerpColor(start,finish,amt));
  ellipse(random(255),random(255),random(255),random(255));
}
 /*This code above makes the random circles that will appear and the
 code for the color change of the background and circles*/
 
 //This Project loops the above codes many times per second!//
