
int x;
int y;
int s;

void setup() {
  size (400, 400);
}
 
 
void draw(){
  for (int x=0; x<50; x+=30) {
    for (int y=0 ; y<height; y+=20) {
      stroke(random(255), random(255), random(255));
      strokeWeight(random(10));
      noFill();
      s=int(random(200));
      rect(random(width), random(height), s+40, s+40);
      rect(random(width), random(height), s+20, s+20);
      rect(random(width), random(height), s, s);

    }
  }
}
