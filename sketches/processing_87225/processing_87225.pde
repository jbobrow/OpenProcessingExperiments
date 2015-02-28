
PVector leftVanish;
PVector rightVanish;
final int SIZE = 100;
void setup() {
  size(500,500);
  background(255);
  
  leftVanish = new PVector(0, height / 2);
  rightVanish = new PVector(width, height / 2);
}

void draw() {
  background(255);
  PVector m = new PVector(mouseX, mouseY + SIZE / 2);
  PVector n = new PVector(mouseX, mouseY - SIZE / 2);
  PVector leftLine = PVector.sub(m, leftVanish);
  leftLine.normalize();
  leftLine.mult(SIZE);
  
  PVector rightLine = PVector.sub(m, rightVanish);
  rightLine.normalize();
  rightLine.mult(SIZE);
  

  
  PVector leftLine2 = PVector.sub(n, leftVanish);
  leftLine2.normalize();
  leftLine2.mult(SIZE);
  
  PVector rightLine2 = PVector.sub(n, rightVanish);
  rightLine2.normalize();
  rightLine2.mult(SIZE);

  line(m.x,m.y,m.x + leftLine.x,m.y - leftLine.y);
  line(m.x,m.y,m.x + rightLine.x,m.y - rightLine.y);  
  line(n.x,n.y,n.x + leftLine2.x,n.y - leftLine2.y);
  line(n.x,n.y,n.x + rightLine2.x,n.y - rightLine2.y);
  
  line(m.x,m.y,n.x,n.y);
  line(m.x + leftLine.x,m.y - leftLine.y,n.x + leftLine2.x,n.y - leftLine2.y);
  line(m.x + rightLine.x,m.y - rightLine.y, n.x + rightLine2.x,n.y - rightLine2.y);

  line(n.x + leftLine2.x,n.y - leftLine2.y,n.x + rightLine2.x,n.y - rightLine2.y);
  line(m.x + rightLine.x,m.y - rightLine.y, m.x + leftLine.x,m.y - leftLine.y);  
}
