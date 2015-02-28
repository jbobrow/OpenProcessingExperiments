
int rotateDeg = 46;
float rotAmountX = 0, rotAmountY = 0;

int mousePx, mousePy;

void setup()
{
  size(640, 640, P3D);
  background(255);
  smooth();
  fill(0);
  noStroke();
  rectMode(CORNERS);
  ellipseMode(CENTER);
}

void draw()
{
  translate(width / 2, height / 2);
  background(255);
  if(!mousePressed)
  {
    rotAmountX = 0;
    rotAmountY = 0;
  }
  else
  {
    float changer = .004;
    rotAmountX += (mouseX - mousePx)*changer;
    rotAmountY += (mouseY - mousePy)*changer;
  }
  circle();
  rectangles();
}

void mousePressed()
{
  mousePx = mouseX;
  mousePy = mouseY;
}

void rectangles()
{
  fill(((float)mouseX/(float)width)*255);
  pushMatrix();
  rotate(radians(-rotateDeg));
  rotateX(rotAmountX);
  rotateY(rotAmountY);
  rect(0,0,mouseX,mouseY);
  //rect(width*.5,height*.5,-mouseX+width,-mouseY+height);
  //rect(width*.5,height*.5,mouseX,mouseY);
  //rect(width*.5,height*.5,-mouseX+width,-mouseY+height);
  popMatrix();
  
  pushMatrix();
  rotate(radians(rotateDeg));
  fill(((float)mouseY/(float)height)*255);
  rect(0,0,mouseX,mouseY);
  rect(0,0,-mouseX,-mouseY);
  popMatrix();
  
  rotateDeg+=(mouseY/12)+1;
}

void circle()
{
  rotateX(rotAmountX);
  rotateY(-rotAmountY);
  fill(0,((float)mouseY/(float)height)*255,((float)mouseX/(float)width)*255);

  ellipse(0, 0, mouseX*.5, mouseX*.5);
  if(mouseX > width*.25)
  {
    fill(255);
    ellipse(0, 0, mouseX*.5-width*.25, mouseX*.5-width*.25);
  }
}

void mouseReleased()
{
  rotAmountX = 0;
  rotAmountY = 0;
}

