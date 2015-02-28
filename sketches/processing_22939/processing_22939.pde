

int X = 50;
int Y =50;

void setup()
{
  size(450,450);
  background(255);
  for(int i = 0; i < width/X; i++) {
    for(int j = 0; j < height/Y; j++) {
      pushMatrix();
      translate(i*X, j*Y);
      shape1();
      popMatrix();
    }
  }
}

void shape1()
{
  noFill();
  strokeWeight(2);
  stroke(0,100);
  rect(25,25,75,75);
  rect(35,35,45,45);
  rect(50,50,65,65);
}

void draw()
{
  shape1();
  noLoop();
}


