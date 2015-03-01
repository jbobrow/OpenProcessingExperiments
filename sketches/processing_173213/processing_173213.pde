
int sects;
float rotSpd;
int a;

void setup() {
  size(400, 400);
}

void draw() {
  rotSpd = map(mouseX, 0, width, -6, 6);
  sects = floor(map(mouseY, 0, height, 3, 8));
  
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < sects; i++) {
    arc(0, 0, width/2, height/2, radians(a), radians(180/sects + a));
    rotate(radians(360/sects));
  }
  a += rotSpd;
}
