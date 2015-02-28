
void setup()
{
  size(400, 600);
  background(255, 0, 0);
  smooth();

}
void draw()
{
  fill(255, 0, 0);
  rect(0, 0, width, height);
  fill(0, 255, 0);
  textAlign(CENTER);
  textSize(36);
  text("Merry\n Christmas!", 200, 50);
  noStroke();
  fill(255, 255, 255);
  ellipse(random(400), random(600), 5, 5);

  // angel
  fill(250, 255, 250);
  triangle(mouseX, mouseY, mouseX+75, mouseY+150, mouseX-75, mouseY+150);
  fill(255, 255, 0);
  ellipse(mouseX, mouseY, 50, 50);
  fill(255, 150, 0);
  triangle(mouseX+25, mouseY+50, mouseX+125, mouseY+85, mouseX+35, mouseY+75);
  fill(255, 155, 0);
  triangle(mouseX-25, mouseY+50, mouseX-100, mouseY+85, mouseX-35, mouseY+75);
}

void mousePressed()
{
  fill(0, 0, 0);
  textAlign(CENTER);
  textSize(48);
  text("Gloria", 200, 400);
}
void keyPressed()
{
  save("snapshot.jpg");
}


