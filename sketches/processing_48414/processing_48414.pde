
void setup ()
{
  size (400,600);
  background (255,255,255);
  smooth();
  textAlign(CENTER);
}
void draw ()
{
 fill(255,255,255,75);
 rect(0,0, width, height);
  textSize(24);
  fill(random(255),random(255),random(255));
  text("God bless you this Christmas!", mouseX,mouseY);
  image(loadImage("logo.png"),0,0);
  
}
void keyPressed ()
{
  stop();
}


