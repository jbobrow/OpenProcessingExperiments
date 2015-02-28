
float counter = 0;
void setup()
{
  size(500, 500);   
  colorMode(HSB, 360, 100, 100); 
 }
 
 
 void draw()
{
  
  float b = map(sin(counter), -1, 40, 0, 360);  
 
  background (#FF7E7E); 
  counter += 0.01;
  pushMatrix();
  int sec= second()*2;
  fill(b,50,100);
  stroke(255);
  counter += 0.01;
  ellipse(250,250,-sec,sec);
  
  
  
  int min= minute()*3;
  fill(b,50,100);
  stroke(255);
  ellipse(100,100,-min,min);
  
  int h= hour()*3;
  fill(b,50,100);
  stroke(255);
  ellipse(400,400,-h,h);
  
  
  
  popMatrix();
  
  
  
  
  
  
 

}

