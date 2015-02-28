
float carx=0;
float x=300;
float y=300;
float speed = -2;
float gravity = -0.009;


void setup() {
  size(600,600);
 
}
  
void draw() {
  background(255,0,0);
  
 //Draw a car
 stroke(0);
 strokeWeight(2);
 fill(100,100,255);
 rectMode(CENTER);
 rect(carx,340,100,50);
 fill(255,255,0);
 ellipse(carx-30,370,30,30);
 fill(255,255,0);
 ellipse(carx+30,370,30,30);
 carx=carx+1;
 
 if (carx>width+50) {
   carx=0;
 }
 
 //set CENTER mode
 ellipseMode(CENTER);
 
 //Draw Frog's feet
 stroke(110);
 strokeWeight(10);
 line(x-20,y+30,x-20,y+80);
 line(x+20,y+30,x+20,y+80);
 

 //Draw Frog's body
 noStroke();
 fill(225,252,0);
 ellipse(x,y,100,110);
 fill(255);
 ellipse(x,y-20,70,120);
 
 
 
 //Draw Frog's head
  noStroke();
  fill(225,252,0);
 ellipse(x,y-75,200,100);
 
 //Draw Frog's eyes
  noStroke();
  fill(225,252,0);
 ellipse(x-100,y-100,70,70);
 ellipse(x+100,y-100,70,70);
 
 //Draw Frog's eyes' ball
  stroke(110);
  strokeWeight(1.5);
  fill(255);
 ellipse(x-100,y-100,50,50);
 ellipse(x+100,y-100,50,50);
 fill(110);
 ellipse(x-90,y-90,20,20);
 ellipse(x+90,y-90,20,20);
 
 //Draw Frog's highlight
  noStroke();
  fill(255);
 ellipse(x,y-100,40,20);
 
 //Draw Frog's mouth
 stroke(110);
 strokeWeight(3);
 noFill();
 arc(x,y-80,100,50,0,PI);

 
if (carx > 200) {
   y=y+speed;
   speed=speed-gravity;
} else {
   y=300;
   speed = -2;
 } 
 

 //Draw a ground line
  stroke(255);
 strokeWeight(10);
 line(0,390,width,390);
  }
 

