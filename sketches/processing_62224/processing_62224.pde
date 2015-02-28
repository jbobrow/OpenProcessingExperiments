
void setup()
{
  
  size(700,900);
  textAlign(CENTER);
  smooth(); 
}

  void draw()
{
  fill(0,0,0,50);
  rect(0,0,width,height);
  fill(0,150,50);
  textSize(100);
  text("MSU!!", mouseX, mouseY,300, 300);


}

void mousePressed()
{
    image(loadImage("new-msu-logo.png"), random(width),random(height));
}

