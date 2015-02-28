
void setup()
{
  size(400, 600);
  background(60, 56, 206);
  smooth();
  textAlign(CENTER);
  frameRate(16);
}




void draw()
{
  fill(60, 56, 206, 75);
  rect(0, 0, width, height);


  if (mousePressed)

    fill(random(230, 242), random(122, 170), random(132, 198));

  textSize(33);
  text("Feliz \n Navidad", mouseX+width/random(1, 8), mouseY+height/random(3, 7));
}


