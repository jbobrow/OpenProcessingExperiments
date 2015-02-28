
void setup() {
  size(600, 600);
  background(0);
}
int i = 500;
int j = 500;
int counter = 20;
int counter2 = 20;
int x = 600;
int y = 600;

float radStart = 90.0;
float radEnd = 180.0;

void draw() {
  for (;counter2>0;counter2--) {

    for (;counter>0; counter--) {
      fill(random(255));
      stroke(random(255),random(255),random(255));
      arc(x, y, i, j, radians(radStart), radians(radEnd));
      print("counter:" + counter+" ");
      j-=20;
      i-=20;
    }
    radStart += 90;
    radEnd += 90;
    counter = 20;
    x = x-30;
    y = y-30;
    i = 300;
    j = 300;
  }
}



