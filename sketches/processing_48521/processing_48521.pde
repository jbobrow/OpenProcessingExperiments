


void setup()
{
  size(400, 600, P3D);
  background(255, 249, 126);
  smooth();
  textAlign(CENTER);
  textSize(26);
  frameRate(5);
  lights();
  //noLoop(); //do the draw only once
}

void draw()
{
  image(loadImage("logo.png"),150,150);
  strokeWeight(random(2));
  fill(255, 255, 255, 75);
  rect(0, 0, width, height);
  fill(126, 255, random(224));
  text("Christmas Break!", random(width), random(height));
  fill(166, 126, random(255));
  textSize(mouseY/10);
  text("NO SCHOOL", mouseX, mouseY);
}

