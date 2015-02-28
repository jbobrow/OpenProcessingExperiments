
//Samyukta Madhu
//17th Feb, 2013
//Four Divided Sections
//Creative Computing
void setup() {
  size(1000, 1000);
  background(0);
}

void draw() {
  noStroke();
  fill(255, 0, 0, 10);
  ellipse(mouseX, mouseY, 100, 100);

  fill(250, 146, 10, 10);
  ellipse(mouseX+20, mouseY, 100, 100);

  fill(255, 255, 0, 10);
  ellipse(mouseX+40, mouseY, 100, 100);

  fill(0, 255, 0, 10);
  ellipse(mouseX+60, mouseY, 100, 100);

  fill(0, 0, 255, 10);
  ellipse(mouseX+80, mouseY, 100, 100);

  fill(140, 10, 250, 10);
  ellipse(mouseX+100, mouseY, 100, 100);

  fill(255, 0, 244, 10);
  ellipse(mouseX+120, mouseY, 100, 100);

  //top left
  if ((mouseX<500) && (mouseY<500))
  {
    fill(255, 155, 20, 10);
    ellipse(0, 250, mouseX+350, mouseY+350); //left
    fill(255, 0, 50, 10);
    ellipse(250, 0, mouseX+350, mouseY+350);
    fill(0, 0, 0, 10);
    ellipse(500, 500, mouseX-200, mouseY-200);
  } //top
  //top right
  if ((mouseX>500) && (mouseY<500))
  {
    fill(181, 10, 245, 10);
    ellipse(1000, 250, mouseX, mouseY+350); //right
    fill(255, 28, 230, 10);
    ellipse(750, 0, mouseX, mouseY+350);
    fill(0, 0, 0, 10);
    ellipse(500, 500, mouseX-200, mouseY-200);
  }
  //bottom left
  if ((mouseX<500) && (mouseY>500))
  {
    fill(245, 215, 20, 10);
    ellipse(0, 750, mouseX+350, mouseY); //left
    fill(60, 140, 30, 10);
    ellipse(250, 1000, mouseX+350, mouseY);
    fill(0, 0, 0, 10);
    ellipse(500, 500, mouseX-200, mouseY-200);
  }
  //bottom right
  if ((mouseX>500) && (mouseY>500))
  {
    fill(30, 30, 255, 10);
    ellipse(1000, 750, mouseX-100, mouseY-100); //right
    fill(10, 170, 245, 10);
    ellipse(750, 1000, mouseX-100, mouseY-100);
    fill(0, 0, 0, 10);
    ellipse(500, 500, mouseX-200, mouseY-200);
  }
}
