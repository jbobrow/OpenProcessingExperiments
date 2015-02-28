
void setup() {
  size(200,200);
}

void draw() {
  for(int y=10; y<=200; y=y+10) {
    for(int x=10; x<=200; x=x+10) {
      stroke(random(255),random(255),random(255));
      float r=random(50);
     rect(random(x),random(y),random(50),50);
      }
    }
  }
