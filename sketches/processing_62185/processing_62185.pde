
void setup()
{
  size(1400,950);
  background(255,255,255);
  smooth();
  frameRate(60);
  
}

void draw()
{
  fill(255,255,255,50);
  rect(0,0,width,height);
  fill(0,0,0);
  textSize(150);
  text("BABY",random(1400),random(950));
  fill(0,0,0);
  textSize(150);
  text("POWER",random(1400),random(950));
  image(loadImage("baby.png"),mouseX,mouseY,mouseX,mouseY);

}

