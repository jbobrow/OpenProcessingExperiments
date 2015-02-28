

void setup() {
  size(600, 600);
  smooth();
  stroke(204);
  strokeWeight(2);
  noFill();
  for (int i=0; i<b.length; i++) {
    int xPos = (int)random(width/4) + width/2 - width/4;
    int yPos = (int)random(height/4) + height/2 - height/4;
    float xSpe = max(random(0.1), 0.01);
    float ySpe = xSpe;
    b[i] = new Bird(xPos, yPos, xSpe, ySpe);
  }
}

void draw() 
{
  background(0, 30);
  fill(3, 0, 4);
  ellipse(mouseX, mouseY, 20, 20);
  line(mouseX, mouseY, mouseX, mouseY+26);
  //line(mouseX, mouseY, mouseX+19, mouseY-19);
  //line(mouseX, mouseY, mouseX-19, mouseY-19);
  for (int i=0; i<b.length; i++) 
  {
    b[i].update();
    b[i].display();
  }
}


int numBirds = 400;
Bird[] b = new Bird[numBirds];

class Bird extends Chain 
{
  float angle = 1.0;
  float birdSize = 2;

  Bird(int ix, int iy, float ivx, float ivy) 
  {
    super(ix, iy, ivx, ivy);
  }

  void update() {
    super.update();
    float dx = mouseX - super.x;
    float dy = mouseY - super.y;
    angle = atan2(dy, dx);
  }

  void display() {
    stroke(random(500, 1000), random(50, 205), random(79, 80));
    pushMatrix();
    translate(x, y);
    rotate(angle+PI/2);
    scale(birdSize);
    ellipse(5, 5, 10, 10);
    //line(1, 0, 0, 3);
    //line(1, 0, 2, 3);
    popMatrix();
  }
}
void mouseReleased() 
{
  for (int i=0; i<b.length; i++) 
  {
    b[i].tx = random(width) + width - width;
    b[i].ty = random(height) + height - height;
  }
}
class Chain 
{

  float x, y;
  float vx, vy;
  float tx, ty;

  Chain(int xpos, int ypos, float spex, float spey) 
  {
    x = xpos;
    y = ypos;
    vx = spex;
    vy = spey;
    tx = xpos;
    ty = ypos;
  }

  void update() {
    tx += (mouseX - tx)*0.005+random(10)-5;
    ty += random(2)-1;

    x += (tx - x)*vx;
    y += (ty - y)*vy;

    if (mousePressed) 
    {
      fill(100, 0, 0);
      ellipse(mouseX, mouseY, 20, 20);
      line(mouseX, mouseY, mouseX, mouseY+26);
      line(mouseX, mouseY, mouseX+19, mouseY-19);
      line(mouseX, mouseY, mouseX-19, mouseY-19);
      tx = mouseX;
      float dx = tx - x;
      if (abs(dx) > 1) 
      {
        x += dx*vx;
      }
      ty = mouseY;
      float dy = ty - y;
      if (abs(dy) < 3) 
      {
        x += dx*vx;
      }
    }
  }
}


