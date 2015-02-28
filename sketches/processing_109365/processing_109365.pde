
int swidth, sheight; 
int offset;
float rotation; 
int min, max; 

void setup() {
  size(540, 840);
  background(190);
  swidth = sheight = 30; 
  offset = 90;
  rotation = radians(1);
  min = -1; 
  max = 1;
  noLoop();
}

void draw() {
  noFill();
  for (int row = 0; row < 22;row++) {
    for (int col = 0; col< 12;col++) { 
      pushMatrix();
      translate(col*swidth + offset, row*sheight+offset);
      rotate(rotation);
      rect(0, 0, swidth, sheight);
      popMatrix();
      rotation=radians(random(min, max));
    }
    min -= 3; 
    max += 3;
  }
}
