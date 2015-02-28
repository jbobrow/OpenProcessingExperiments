
void setup() {
size(500, 700);
smooth();
frameRate(5);
}

void draw() {
  background(#eeeeee);
  float y1 = random(100);
  float y2 = random(50,60);
  float x1 = random(100);
  float x2 = random(50,60);
  for (int y= int(y1); y<700; y += int(y2)){
    for(int x= int(x1); x <500; x += int(x2)){
      strokeWeight(5);
      stroke(20);
      point(x,y);
    }
  }
}

