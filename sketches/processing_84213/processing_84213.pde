
float r=0;
void setup()
{
  size(600, 400);
  background(150);
}

void draw()  {
  //rect(0, 0, 10, 10);
 // if(mousePressed){
    poly(mouseX, mouseY, 0, 60, 60, r);
    r += 0.1;
    fill(150, 25);
    rect(0, 0, 600, 400);
  //}
  //rect(0, 0, 5, 5);
  
}

void poly(int x, int y, int p1, int p2, int p3, float r)  {
  pushMatrix();
  translate(x, y);
  rotate(r*PI);
  beginShape();
  fill(255);
  vertex(0, 0);
  vertex(p1, p2);
  vertex(p3, p3);
  endShape(CLOSE);
 
  popMatrix();  //resets translate
}
