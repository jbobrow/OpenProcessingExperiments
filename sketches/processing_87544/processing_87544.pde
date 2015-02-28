
//Hao-Yun Mei_hmei
//Copyright_Hao-Yun Mei_Carnegie Mellon University

float diam;

void setup()
{
size(400,400);
ellipseMode(CENTER);
diam=50;
smooth();

}

void draw()
{
  fill(255);
  rect(0,0,width,height);
//fill(0);
//rect(mouseX,mouseY,abs(mouseX-pmouseX),abs(mouseY-pmouseY));
alien( mouseX,mouseY);
if (mousePressed) saveFrame("hw5.jpg");

}

void alien(float fx, float fy)
{
  fill(110,255,100);
  ellipse(fx,fy, diam, diam);
  fill(0);
  ellipse(fx-10,fy-2,diam/3,diam/4);
  ellipse(fx+10,fy-2,diam/3,diam/4);
  if(mousePressed==true)
  {
    fill(255,0,0);
    ellipse(fx-10,fy-2,diam/3,diam/4);
    ellipse(fx+10,fy-2,diam/3,diam/4);
   
  }
  if(keyPressed==true)
  {
    fill(random(255), random(255), random(255));
    ellipse(fx,fy, diam, diam);
    
  }
 
}

