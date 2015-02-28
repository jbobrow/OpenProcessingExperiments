
void setup()
{
  size(400,600);
  background(255,255,255);
  smooth();
  frameRate(30);
  }
void draw()
{
fill(5,0,random(246));
textSize(80);
textAlign(CENTER);
text("Go Eagles",200,200);
fill(random(255),random(255),random(255));
rect(mouseX, mouseY,mouseX/2, mouseY/2);
image(loadImage("logo.png"),mouseX,mouseY,mouseX/2,mouseY/2);
}

