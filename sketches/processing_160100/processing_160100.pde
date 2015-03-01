


void setup() {
  size(400, 400);
  background(10,80,100);
}
void draw() {
float a = random(255);
float b = random(255);
float c = random(255);
stroke (a,b,c,100);
strokeWeight(4);
  line(random(width), 0,random(height) , height);
  if (mousePressed) {
  background(10,80,100);;
  }
}

