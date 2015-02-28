
void setup()
{
  size(400, 600);
  background(155,155,155);
  smooth();
  textAlign(CENTER);
}
void draw()
{
  textSize(36);
  fill(155,155,155,50);
  rect(0,0,width,height);
  fill(255,255,255);
  rect(0,450,width,200);
  frameRate(15);
  ellipse(random(width),random(height),20,20);
  fill(0,255,0);
  triangle(200,100,75,400,325,400);
  fill(126,92,37);
  rect(175,400,50,50);
  fill(random(255),random(255),random(255));
  text("merry\n christmas!",random(width),random(height));
  
}


