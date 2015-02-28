
//Sarah Anderson, seanders
//Assignment 6B, stamp2


float x,y,di,px,py,rot;

void setup()
{
size(600,600);
background(50);
smooth();
x=0;
y=0;
di=25;
//px=20;
//py=20;
rot=random(0,360);
spadeGrid();
}

void draw()
{
background(50);
//placeSpade();
spadeGrid();
//spadeShape(x,y,di);
}

void spadeGrid()
{
for (px=25; px<=width; px+=50)
  { 
   for (py=25; py<=height; py+=50)
     {
     pushMatrix();  
     translate(px,py); 
     rotate(radians(rot));
     spadeShape(x,y,di);
     rot=random(0,360);
     popMatrix();
     translate(0,0);
     }  
  }
}

/*
void placeSpade()
{
if (px<width)
  {
  translate(px,py); 
  rotate(radians(rot));
  spadeShape(x,y,di);
  rot=random(0,360);
  px+=100;
  py+=100;
  }   
}

*/

void spadeShape (float x, float y, float di)
{ 
stroke(178,29,34,160);
fill(92,255,255,100);
spade(x,y,di*3);
spade(x+5,y,di*2);
spade(x+10,y,di);
}
  

void spade(float x, float y, float di)
{
strokeWeight(4);
beginShape();
vertex(x-(di*0.3),y-(di*0.4));
vertex(x-(di*0.3),y+(di*0.2));
vertex(x-(di*0.2),y+(di*0.3));
vertex(x-(di*0.1),y+(di*0.3));
vertex(x-(di*0),y+(di*0.2));
vertex(x+(di*0.1),y+(di*0));
vertex(x+(di*0.3),y+(di*0.3));
vertex(x+(di*0.4),y+(di*0.3));
vertex(x+(di*0.4),y+(di*0.2));
vertex(x+(di*0.1),y+(di*0));
vertex(x+(di*0.3),y-(di*0.1));
vertex(x+(di*0.4),y-(di*0.2));
vertex(x+(di*0.4),y-(di*0.3));
vertex(x+(di*0.3),y-(di*0.4));
vertex(x-(di*0.3),y-(di*0.4));
endShape(CLOSE);
}
