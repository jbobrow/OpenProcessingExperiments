
float counter =0;
void setup()
{
  size(500,500);
  colorMode(HSB,360,100,100);

}

void draw()
{
  background(60,2,95);
  {
  float sec= map(second(), 0,60,20,width); 
  fill(57,100,100);
  noStroke();
  rect(0,0,sec,60);
  
  float min= map(minute(), 0,60, 20,width); 
  fill(50,100,100);
  noStroke();
  rect(0,60,min,120);

  
  float h= map(hour(), 0,24, 20,width);
  
  counter= map(hour(), 0,24, 0, PI);
  // bei PI est es wieder bei 0 (360°)
 
  float c= map(sin(counter), 0,1, 0,100);
  fill (200,0,c);
  noStroke();
  rect(0,180,h,360);
  println();
  }  

 }


