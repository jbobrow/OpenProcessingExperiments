
void setup() {
  size(640, 640);
  noFill();
}

void draw() {
  background(20);
  translate(width/2, height/2);
  /* Adjust for loops as they need adjusting for perforce on the web */
  for (int i = 0; i < 360; i+=72) {
    float x = sin(radians(i)) * 100;
    float y = cos(radians(i)) * 100;
    float angle = abs(sin(radians(frameCount))*180);
    stroke(255);
    strokeWeight(2);
    arc(x, y, 150, 150, -radians(i), radians(angle-i));
    arc(-x, -y, 150, 150, -radians(i), radians(angle-i));
    for (int q = 2; q < 10; q+=2) {
      strokeWeight(q);
      stroke(0, 150, 255, 25);
      arc(x, y, 150, 150, -radians(i), radians(angle-i));
      arc(-x, -y, 150, 150, -radians(i), radians(angle-i));
    }
  }
}



