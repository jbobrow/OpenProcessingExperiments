
void setup()
{
  size(800, 400);
  background(0, 0, 0);
}


void draw()
{
  fill(255, 0, 0);
  textSize(36);
  textAlign(CENTER);
  text("Merry Christmas", 400, 200);
  noStroke();
  fill(0, 255, 0);
  triangle(550, 350, 650, 100, 750, 350);
  fill(126, 57, 8);
  quad(600, 350, 600, 400, 700, 400, 700, 350);
  fill(255, 255, 255);
  strokeWeight(2);
  stroke(255,255,255,25);
  line(0, 0, mouseX, mouseY);

  strokeWeight(5);
  stroke(random(255), random(255), random(255), 150);
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
  point(random(width), random(height));
}  

void mousePressed()
{

background(0,0,0);
} 

