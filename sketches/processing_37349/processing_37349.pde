
//homework 4
//copyright Andrew Viny, Carnegie Mellon University, Sept 2011, Pittsburgh,Pa


int xCenter,yCenter,dia,yC,xC,col1,col2,col3,col4;
void setup()
{
  size(400,400);
  noFill();
  col1=color(148,229,201);
  col2=color(255,255,153);
  col3=color(51,153,255);
  col4=color(255,102,102);
}
void draw()
{ 
 
  xCenter = 0;
  yCenter = height/2;
  dia = 20;
  background (255);
  
  while(xCenter < width) {
    if (xCenter < width/2) {
     stroke(col1); 
     ellipse(xCenter,yCenter,dia,dia);
     dia = dia + 10;
     }
    else if  ( xCenter > width/2) {
      stroke(col2);
       ellipse(xCenter,yCenter,dia,dia);
     dia = dia - 10;
    }
    xCenter=xCenter+10;
    }
    
    xCenter = width/2;
    yCenter = 0;
    dia = 20;
  
  while(yCenter < height) {
    if (yCenter < height/2) {
     stroke(col3);
     ellipse(xCenter,yCenter,dia,dia);
     dia = dia + 10;
    } else if  ( yCenter > height/2) {
       stroke(col4);
       ellipse(xCenter,yCenter,dia,dia);
     dia = dia - 10;
    }
    yCenter=yCenter+10;
    }
}               
