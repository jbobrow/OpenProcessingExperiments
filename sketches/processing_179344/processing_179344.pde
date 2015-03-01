
void setup() {
  size(640, 640);
  strokeWeight(15);
  strokeJoin(ROUND);
}

void draw() {
  background(40);
  for(int i = 0; i <= 10; i++){
    float y = i*30;
    fill(0, map(i, 0, 5, 140, 20), map(i, 0, 5, 245, 140));
    stroke(0, map(i, 0, 5, 150, 20), map(i, 0, 5, 255, 150));
    beginShape();
    vertex(0, 200+y);
    for(int q = 0; q <= width; q+=10){
      float y2 = 200+y-abs(sin(radians(q)+i))*cos(radians(i+q/2))*map(i, 0, 5, 100, 20);
      vertex(q, y2);
    }
    vertex(width, height);
    vertex(0, height);
    endShape(CLOSE);
  }
}



