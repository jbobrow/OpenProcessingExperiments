
import processing.pdf.*;
int frame_number;
int numsmallellipse;
float y;

void setup()
{
  size(400,1000);
  y = height/2;
  numsmallellipse = 3;
  smooth();
  //noLoop();
}

void draw()
{
  background(180, 0, 0);
  //noFill();
  fill(0, 20);
  
  for(int i = 0; i < 100; i+=10)
  {
  beginShape();
  vertex(0,height);
  for(int x = 0; x < width; x+=5)
  {

   stroke(255);
   vertex(random(x),random(y)+i+ (noise(x*.01, (frameCount*.01), i*.01 )*300));
    
  }
  vertex(1000, 200);
  endShape();
  
  }
  
    for(int i = 0; i < numsmallellipse; i++)
  {
    stroke(255,255,250,40);
    fill(0);
    ellipse(random(width),random(400,1000), 30,30);
    
  }
  
}
  
  void keyReleased()
{
  if(key =='s')
  {
    beginRecord(PDF,"print"+frame_number+".pdf");
    background(50);
  }
 
  if(key =='e')
  {
    endRecord();
    frame_number++; //or frame_number = frame_number+1;
  }
 
  if(key =='x')
  {

    exit();
  }
}
