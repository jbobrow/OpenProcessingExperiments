
//import processing.pdf.*;
int diam=10;
float centX, centY;
float r;
float g;
float b;

void setup()
{
r=random(255);
g=random(255);
b=random(255);
  size(1000,1000);
  frameRate(24);
  smooth();
  background(255);
  centX = width/2;
  centY = height/2;
  fill(r,g,b,75);
  
  //beginRecord(PDF, "davidrutledge.pdf");
}

void draw()
{
 
  if(diam<=600)
  {
    background(0);
    ellipse(centX,centY,diam,diam);
    diam+=10;
  }
    
    if(diam<=700)
    {
      ellipse(mouseX,mouseY,20,20);
    }
}

//void mouseClicked()
//{
  //endRecord();

//}



