
void setup() {
  size(300, 300);
  background(55);
  stroke(2);
}
float size1;
float size2;
float count = 500;

void draw() {
  size1 = random(width);
  size2 = random(width)/2;
  if (count>0) {
    fill(size1,size1/3,50,50);
    rect(size2, size1, 30, 30);
  }
}

