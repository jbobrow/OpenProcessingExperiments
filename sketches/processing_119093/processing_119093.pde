
void setup()
{
  size(500, 500);
  background(255);

}

void draw()
{
  background(255);
  translate(30, 50);
  noStroke();
  
  fill(250, 149, 131);
  rect(10, 0, 30, 60);
  rect(40, 0, 60, 30);
  fill(100, 94, 93);
  ellipse(125, 15, 30, 30);
  rect(150, 0, 60, 30);
  rect(220, 0, 60, 30);
  ellipse(305, 15, 30, 30);
  rect(330, 0, 60, 30);
  rect(400, 0, 30, 60);
  ellipse(415, 85, 30, 30);
  rect(400, 110, 30, 60);
  rect(400, 180, 30, 60);
  ellipse(415, 265, 30, 30);
  rect(400, 290, 30, 60);
  rect(370, 360, 60, 30);
  ellipse(345, 375, 30, 30);
  rect(260, 360, 60, 30);
  rect(190, 360, 60, 30);
  ellipse(165, 375, 30, 30);
  rect(80, 360, 60, 30);
  rect(10, 360, 60, 30);
  ellipse(25, 335, 30, 30);
  rect(10, 250, 30, 60);
  rect(10, 180, 30, 60);
  ellipse(25, 155, 30, 30);
  rect(10, 70, 30, 60);
  
  
  translate(20, 200);
  //1
  stroke(0);
  line(0, 20, mouseX, mouseY);
  //2
  stroke(0);
  line(133, 20, mouseX, mouseY);
  //3
  stroke(0);
  line(266, 20, mouseX, mouseY);
  //4
  stroke(0);
  line(400, 20, mouseX, mouseY);
  
  //1
  fill(250, 149, 131);
  noStroke();
  ellipse(0, 20, 10, 10);
  //2
  noStroke();
  fill(250, 149, 131);
  ellipse(mouseX, mouseY, 10, 10);
  //3
  noStroke();
  fill(250, 149, 131);
  ellipse(133, 20, 10, 10);
  //4
  noStroke();
  fill(250, 149, 131);
  ellipse(266, 20, 10, 10);
  //5
  noStroke();
  fill(250, 149, 131);
  ellipse(400, 20, 10, 10);
}
