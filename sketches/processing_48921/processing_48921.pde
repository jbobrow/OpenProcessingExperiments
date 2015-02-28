
void setup()
{
  size(400, 600);
  background(15, 245, 147);
  smooth();
  textAlign(CENTER);
  frameRate(12);
  strokeWeight(5);
  noStroke();
  
  
}

void draw()
{
  fill(0, 0, 10, 100);
  rect(0, 0, width, height);
  
  
  fill( 242, 204, 7);
  ellipse(mouseX, mouseY, 10,10);

  
}

void mousePressed()
{
  
fill( random(255), random(255), random(255));

}

void keyPressed()
  {
    save ("snapshot.jpg");
  }
  

