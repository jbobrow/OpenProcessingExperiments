
void setup()
{
  size(500,500);
}

void draw()
{
  background(245);
  fill(255);
  stroke(0);
  rectMode(CENTER);
  
  rect(125,200,50,200);
  rect(225,200,50,200);
  noStroke();
  fill(69,201,120);
  rect(325,200,50,200);
  stroke(0);
  fill(255);
  rect(425,200,50,200);
  stroke(69,201,120);
  rect(275,350,350,50);
  stroke(0);
  rect(275,425,350,50);
  
  pushMatrix();
  translate(325,200);
  float Kippen = map(mouseX,0,width,0,PI/6);
  rotate(Kippen);
  stroke(0);
  fill(255);
  rect(0,0,50,200);
  popMatrix();
  resetMatrix();

  
}
