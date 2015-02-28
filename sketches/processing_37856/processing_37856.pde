
import processing.pdf.*;
float dividor;
float initialDividor;
int loopCount;
int count = 0;
int tempWidth;
int tempHeight;
void setup()
{
  size(1024, 768, PDF, "wallpaper.pdf"); //generates PDF
  //size(1024, 768);
  rectMode(CENTER);
  ellipseMode(CENTER);
  tempWidth = width/2;
  tempHeight = height/2;
  if (height > width)
  {
    dividor = tempHeight;
  }
  else
  {
    dividor = tempWidth;
  }
  initialDividor = dividor;
  loopCount = tempHeight;
  background(0);
  
}
void draw()
{
    int c = 1;
    while(c < dividor)
    {
       fill(random(255), random(255), random(255), random(200));
       stroke(random(255));
       strokeWeight(random(1,3));
       //rotate(random(-PI, PI));
       rect(tempWidth/2, tempHeight/2, tempWidth-c, tempHeight-c);
       pushMatrix();
       translate(tempWidth,tempHeight);
       rect(tempWidth/2, tempHeight/2, tempWidth-c, tempHeight-c);
       popMatrix();
       
       fill(random(255), random(255), random(255), random(200));
       stroke(random(255));
       strokeWeight(random(1,3));
       pushMatrix();
       translate(0,tempHeight);
       rect(tempWidth/2, tempHeight/2, tempWidth-c, tempHeight-c);
       popMatrix();
       
       pushMatrix();
       translate(tempWidth, 0);
       rect(tempWidth/2, tempHeight/2, tempWidth-c, tempHeight-c);
       popMatrix();
       c+=10;
       count++;
    }
     //dividor = initialDividor;
 println(frameCount);
 if (loopCount < 1)
 {
  exit(); //essential for genera
  noLoop();
 }
 else
 {
   loopCount--;
 }
}

