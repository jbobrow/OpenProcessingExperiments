
float t;
float mid = 150;
float r;

void setup() {
  size(300, 300);
  noStroke();
  frameRate(12);
  ellipseMode(CENTER);
}

void draw() {
  
  int rand = (int)random(5, 40);
  noStroke();
  for(int i = 0; i < 150; i += rand) {
    fill(200 + i, 50, 50);
    rect(i, i, width - 2 * i, height - 2 * i);
  }
  
  t += 0.2; 
  for(int i = 0; i < 2; i++) {
    fill(200, 40, 40, 130 - i * 2);
    ellipse(150, 
    150,
    20 + 150 * abs(sin(t) - i), 
    20 + 150 * abs(sin(t) - i));
  }
  
  noStroke();
  fill(255, random(50));
  r = random(width);
  float x = random(width) - 150;
  float y = random(width) - 150;
  ellipse(mid + x - 0, mid + y - 0, r, r);
  ellipse(mid - x - 0, mid - y - 0, r, r);
  ellipse(mid + x - 0, mid - y - 0, r, r);
  ellipse(mid - x - 0, mid + y - 0, r, r);
  
}





