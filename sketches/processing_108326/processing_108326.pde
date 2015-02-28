
int screenwidth = 360;
int screenheight = 480;
int hori = 55;
int vert = 30; 

void setup() {
  size(screenwidth, screenheight);
  background(220);
  noFill();
  noLoop();
}

void draw() {
  for (int row = 0; row < 20; row++) {
    for (int col = 0; col < 12; col++) {
      translate(hori+(col*20), vert+(row*20)); 

      float rand1 = random(-(row*4+(col/2)),row*4+(col/2));
      rotate(radians(rand1)); 
      rect(0, 0, 20, 20);
      rotate(-radians(rand1)); 

      translate(-hori-(col*20), -vert-(row*20));
    }
  }
}



