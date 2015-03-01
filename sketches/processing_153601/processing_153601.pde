
//Maria Cioffi
//copyright slkjsdhfie8ihvasi

float x;
float y;
float myWidth;
float myHeight;

void setup() {
  size(400,400);
}

void draw() {
  background(140,20,34);
  
  x = mouseX;
  y = mouseY;
  myWidth = (x+y)/2;
  myHeight = x;
  
  fill(45, 50, 150);
  ellipse(x,y,myWidth,myHeight);
  fill(34, 155, 22);
  rectMode(CENTER);
  rect(x,y,(myWidth/2)*sqrt(2.0),(myHeight/2)*sqrt(2.0));
  fill(222, 40, 10);
  triangle(x,y-(myHeight/2),x+(myWidth/2), y, x-(myWidth/2), y);
  fill(90,43,160);
  triangle(x,y+(myHeight/2),x+(myWidth/2), y, x-(myWidth/2), y);
  fill(40,0, 100);
  ellipse(x,y,myWidth-100,myHeight-100);
  fill(100, 180, 140);
  arc(x,y,myWidth-100,myHeight-100,PI/2.0,3.0*PI/2.0);
  fill(0);
  ellipse(x,y,myWidth-230,myHeight-230);
}


