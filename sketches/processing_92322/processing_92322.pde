
int v1=30;
int v2=30;
int v3=40;
float v4=1;
void setup(){
  size(400,400);
  //make it smoothly
  smooth();
  //stroke value
  strokeWeight(10);
  //thickness
}

void draw(){
  background(225);
  //clearing background
  fill(v1,v2,v3,v4);
  stroke(0);
  // color
  ellipse(300,60,50,100);
  ellipse(100,60,50,100);
  fill(30,60,20);
  ellipse(200,200,300,300);
  ellipse(150,150,50,mouseX/5);
  ellipse(250,150,50,mouseY/5);
  //ellipse(a, b, c, d)
// a:x coordinate b:y coordinate c:width d:height
//line(100,250,300,260);
fill(100,0,0);
rect(100,250,200,30,5);
line(200,200,200,220);
// its important where the line is , if its infront of the ellipse, we cant see the line, if it is behind, it orverlaps.
}
