
//Robert Wohlforth rwohlfor
//Homework 5
//Copyright Pittsburgh 2012

//Move the mouse up and down to change the size of the figure. Move left and right to change location.

void setup()
{
  size (400, 400);
}

void draw ()
{
  initials (abs(mouseY-200)*2, abs(mouseY-200)*2, mouseX, 200);
}

void initials (float circleWidth, float circleHight, float xCenter, float yCenter)
{

//The variables are declared:
float x;
float y;
float xOrigin;
float yOrigin;

x = circleWidth/450;
y = circleHight/450;
xOrigin = xCenter-200*x;
yOrigin = yCenter-200*x;

//Background Colors:
background(#1D7373);
noStroke();
fill(#5CCCCC);
beginShape();
vertex((xOrigin+200*x)-(yOrigin/3), 0);
vertex(((325+25/3)*x)+xOrigin+((yOrigin)/3), 400);
vertex(400,400);
vertex(400, 0);
endShape(CLOSE);

//The Circle:
noFill();
stroke(0);
ellipse(xCenter, yCenter, 450*x, 450*y);

//Letter R:
fill(#BF3030);
beginShape();
vertex(25*x+xOrigin, 25*y+yOrigin);
vertex(25*x+xOrigin, 400);
vertex(50*x+xOrigin, 400);
vertex(50*x+xOrigin, 175*y+yOrigin);
vertex(125*x+xOrigin+((yOrigin)/3), 400);
vertex(150*x+xOrigin+((yOrigin)/3), 400);
vertex(75*x+xOrigin, 175*y+yOrigin);
curveVertex(75*x+xOrigin, 175*y+yOrigin);
curveVertex(150*x+xOrigin, 175*y+yOrigin);
curveVertex(200*x+xOrigin,100*y+yOrigin);
curveVertex(150*x+xOrigin, 45*y+yOrigin);
curveVertex(75*x+xOrigin, 25*y+yOrigin);
curveVertex(25*x+xOrigin,25*y+yOrigin);
endShape(CLOSE);

fill(#1D7373);
beginShape();
vertex(50*x+xOrigin, 150*y+yOrigin);
vertex(50*x+xOrigin, 50*y+yOrigin);
vertex(75*x+xOrigin, 50*y+yOrigin);
curveVertex(75*x+xOrigin, 50*y+yOrigin);
curveVertex(150*x+xOrigin, 50*y+yOrigin);
curveVertex(175*x+xOrigin,100*y+yOrigin);
curveVertex(150*x+xOrigin, 135*y+yOrigin);
curveVertex(75*x+xOrigin, 150*y+yOrigin);
curveVertex(50*x+xOrigin, 150*y+yOrigin);
endShape(CLOSE);

//First Letter W:
fill(#FF7373);
beginShape();
vertex(50*x+xOrigin, 175*y+yOrigin);
vertex(75*x+xOrigin, 175*y+yOrigin);
vertex(100*x+xOrigin, 250*y+yOrigin);
vertex(150*x+xOrigin, 200*y+yOrigin);
vertex(175*x+xOrigin, 200*y+yOrigin);
vertex((175+50/3)*x+xOrigin, 250*y+yOrigin);
vertex(400, (25+50/3)*y+yOrigin-(400-400*x-xOrigin));
vertex(400, 75*y+yOrigin-(400-400*x-xOrigin));
vertex(200*x+xOrigin, 275*y+yOrigin);
vertex(175*x+xOrigin, 275*y+yOrigin);
vertex((150+25/3)*x+xOrigin, 225*y+yOrigin);
vertex((100+25/3)*x+xOrigin, 275*y+yOrigin);
vertex((75+25/3)*x+xOrigin, 275*y+yOrigin);
endShape(CLOSE);

//Second Letter W:
fill(#86B32D);
beginShape();
vertex(200*x+xOrigin, 275*y+yOrigin);
vertex(175*x+xOrigin, 275*y+yOrigin);
vertex((200+25/3)*x+xOrigin, 375*y+yOrigin);
vertex((225+25/3)*x+xOrigin, 375*y+yOrigin);
vertex((275+25/3)*x+xOrigin, 325*y+yOrigin);
vertex(300*x+xOrigin, 375*y+yOrigin);
vertex(325*x+xOrigin, 375*y+yOrigin);
vertex(400, 300*y+yOrigin-(400-400*x-xOrigin));
vertex(400, (250+50/3)*y+yOrigin-(400-400*x-xOrigin));
vertex((300+50/3)*x+xOrigin, 350*y+yOrigin);
vertex(300*x+xOrigin, 300*y+yOrigin);
vertex(275*x+xOrigin, 300*y+yOrigin);
vertex(225*x+xOrigin, 350*y+yOrigin);
endShape(CLOSE);
}

