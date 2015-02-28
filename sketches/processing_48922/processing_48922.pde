
void setup()
{
  size(400,600);
  background(0,255,255);
  smooth();
  textAlign(CENTER);
  frameRate(15);

}

void draw()
{
  textSize(50);
  fill(0,255,255,10);
  fill(random(255),random(255),random(255),235);
  ellipse(random(width),random(height),mouseX/2,mouseY/2);
  
}

void keyPressed()
{
  save ("snapshot.jpg");
  fill(random(255),random(255),random(255));
  rect(0,0,width,height);
}               
