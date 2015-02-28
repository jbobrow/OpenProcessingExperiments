
//Ji-Young Lee
//jiyoung3@andrew.cmu.edu
//copyrights @ JIYOUNG LEE
//HW4


float x,y,wd,ht,d1,d2,z;
 
 
int value = 0;
 
void setup()
{
 
  size(400,400);
  background(255,113,113);
  x=width/2;
  y=height/2;
  wd=random(10,400);
  ht=random(10,400);
  d1=20;
  d2=20;
  z=50;
}
 
void draw()
{
   
   fill(random(255),random(255),random(255));
   textAlign(CENTER);
   textSize(70);
   strokeWeight(2);
   
   text("Be Happy", 200, 200);
   
   //text("Be Happy", mouseX, mouseY,500,500);
    
   textAlign(CENTER);
 textSize(30);
 strokeWeight(2);
 stroke(20);
 text("smile ^------^",200,frameCount%height*0.5,70);
 
 
 
}
 
void mouseDragged()
{
  noStroke();
  fill(random(255),random(255),random(255),80);
  ellipse(mouseX,mouseY,d1,d2);
  strokeWeight(1.5);
}
 
void keyPressed()
{
  if( key==' ')
  {
    background(random(500),random(500),random(500));
    fill(random(255),random(255),random(255));
  }
  if(key=='b')
  {
    d1=d1+z;
    d2=d2+z;
  }
  if (key=='s')
  {
    d1=d1-z;
    d2=d2-z;
  }
}



