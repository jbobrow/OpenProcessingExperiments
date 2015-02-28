
/*
void draw() {
 i += 12;
 rect(i, 2, 10, 10);
 rect(i, i, 10, 10);
 rect(2, i, 10, 10);
 }*/
/*
for(int i = 2; i < 100; i += 12) {
 rect(i, 2, 10, 10);
 rect(i, i, 10, 10);
 rect(2, i, 10, 10);
 }*/

int i = 0;
int u = 0;

void setup() {
  size (960, 720);
}

void draw() {
  if (i <= width) {
    fill(random(255));
    rect(i, u, 100, 100);
    i += 20;
  } else {
    if (u <= height) {
      i = 0;
      u += 20;
    } else if (u >= height) {
      noLoop();
    }
  }
}
