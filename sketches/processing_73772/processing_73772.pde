
//Sarah Anderson, seanders
//Assignment 6C, stamp3
//press mouse button to place a stamp
//hold down mouse button to continuously draw the stamp
//press "r" key to change to red
//press "b" key to change to blue


float x,y,di,px,py,rot;

void setup()
{
size(500,500);
background(50);
smooth();
x=0;
y=0;
di=40;
rot=random(0,360);
frameRate(10);
stroke(178,29,34,160);
fill(92,255,255,100);

}

void draw()
{
  
if(mousePressed)
  {
  translate(mouseX,mouseY); 
  rotate(radians(rot));
  spadeShape(x,y,di);
  rot=random(0,360);
  pushMatrix();
  translate(0,0);
  popMatrix(); 
  }
}

void keyPressed()
{
if(key=='r')
  {
stroke(36,142,134,160);
fill(255,93,93,100);
  }
else if(key=='b')
  {
  stroke(178,29,34,160);
  fill(92,255,255,100);  
  }
}


void spadeShape (float x, float y, float di)
{ 
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
