
/* @pjs preload="image0.png"; 
 */

float[] pos = new float[8];
float[] vel = new float[8];
float param=0;
PImage img;

void setup() {
  size(400, 400);
  background(0);
  for (int i=0;i<pos.length;i=i+1) {
    pos[i]=random(width);
    vel[i]=random(-1.5, 1.5);
  };
  frameRate(60);
    img = loadImage("image0.png");


}

void draw() {
  for (int i=0;i<pos.length;i=i+1) {
    pos[i]=pos[i]+vel[i];
  };
  for (int i=0;i<pos.length;i=i+2) {
    if (pos[i]>width||pos[i]<0) {
      vel[i]=-vel[i];
    };
    if (pos[i+1]>height||pos[i+1]<0) {
      vel[i+1]=-vel[i+1];
    };
  };
  stroke(125);
  fill(125);
  tint(140, 100, 80);
  image(img, pos[0], pos[1], 120, 120);
      tint(0, 200, 0);
  image(img, pos[2], pos[3], 120, 120);
    image(img, pos[6], pos[7], 120, 120);
      tint(90, 10, 130);
  image(img, pos[4], pos[5], 120, 120);
        tint(90, 10, 130);

  param=param+1;
  if (param>1500){
    background(0);
    param=0;
  }
}

void mouseClicked() {
  background(0);
}


