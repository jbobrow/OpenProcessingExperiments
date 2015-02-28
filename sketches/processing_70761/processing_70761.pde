
//Homework Assignment 5
//51257:A
//Copyright 2012 Patrick Clancy pjclancy@andrew.cmu.edu

float x, y, wd, ht;
void setup( )
{
size(400, 400);
smooth( );
background(20, 40, 90);

x=200;
y=200;
wd=200;
ht=200;
}

void draw( )
{
  initials();
}

void mouseMoved( )
{
  x = mouseX;
  y = mouseY;
}
  
void initials()  // function definition
{
//circle 1
stroke(26, 51, 0);
strokeWeight(.50);
fill(15, 35, 85);
ellipseMode( CENTER ); // Circle 1
ellipse( x, y, wd*1.5, ht*1.5 );
 
stroke(26, 51, 0);
fill(10, 25, 70);
strokeWeight(.50);
ellipseMode( CENTER ); // Circle 2
ellipse( x, y, wd*.75, ht*.75 );
 
fill(5, 20 ,65);
stroke(90,173,0);
strokeWeight(2.25);
ellipseMode( CENTER ); // Circle 3
ellipse( x, y, wd*.8, ht*.8 );

noFill();
stroke(20, 220, 10);
strokeWeight(10);
beginShape(); // P vertical line
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x-(.25*wd), y);
curveVertex(x-(.1*wd), y+(.3*ht));
curveVertex(x-(.1*wd), y+(.3*ht));
endShape();
 
stroke(20,220,10);
strokeWeight(10);
beginShape(); // P curve
curveVertex(x-(.25*wd), y-(.15*ht));
curveVertex(x-(.1*wd), y-(.3*ht));
curveVertex(x, y-(.25*wd));
curveVertex(x-(.25*wd), y);
curveVertex(x-(.25*wd), y);
endShape();
  
stroke(50,135,0);
strokeWeight(10);
beginShape(); // J top Horizontal line
vertex(x-(.2*wd), y-(.175*ht));
vertex(x+(.225*wd), y-(.175*ht));
endShape();
 
beginShape(); // J bottom line
vertex(x-(.25*wd), y+(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();
 
beginShape(); // J vertical line
vertex(x+(.075*wd), y-(.175*ht));
vertex(x-(.15*wd), y+(.175*ht));
endShape();

stroke(20,220,10);
strokeWeight(10);
beginShape(); // C Curve
curveVertex(x+(.1*wd), y-(.3*ht));
curveVertex(x+(.1*wd), y-(.3*ht));
curveVertex(x+(.25*wd), y);
curveVertex(x+(.1*wd), y+(.3*ht));
curveVertex(x+(.1*wd), y+(.3*ht));
endShape();
}

//saveframe("hw5.jpeg");

