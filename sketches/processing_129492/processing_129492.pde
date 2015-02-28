
float[] pos = new float[6];
float[] vel = new float[6];
float param=0;

void setup() {
  size(400, 400);
  background(0);
  for (int i=0;i<pos.length;i=i+1) {
    pos[i]=random(width);
    vel[i]=random(-1.5, 1.5);
  };
}

void draw() {

  for (int i=0;i<pos.length;i=i+2) {
//    ellipse(pos[i], pos[i+1], 5, 5);
  };
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
  stroke(255);
  fill(255*cos(PI/360 * param),255*sin(PI/360 * param),0);
  triangle(pos[0], pos[1], pos[2], pos[3], pos[4], pos[5]);
  param=param+1;
}

void mouseClicked() {
 background(0);
}


