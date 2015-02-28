
void setup()
{
  size(500, 500);
  background (255);
}
void draw()
{
  background(255);
  noStroke();
  rectMode(CENTER);

  pushMatrix();
  float x1 = map(mouseX, 0, 500, 25, 100);
  float x2 = map(mouseX, 0, 500, 100, 25);

  // grau
  fill(200);
  //1
  rect(50, 50, x1, x1);
  rect(250, 50, x1, x1);
  rect(450, 50, x1, x1);
  //2
  rect(150, 150, x1, x1);
  rect(350, 150, x1, x1);
  //3
  rect(50, 250, x1, x1);
  rect(250, 250, x1, x1);
  rect(450, 250, x1, x1);
  //4
  rect(150, 350, x1, x1);
  rect(350, 350, x1, x1);
  //5
  rect(50, 450, x1, x1);
  rect(250, 450, x1, x1);
  rect(450, 450, x1, x1);
  
  // schwarz
  fill(100);
  //1
  rect(150, 50, x2, x2);
  rect(350, 50, x2, x2);
  //2
  rect(50, 150, x2, x2);
  rect(250, 150, x2, x2);
  rect(450, 150, x2, x2);
  //3
  rect(150, 250, x2, x2);
  rect(350, 250, x2, x2);
  //4
  rect(50, 350, x2, x2);
  rect(250, 350, x2, x2);
  rect(450, 350, x2, x2);
  //5
  rect(150, 450, x2, x2);
  rect(350, 450, x2, x2);

  popMatrix();
}

