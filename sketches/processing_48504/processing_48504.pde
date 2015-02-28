
void setup()
{
  size(400, 600);
  background(7, 165,8);
  smooth();
  textAlign(CENTER);
  textSize(12);


}

void draw()
{
  fill(7,165,8,25);
  rect(0,0,width,height);
  fill(random(175,255),random(0),random(0));
  textSize(mouseY/5);
  text("Merry\n Christmas!", mouseX, mouseY);
  
}


