
int posX;
int posY;

float r;
float g;
float b;

int size;

void setup() {
  size(400, 400);
  posX=width/2;
  posY=height/2;
  r=0;
  g=0;
  b=0;
  size=5;
}

void draw() {
  background(255);
  fill(r, g, b);

  rectMode(CENTER);

  noStroke();

  rect(posX, posY, size*4, size);
  rect(posX, posY, size, size*4);

  for (float i = 0; i < 10; i++) {
    for (float j = 0; j < 10; j++) {
      float x=random(0, 400);
      float y=random(0, 400);

      rect(x, y, size*4, size);
      rect(x, y, size, size*4);
    }
  }
}

    void keyPressed() {

      if (keyCode==UP ) {
        posY -= 6;
        r+=15;
      }
      if (keyCode==DOWN) {
        posY += 6;
        b+=15;
      }
      if (keyCode==LEFT) {
        posX -= 6;
        size-=5;
      }
      if (keyCode==RIGHT) {
        posX += 6;
        size+=5;
      }
    }



