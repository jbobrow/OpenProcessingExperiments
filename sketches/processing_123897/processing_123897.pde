
void setup() {
  size(200,200);
}

void draw() {
  //background(0)
  stroke(random(200,256),random(200,256),random(5,100));
  float distance_left = random(200);
  line(distance_left,0, distance_left,199);
}


