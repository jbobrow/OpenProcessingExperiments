
void setup() {
size(500, 700);
smooth();
frameRate(5);
}

void draw() {

  size(500,700);
  noStroke();
  for (int y=0; y<700; y += 100){
    for(int x=0; x <500; x += 100){
      float R = random(240);
      float G = random(230);
      float B = random(240);
      fill(R,G,B);
      rect(x,y,100,100);
    }
  }
}

