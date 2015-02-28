
void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);
}
void draw()
{ 
  ellipse(mouseX,mouseY,50,50);
  fill(random(255),random(255),random(255));
  
  stroke(random(255), random(255), random(255));
  line(0,0, pmouseX, pmouseY);
  line(0,600,pmouseX,pmouseY);
  line(600,600,pmouseX,pmouseY);
  line(600,0,mouseX,mouseY);
}
