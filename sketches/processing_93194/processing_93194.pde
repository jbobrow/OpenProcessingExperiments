
void setup ()
{
  size(400,400);
  
  fill(255, 5);
  background(255);
}
 
void drawShape(float x, float y, float r, int numberOfVertices)
{
  numberOfVertices = int(numberOfVertices);
  pushMatrix();
  translate(x,y);
  float angle = 2*PI/numberOfVertices;
  beginShape();
  for(int i = 0; i <= numberOfVertices; i++)
  {
     
    float vx = r * cos(angle * i) * noise(i == numberOfVertices? 0 : i * 0.1, frameCount * 0.01);
    float vy = r * sin(angle * i) * noise(i == numberOfVertices? 0 : i * 0.1, frameCount * 0.01);
    vertex(vx ,vy);
  }
  endShape();
   
  popMatrix();
}
 
void draw()
{
}


void mouseDragged() {
  drawShape(mouseX, mouseY, dist(pmouseX, pmouseY, mouseX, mouseY), int(random(3, 50)));
}

void keyPressed() {
  background(255);
}
