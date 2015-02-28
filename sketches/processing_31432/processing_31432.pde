
void setup() {
size(500, 700);
background(255);
smooth();
strokeCap(ROUND);

}

void draw() {
  size(500,700);
  stroke(2);
  float x1 = random(-100,600);
  float x3 = random(-100,600);
  float y1 = random(-100,900);
  float y3 = random(-100,900);
  float s1 = random(255);
  float s3 = random(6);
  int x2 = int(x1);
  int x4 = int(x3);
  int y2 = int(y1);
  int y4 = int(y3);
  int s2 = int(s1);
  int s4 = int(s3);
  stroke(s2);
  strokeWeight(s4);
  line(x2,x4,y2,y4);
    }

