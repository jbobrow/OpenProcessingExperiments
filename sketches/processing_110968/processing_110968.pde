
int circle = 600;
float n = 0.0;
float inc = 0.01; 
void setup() 
{
  size(800, 600);
  smooth();
  frameRate(30);
}
void draw() 
{
  float randomNumber = random(100); 
  fill(73, 85, 85, 10);
  rect(0, 0, width, height);  
  //ellipse
  float x = random(-5, 5);
  float w = random(2, 30);  
  if (mousePressed==true) 
  {
    stroke(255, 255, 255, 100);
    fill(noise(n*60)*187, noise(n)*242, 105, 20);
    ellipse(mouseX, mouseY, noise(n)*circle*1.5, noise(n)*circle);
    n+=inc;
    stroke(133, 242, 245, 100);
    ellipse(mouseX+x, mouseY+x, w*1.5, w);
  } 
}
