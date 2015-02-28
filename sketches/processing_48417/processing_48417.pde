
void setup()
{
  size(400,600);
  background(255,255,255);
  smooth();
  textAlign(CENTER);
  frameRate(15);
}

void draw()
{
  fill(255,255,255, 75);
  rect(0,0,width,height);

  
  textSize(36);
  fill(random(128),random(50),random(214));
  text("Merry CHRISTmas!",mouseX,mouseY);
  
}


