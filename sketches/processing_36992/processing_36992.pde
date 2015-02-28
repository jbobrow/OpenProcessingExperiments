
// homework 4
// copyright Joanne Ong September 2011 Pittsburgh, PA 15213
 
float x, y, wd, ht;
color gree, blu, ylw, blu2;
int value, mouseclick;

void setup()
{
size( 400,400);
background(210 , 211, 169);
stroke(255, 255,255);
x=200;
y=200;
wd=370;
ht=370;
value = 0;
mouseclick = 0;
gree = color(109, 152, 136); 
blu = color(70, 111, 126);
ylw = color(219, 158, 54);
blu2 = color(16, 91, 99);
}
 
 
void draw()
{
//bg
fill(210 , 211, 169);
noStroke();
rect(0,0,400,400);
 
//circles
smooth();
ellipseMode(CENTER);
stroke(255, 255,255);
fill(gree);
strokeWeight (3);
ellipse(x, y, wd, ht);
fill(blu);
noStroke();
ellipse(x, y, .9*wd, .9*ht);
 
 
//J
strokeWeight (7);
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
  
}
 
void keyPressed()
{
  if (keyCode == DOWN)
  {
    y = y+10;
    
  }
  else if (keyCode == UP)
  {
    y = y-10;
    
  }
  else if (keyCode == LEFT)
  {
    x=x-10;
     
  }
   else if (keyCode == RIGHT)
  {
    x=x+10; 
  }
     else if(key == 'z' && wd > 0)
  {
    wd = 3*x;
    ht = 3*y;  
  }
  else if(key == 'x' && wd>0)
  {
    x=200;
    y=200;
    wd=370;
    ht=370; 
  }
  
 }
  
void mouseClicked() {
  mouseclick = mouseclick + 1;
  if(mouseclick % 2 == 0) 
  {
    gree = ylw;
    blu = blu2;
  }
  else {
    gree = color(109, 152, 136);
    blu = color(70, 111, 126);
  }
}

