
float amount = 20, num;

void setup() {
  size(640, 640);
  stroke(0, 150, 255, 100);
}

void draw() {
  fill(0, 40);
  rect(-1, -1, width+1, height+1);

  float maxX = map(mouseX, 0, width, 1, 250);

  translate(width/2, height/2);
  for (int i = 0; i < 360; i+=amount) {
    float x = sin(radians(i+num)) * maxX;
    float y = cos(radians(i+num)) * maxX;

    float x2 = sin(radians(i+amount-num)) * maxX;
    float y2 = cos(radians(i+amount-num)) * maxX;
    noFill();
    bezier(x, y, x-x2, y-y2, x2-x, y2-y, x2, y2);
    bezier(x, y, x+x2, y+y2, x2+x, y2+y, x2, y2);
    fill(0, 150, 255);
    ellipse(x, y, 5, 5);
    ellipse(x2, y2, 5, 5);
  }

  num += 0.5;
}



