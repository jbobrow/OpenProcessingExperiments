
void setup()
{
  size(650, 650);
}

void draw()
{
  float d = dist(width/2, height/2, mouseX, mouseY);

  background(255, 255, d);

  pushMatrix();
  translate(width/2, height/2);

  rotate(millis()/200*PIE); 

  noStroke();
  fill(255, d, d);

  triangle(0, 0, -500, 0, -500, -250);
  triangle(0, 0, -500, -500, -250, -500);
  triangle(0, 0, 0, -500, 250, -500);
  triangle(0, 0, 500, -500, 500, -250);

  triangle(0, 0, 500, 0, 500, 250);
  triangle(0, 0, 500, 500, 250, 500);
  triangle(0, 0, 0, 500, -250, 500);
  triangle(0, 0, -500, 500, -500, 250);

  popMatrix();

  stroke(0);
  strokeWeight(3);
  fill(255, 0, 0);

  ellipse(325, 325, 150, 110);
  ellipse(325, 315, 130, 90);
  line(260, 300, 260, 315);
  line(390, 300, 390, 315);
  ellipse(325, 300, 130, 90);


  if (mousePressed && (mouseButton == LEFT) && d < 60);
  {
    fill(0);
    rect(0, 0, width, height);
    textSize(215);
    fill(255);
    text("BOOM", 0, 400);
  }
} // end draw

