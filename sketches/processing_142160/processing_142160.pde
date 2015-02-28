
    float x = 100;
    float y =0;
    float speed = 1;
    
void draw();
{
    move();

void move() {
  y = y + speed;
  if (y > height) {
    y = 0;
  }
}

void display() {
  fill(c);
  rect(x,y,30,30);
}

