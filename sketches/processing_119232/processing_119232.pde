
void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  background(255);
  fill(0);
  noStroke();
  
  translate(35, 40);
  
  rect(50, 60, 20, 80); 
  rect(50, 160, 20, 80);
  rect(50, 260, 20, 80);
  rect(50, 360, 20, 80);
  
  rect(115, 60, 20, 80);
  rect(180, 60, 20, 80);
  rect(245, 60, 20, 80);
  rect(310, 60, 20, 80);
  rect(375, 60, 20, 80);
  
  rect(115, 160, 20, 80);
  rect(245, 160, 20, 80);
  rect(310, 160, 20, 80);
  rect(375, 160, 20, 80);
  
  rect(115, 260, 20, 80);
  rect(180, 260, 20, 80);
  rect(245, 260, 20, 80);
  rect(310, 260, 20, 80);
  rect(375, 260, 20, 80);
  
  rect(115, 360, 20, 80);
  rect(180, 360, 20, 80);
  rect(245, 360, 20, 80);
  rect(310, 360, 20, 80);
  rect(375, 360, 20, 80);
  
  float winkel = map(mouseY, 0, 5000, 0, 1.5*PI);
  fill(45, 6, 150);
  noStroke();
  translate(180, 160);
  rotate(winkel);
  rectMode(CENTER);
  rect(0, 0, 20, 80);

}
