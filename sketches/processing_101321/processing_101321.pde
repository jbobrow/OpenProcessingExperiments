
float r=0;

void setup() {
  size(400,400);
  background(12);
  smooth();
  noStroke();
}

void draw() {
    fill(random(100,255),70);
    rotate(r);
    rotate(l);
    float circle_size = random(50,50);
    ellipse(100+r, 300, circle_size, circle_size);
    r += 0.5;
    if (r > 200) {
      noLoop();
    }
    
}

