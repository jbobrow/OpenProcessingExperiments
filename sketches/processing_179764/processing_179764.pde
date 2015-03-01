
float num;

void setup() {
  size(640, 640);
  strokeJoin(ROUND);
}

void draw() {
  background(20);

  translate(width/2, height/2);
  for (int q = 20; q > 0; q-=2) {
    beginShape();
    for (int i = 0; i <= 360; i+=3) {
      float n = noise(q*i+num);
      float r = q*10 - n*map(q, 0, 15, 3, 30);
      
      strokeWeight(map(q, 0, 20, 2, 15));
      fill(map(q, 0, 20, 255, 50), map(q, 0, 20, 255, 50), 0);
      stroke(map(q, 0, 20, 235, 50), map(q, 0, 20, 235, 30), 0);
      
      float x = sin(radians(i)) * (r);
      float y = cos(radians(i)) * (r);
      vertex(x, y);
    }
    endShape();
  }
  num += 0.001;
}



