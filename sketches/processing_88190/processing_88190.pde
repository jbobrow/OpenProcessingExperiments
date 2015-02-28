
PImage img; 

void setup()
{
  size(800,800);
  img= loadImage("home.jpg");
}
void draw()
{
  background(0);
  tint(mouseX/2,25,mouseY/5);
  imageMode(CENTER);
  image(img,400,400,400,300);
}


