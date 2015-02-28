
void setup()
{
  size(1400,950);
  smooth();
  frameRate(60);
  
}

void draw()
{
  background(random(255),random(255),random(255));
  ellipse(width/2,height/2,400,400);
  ellipse(650,height/2,10,10);
  ellipse(750,height/2,10,10);
  line(650,525,750,525);
  fill(255,255,255);
  textSize(36);
  text("GIT ON MEH",mouseX,mouseY);
}

