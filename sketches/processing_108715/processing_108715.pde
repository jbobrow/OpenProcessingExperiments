
void setup()
{
  size(500, 500);
  background(255);
  frameRate(30);
}
void draw()
{
  noStroke();
  fill(255, 255, 255, 64);
  rect(0, 0, height, width);
  
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(mouseX, height / 2 + mouseX / 3, mouseX / 2, mouseX / 2);
  ellipse(mouseX, height / 2, mouseX / 3, mouseX / 3);
  ellipse(mouseX, height / 2 - mouseX * 30 / 135, mouseX / 4, mouseX / 4);
  
  fill(255, 180, 0);
  triangle(mouseX, height / 2 - mouseX * 19 / 100, mouseX, height / 2 - mouseX * 24 / 100, mouseX * 5 / 6, height / 2 - mouseX * 21 / 100);
  
  fill(0);
  strokeWeight((mouseX * 15) / width);
  strokeCap(ROUND);
  line(mouseX * 420 / 500, height / 2 - mouseX / 3, mouseX * 580 / 500, height / 2 - mouseX / 3);
  point(mouseX * 470 / 500, height / 2 - mouseX * 137 / 500);
  point(mouseX * 525 / 500, height / 2 - mouseX * 137 / 500);
  noFill();
  arc(mouseX, height / 2 - mouseX * 30 / 135, mouseX / 5, mouseX / 6, radians(55), radians(125));
  strokeWeight((mouseX * 20) / width);
  strokeCap(PROJECT);
  fill(0);
  rect(mouseX * 450 / 500, height / 2 - mouseX * 230 / 500, mouseX * 100 / 500, mouseX * 60 / 500);
  point(mouseX, width / 2 +  mouseX * 20 / 500);
  point(mouseX, width / 2 +  mouseX * 120 / 500);
  point(mouseX, width / 2 +  mouseX * 220 / 500);
}
