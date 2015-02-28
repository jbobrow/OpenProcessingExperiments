

void setup()
{
  size(824,568);
}
void draw()
{
  PImage laFoto;
laFoto = loadImage("2.jpg");
  image(laFoto,0,-200);
  
  fill(255,0,0);
  ellipse(mouseX,mouseY-12.5,16,16);
  fill(250,130,130);
  ellipse(mouseX,mouseY-7.5,15,15);
  rect(mouseX-6,mouseY+18,4,10);
  rect(mouseX+3,mouseY+18,4,10);
  rect(mouseX-10,mouseY+5,20,4);
  fill(0,0,255);
  rect(mouseX-6,mouseY,13,20);
  noCursor();
  }



