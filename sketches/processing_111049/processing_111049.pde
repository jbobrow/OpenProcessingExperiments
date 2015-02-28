
float diameter;
void setup()
{
  size(400, 400);
  frameRate(10);
  diameter = 50;
}

void draw()
{
  fill(0);
  rect(0,0,width,height);
 
 diameter = diameter + random(4);
 
 
 if(diameter >= width || diameter >= height)
 {
   diameter =50;
 }
 fill( random(255), random(255), random(255));
  ellipse(width/2, height/2, diameter, diameter);
}


