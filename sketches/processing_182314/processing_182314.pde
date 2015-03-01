
void setup()
{
  size(600, 600);
  smooth();
  background(#C6CB37);
  
}

void draw()
{
  stroke(159, 198, 219);
  strokeWeight(5);
  strokeCap(SQUARE);
  line(200, 200, 400, 400);
  stroke(159, 198, 219);
  strokeWeight(7);
  line(200, 150, 400, 400);
  stroke(159, 198, 219);
  strokeWeight(10);
  line(200, 100, 400, 400);
  fill(24, 83, 84, 10);
  rect(100, 100, 50, 450);
  fill(24, 83, 84, 200);
  beginShape();
  vertex(180, 82);
  vertex(207, 36);
  vertex(214, 63);
  vertex(407, 11);
  vertex(412, 30);
  vertex(219, 82);
  vertex(226, 109);
  endShape(CLOSE);
  
  rect(100, 500, 400, 50);
  triangle(400, 50, 400, 100, 300, 50);
  triangle(400, 100, 400, 150, 300, 100);
  fill(222, 121, 146, 50);
  ellipse(500, 500, 400, 400);
  ellipse(200, 200, 400, 400);
  fill(55, 55, 55);
  arc(450, 250, 100, 100, 0, PI+HALF_PI);
  noFill();
  ellipse(350, 400, 600, 600);
}


