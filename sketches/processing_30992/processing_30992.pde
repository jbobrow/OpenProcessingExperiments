
void setup() {
size(500, 700);
smooth();
frameRate(5);
}

void draw() {
  noStroke();
  for (int y=0; y<700; y += 2){
    for(int x=0; x <500; x += 2){
      float R = random(255);
      fill(R);
      rect(x,y,2,2);
    }
  }
}

