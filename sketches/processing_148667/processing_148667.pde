
void setup()
{
  size(600, 600);
  background(17, 215, 240);
}

void draw() 
{
  fill(13, 38, 250);
  triangle(100, 300, 200, 200, 300, 300);
  fill(141, 5, 173);
  rect(100, 300, 200, 200);
  fill(0, 0, 0);
  rect(170, 440, 40, 60);

  noFill();
  rect(129, 343, 20, 20);
  noFill(); 
  rect(234, 379, 20, 20);
  line(260, 180, 261, 260);

  if (mousePressed) 
  {
    fill(0, 0, 0); 
    ellipse(193, 390, 200, 200);
    fill (random(255), random(255), random(255));
    textSize(30); 
    text("Bomb", 193, 390); 
    strokeWeight(50);
    stroke(255, 0, 0);
    line(194, 294, 186, 241);
  }
}






