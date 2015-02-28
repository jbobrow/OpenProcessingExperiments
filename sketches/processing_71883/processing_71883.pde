
//homework 5
//Matt Dawson
//madawsonandrew.cmu.edu
//copyright © Matt Dawson September 2012 Pittsburgh PA 15213 All Rights Reserved

//press up to increase size of initials
//press down to decrease size of initials
//click mouse to change colors

float x,y,d;
color c1,c2,c3,c4,c11,c22,c33;

void setup()
{
  size(500,500);
  smooth();
  x=200;
  y=200;
  d=200;
  c1=color(255,21,36);
  c2=color(4,203,49);
  c3=color(248,252,130);
  c4=color(4,15,203);
  c11= color(4,203,49);
  c22= color(248,252,130);
  c33= color(255,21,36);
}

void draw()
{
  background (255);
  fill(c1,c2,c3,c4);
  drawInitials(mouseX,mouseY,d);
}

void drawInitials(float x,float y,float d)
{
ellipseMode(CENTER);
stroke(c4);
strokeWeight(2);
ellipse(x,y,d,d);

//Initial(M)
strokeWeight(2);
stroke(0,0,0);
fill(c1);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x-(d/3),y-(d/3));
curveVertex(x-(d/2),y);
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

beginShape();
curveVertex(x,y+(d/2));
curveVertex(x,y);
curveVertex(x+(d/3),y-(d/3));
curveVertex(x+(d/2),y);
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/4),y-(d/5));
curveVertex(x,y);
endShape(CLOSE);

//Initial(A)
fill(c2);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(.45*d),y);
curveVertex(x-(d/3),y-(d/4));
curveVertex(x-(d/10),y);
curveVertex(x-(d/8),y+(d/3));
curveVertex(x-(d/4),y+(d/10));
curveVertex(x-(d/3),y+(d/3));
curveVertex(x-(d/3),y+(d/3));
endShape(CLOSE);

//Center initial(A)
fill(255);
beginShape();
curveVertex(x-(.45*d),y);
curveVertex(x-(.4*d),y);
curveVertex(x-(d/3),y-(d/5));
curveVertex(x-(d/6),y);
curveVertex(x-(d/3.5),y-(d/12));
curveVertex(x-(.4*d),y);
endShape(CLOSE);

//Initial (D)
fill(c3);
beginShape();
curveVertex(x,y+(d/2));
curveVertex(x+(d/3),y+(d/3));
curveVertex(x+(.45*d),y);
curveVertex(x+(d/3),y-(d/4));
curveVertex(x+(d/10),y);
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/3),y+(d/3));
endShape(CLOSE);

//Center Initial (D)
fill(255);
beginShape();
curveVertex(x+(d/8),y+(d/3));
curveVertex(x+(d/4),y+(d/4));
curveVertex(x+(.38*d),y);
curveVertex(x+(d/3.5),y-(d/10));
curveVertex(x+(d/5),y+(d/4));
curveVertex(x+(d/8),y+(d/3));

endShape(CLOSE);
}

void keyPressed()
{
  if (keyCode == UP)
  {
    d = d*1.01;
    y = y*1.01;
    x = x*1.01;
    if (d>500){
      d=100;
    }
    
    if (y>500){
      y=100;
    }
    
    if (x>500){
      x=100;
    }
  }
if (keyCode == DOWN)
  {
    d = d*.99;
    y = y*.99;
    x = x*.99;
    if (d<50){
      d=500;
    }
    
    if (y<50){
      y=500;
    }
    
    if (x<50){
      x=500;
    }
  }
}
void mousePressed()
{
  if (mousePressed == true)
  {
  c1 = color(c11);
  c2 = color(c22);
  c3 = color(c33);
  c11= color(c3);
  c22= color(c1);
  c33= color(c2);
  }
}



