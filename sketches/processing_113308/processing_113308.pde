
float  time = 0;
float angle =0;
float s = 0;
void setup()
{
  size(500,500);
  colorMode(HSB,360,100,100);
  background(51);
}
 
 
void draw()
{
  time = time + 0.167;
  
  for (int i = 0; i < width; i = i + 1)
  {
    float percent = i / (float)width;
    stroke(i,(random(255)),random(255));
    line(i,0,i,height);
  }
  fill(255,126);
  ellipse(250, 250, 235, 235);
  
  
  fill(0,0,0,200);
  ellipse(250,250,random(1000)/random(100),random(1000)/random(100));
  
  
  if (time > 5)
  {
    pushMatrix();
    angle = angle + 2;
    
    rotate(frameCount*radians(90) / 20);
    noFill();
    rotate(angle);
    translate(0, -60);
    triangle(30, 75, 58, 20, 86, 75);
    fill(101,250,43,255);
    scale(angle);
    quad(random(38), 31, 86, 20, 69, random(63), 30, 76);
    
    popMatrix();
  }
  if (time >= 10)
  {
    
    time = 0;
    angle = 0;
  }
  
  
}


