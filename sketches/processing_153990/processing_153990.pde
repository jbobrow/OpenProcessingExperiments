
//Maria Cioffi
//copyright aksjaslkjfd

float x;
float y;
float myWidth = 100;
float myHeight = 100;
float easingFactor = .03;

void setup() {
 size(400,400); 
}

void draw() {
  rectMode(CENTER);
  
  fill(0, 80);
  rect(200,200,400,400);
  
  x = x+(mouseX-x)*easingFactor;
  y = y+(mouseY-y)*easingFactor;
  
  fill(45, 50, 150);
  ellipse(x,y,myWidth,myHeight);
  fill(34, 155, 22);
  rect(x,y,(myWidth/2)*sqrt(2.0),(myHeight/2)*sqrt(2.0));
  fill(222, 40, 10);
  triangle(x,y-(myHeight/2),x+(myWidth/2), y, x-(myWidth/2), y);
  fill(90,43,160);
  triangle(x,y+(myHeight/2),x+(myWidth/2), y, x-(myWidth/2), y);
  fill(40,0, 100);
  ellipse(x,y,myWidth-50,myHeight-50);
  fill(100, 180, 140);
  arc(x,y,myWidth-50,myHeight-50,PI/2.0,3.0*PI/2.0);
  fill(0);
  ellipse(x,y,30,30);
}


