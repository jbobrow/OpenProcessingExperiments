
void setup()
{
  size(400,400);
  frameRate(15);
  noStroke();
  noCursor();
  
}

void draw()
{
  background(random(100,255),random(100,255),random(100,255));
  fill(random(150,255));
  ellipse(mouseX,mouseY,mouseX-mouseY,mouseY-mouseX);
  fill(random(100,255));
  ellipse(pmouseX,pmouseY,pmouseY-pmouseX,pmouseX-pmouseY);
  ellipse(pmouseX-pmouseY,pmouseY-pmouseX,pmouseY-pmouseX,pmouseX-pmouseY);
  
  
}

void mousePressed()
{
  
float x=200;
float y=200;
float a=120;
float b=120;
rectMode(CENTER);

 background(0); 
 fill(255);
 ellipse(x,y,y,y);
 rect(x,y*1.5,y,y);
 fill(0);
 ellipse(x/1.15,y,y/10,y/10);
 ellipse(x/.90,y,y/10,y/10);
 ellipse(x,y+(y/5),a/5,b/5);
 
  fill(255);
 rect(x,y,x/8,y/2.7);
 }
 
 


