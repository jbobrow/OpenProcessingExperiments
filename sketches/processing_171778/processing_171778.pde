
float b= 0;

void setup() {
  size(700, 400);
  background(255);
  fill(255, 15);
  noSmooth();
}




void draw() {
  background(0);

  translate(width/3.5, height/3.5);
  for (int x = -100; x <= 100; x+=10) {
    for (int y = -100; y <= 100; y+=10) {
      float d = dist(x, y, 0, 0);
      float d2 = sin(radians(d))*d;
      fill(0, 150, 255);
      pushMatrix();
      translate(x, y);
      rotate(radians(d + frameCount));
      ellipse(x, y, 5, 5);
      popMatrix();
    }
  }

  rect(0, 0, width, height);

  stroke(0); 
  for (int x = 0; x < width; x += 8) {
    for (int y = 0; y < height; y += 8) {
      float a = 4 * noise(x / 300.0, y / 300.0) * TWO_PI + b;
      point(x + 100 * cos(a), y + 100 * sin(a));
    }
  }
  if (!mousePressed) {
    ellipse(random(900), random(400), 60, 80);
    fill(36, 182, 255);

    rect(random(900), random(400), 90, 100);
    //fill(0);


    b += 0.01;
  } else {
    background(random(255), random(255), random(255));
  }
}
void mousePressed() {
}

void keyPressed() {
  background(random(255), random(255), random(255));
}

