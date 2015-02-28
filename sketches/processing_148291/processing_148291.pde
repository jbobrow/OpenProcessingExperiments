
PImage pic;

void setup()
{ 
  size(600,400);
  background(random(255),random(255),random(255));
  pic = loadImage("bball.jpg");
  imageMode(CENTER);
}
void draw()
{
  fill(random(255),random(255),random(255), 100);
  rect(0,0,width,height);
  image(pic, mouseX, mouseY,300,200);
}


