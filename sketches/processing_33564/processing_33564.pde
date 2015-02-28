
int value = 0;

void setup(){
  size(500,500);
}

void draw() {
  fill(value);
  rect(25, 25, 50, 50);
  rect(100, 100, 100, 100);
 
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

