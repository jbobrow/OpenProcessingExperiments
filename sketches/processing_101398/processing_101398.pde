
//Juanma Moreno, 2013
void setup() 
{
  size(640, 320);
  background(200, 200, 155);
  rectMode(CENTER);
}


void draw() 
{
}

void mouseDragged()
{  
  line(pmouseX,pmouseY,mouseX,mouseY);
  line(width/2+((width/2)-pmouseX),pmouseY,width/2+((width/2)-mouseX),mouseY);
  float green = dist(mouseX,mouseY,width/2,height);
  stroke(100, green, 50);
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);
  lineWidth = constrain(lineWidth, 4, 12);
  strokeWeight(lineWidth);
}
