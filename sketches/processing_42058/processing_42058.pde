
void setup(){
  size(600, 450);
  smooth();
  background(20, 0, 0);
}

void draw(){
  for (int i = 0; i < 600; i += 10) {
    stroke(209, 210, 211);
    strokeWeight(2);
    line(i, 0, i + 600, 450);
    stroke(10, 76, 129);
    strokeWeight(2);
    line(i, 0, i + 450, 600);
    stroke(127, 255, 121);
    strokeWeight(2);
    line(i, 0, i + 250, 600);
    stroke(255, 36, 36);
    strokeWeight(2);
    line(i, 0, i + 100, 600);
  };
}


