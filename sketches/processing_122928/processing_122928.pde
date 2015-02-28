
float counter = 0;
void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100); 
 }
 
 
 void draw()
{
  
  float b = map(sin(counter), -1, 1, 0, 360);  
 
  background (#FF0011); 
  counter += 0.01;
  pushMatrix();
  int sec= second()*2;
  fill(b,100,100);
  noStroke();
  counter += 0.01;
  ellipse(250,250,-sec,sec);
  
  
  
  int min= minute()*3;
  fill(b,100,100);
  noStroke();
  ellipse(100,100,-min,min);
  
  int h= hour()*3;
  fill(b,100,100);
  noStroke();
  ellipse(400,400,-h,h);
  
  
  
  popMatrix();
  
  
  
  
  
  
  
 
  




}
