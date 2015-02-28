
int x, y;
int direction;
int speed = 3;
int[]yPos = new int[3];

void setup() {
  size(400, 400);
  x = 0;
  direction = 1;
  yPos[0] = 100;
  yPos[1] = 200;
  yPos[2] = 300;
}

void draw() {
  background(0);
  smooth();
  x += speed * direction;
  for (int i=0;i < yPos.length;i++) {
  
    ellipse(x,yPos[i], 20 ,20);

    if (x > width || x < 0) {
      direction = -direction;
    }
  }
}


