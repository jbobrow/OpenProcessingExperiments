
void setup()
{
size(500, 500);
background(0);
}

void draw()
{
background(0);

pushMatrix();

  translate(100, 100);
  noFill();
  rotate(millis()/200.0);
  stroke(255, 150, 0);
  rectMode(CENTER);
  rect(0, 0, 25, 25);
  
popMatrix();
resetMatrix();

pushMatrix();
  
  translate(150, 350);
  noFill();
  rotate(millis()/350.0);
  stroke(255, 150, 0);
  rectMode(CENTER);
  rect(0, 0, 35, 35);
  
  translate(45, 30);
  noFill();
  rotate(millis()/100.0);
  stroke(150, 200, 70);
  rectMode(CENTER);
  rect(0, 0, 20, 15);

popMatrix();
resetMatrix();

pushMatrix();
  
  translate(350, 300);
  noFill();
  rotate(millis()/200.0);
  stroke(255, 150, 0);
  rectMode(CENTER);
  rect(0, 0, 50, 50);
  
  noFill();
  rotate(millis()/300.0);
  stroke(150, 200, 70);
  rectMode(CENTER);
  rect(0, 0, 50, 50);

popMatrix();
resetMatrix();

pushMatrix();

float pos = (mouseX);

  fill(random(100, 255), random(50), 50, 100);
  translate(300, 150);
  stroke(random(100, 255), random(50), 50);
  rectMode(CENTER);
  rotate(pos/200.0);
  rect(0, 0, 75, 75);

popMatrix();
resetMatrix();

pushMatrix();

float pos_1 = (mouseX);

  fill(random(100, 255), random(50), 50, 100);
  translate(250, 450);
  stroke(random(100, 255), random(50), 50);
  rotate(pos_1/100.0);
  triangle(0, 0, 0, 20, 20, 10);

popMatrix();
resetMatrix();

pushMatrix();

float pos_2 = map(second(), 20, 59, 0, 500);
  
float rot = map(millis(), 0, 59, 0, 360);
  
  translate(pos_2, height/2);
  rotate(rot/500.0);
  noFill();
  stroke(155, 100, 165);
  rectMode(CENTER);
  rect(0, 0, 50, 50);

popMatrix();
resetMatrix();

pushMatrix();

//float pos_2 = map(second(), 20, 59, 0, 500);
  
float rot_1 = map(millis(), 0, 59, 0, 360);
  
  translate(mouseX, mouseY);
  rotate(rot_1/500.0);
  fill(50, random(120, 200), 0, 100.0);
  noStroke();
  //rectMode(CENTER);
  ellipse(0, 0, 50, 50);

popMatrix();

}
