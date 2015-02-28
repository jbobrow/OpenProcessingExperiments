
void setup(){
  size(700, 200);
  background(15, 255, 205);
}

int value = 0;

void draw() {
  fill(value);
triangle(10, 10, 10, 200, 60, 150);
triangle(75, 10, 75, 200, 135, 120);
translate(200, 0);
triangle(10, 10, 10, 200, 60, 150);
triangle(75, 10, 75, 200, 135, 120);
translate(200, 0);
triangle(10, 10, 10, 200, 60, 150);
triangle(75, 10, 75, 200, 135, 120);

if (mousePressed == true) {
    fill(255, 240, 18);
  } else {
    fill(255);
  }
  rect(25, 25, 50, 50);
  translate(200, 0);
  rect(25, 25, 50, 50);}

void mouseDragged() 
{
  value = value - 5;
  if (value < 0) {
    value = 255;
  }
}


