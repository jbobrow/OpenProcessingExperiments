
//Maria Cioffi
//copyright slkjsdhfie8ihvasi

float x = 200;
float y = 200;
float myWidth = 300;
float myHeight = 300;

size(400,400);
background(140,20,34);
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
ellipse(x,y,70,70);


