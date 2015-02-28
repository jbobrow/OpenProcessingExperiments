
void setup()
{
  size(600, 600);
  background(0, 200, 255);
  smooth();
  //frameRate();
}


void draw()
{
  //background(255,255,255);
  fill(255, 255, 255, 50);
  rect(0,0,width,height);

  image(loadImage("funny looking guy.jpg"), mouseX, mouseY, mouseX, mouseY);
   fill(0,0,0);
  textSize(random(100));
  text("Dog...", random(width), random(height));
}
  


