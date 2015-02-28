
void setup()
{
  size (300,300);
  //background(255,232,236);
}
void draw()
{
  
  strokeWeight(30);
  stroke(random(255),random(255),random(255));
  //filter(BLUR);
  filter(POSTERIZE,6);
  filter(DILATE);
  line(150,150,mouseX,mouseY);
  
  
}


