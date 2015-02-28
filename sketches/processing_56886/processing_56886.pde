
// Code by Sherin Kwan (YSDN Interactivity 1)
 
int x= 95;
int b= 140;
int y = 65;
float o = 1700;
int w= 1;
 
 
void setup(){
  size(400, 125);
  background(75);
  ellipseMode(CENTER);
  noFill();
  strokeWeight(w);
  smooth();
  frameRate(40);
}
 
void draw(){
   
  stroke(255);
  ellipse(x, y, o, o);
  stroke(15);
  ellipse(x, y, o-20, o-2);
  stroke(15);
  ellipse(x, y, o-2, o-20);
   
  if (2>o){
    o = 1000;
  } else{
    o-=20;
  }
}
 

