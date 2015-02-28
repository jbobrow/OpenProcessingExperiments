
// homework 6
// copyright Joanne Ong September 2011 Pittsburgh, PA 15213
  
float x, y, wd, ht;
color gree, blu;

 
void setup()
{
size(600,600);
background(210 , 211, 169);
stroke(255, 255,255);
frameRate(30);
x=200;
y=200;
wd=75;
ht=75;
gree = color(109, 152, 136);
blu = color(70, 111, 126);
}
  
  
void draw()
{
  while (x < 500)
  {
    initials(x,200,75,75);
    x=x+100;
  }
  
 while (y < 500)
 {
   initials(200,y,75,75);
   initials(300,y,75,75);
   initials(400,y,75,75);
    y=y+100;
  }
  
}

void initials(float x, float y, float wd, float ht)
{
//bg
//fill(210 , 211, 169);
//noStroke();
//rect(0,0,400,400);
  
//circles
smooth();
ellipseMode(CENTER);
stroke(255, 255,255);
fill(gree);
strokeWeight (1);
ellipse(x, y, wd, ht);
fill(blu);
noStroke();
ellipse(x, y, .9*wd, .9*ht);
  
  
//J
strokeWeight (2);
stroke(255, 255, 255);
beginShape( );
curveVertex(x-.27*wd, y-.2*ht);  //(100, 125);
curveVertex(x-.27*wd, y-.2*ht);  //(100, 125);
curveVertex(x-.27*wd, y+.07*ht); //(100, 225);
curveVertex(x-.30*wd, y+.12*ht); //(90, 245);
curveVertex(x-.32*wd, y+.12*ht); //(80, 245);
endShape();
  
//M
beginShape();
curveVertex(x-.16*wd, y-.2*ht);   //(140, 125);
curveVertex(x-.16*wd, y-.2*ht);   //(140, 125);
curveVertex(x-.16*wd, y+.12*ht);  //(140, 245);
curveVertex(x-.13*wd, y-.2*ht);   //(152, 125);
curveVertex(x-.04*wd, y-.18*ht);  //(184, 135);
curveVertex(x-.04*wd, y+.12*ht);  //(184, 245);
curveVertex(x-.01*wd, y-.2*ht);   //(196, 125);
curveVertex(x+.07*wd, y-.18*ht);  //(226, 135);
curveVertex(x+.08*wd, y+.12*ht);  //(228, 245);
curveVertex(x+.08*wd, y+.12*ht);  //(228, 245);
endShape();
  
//O
beginShape();
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x+.19*wd, y-.18*ht);  //(270, 135);
curveVertex(x+.19*wd, y+.09*ht);  //(270, 235);
curveVertex(x+.24*wd, y+.14*ht);  //(290, 250);
curveVertex(x+.3*wd, y+.09*ht);   //(310, 235);
curveVertex(x+.3*wd, y-.18*ht);   //(310, 135);
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
curveVertex(x+.24*wd, y-.22*ht);  //(290, 120);
endShape();
   
//saveFrame("hw6.jpg");
}
  



