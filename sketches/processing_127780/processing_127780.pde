

//particle
PShader sd;
int pointNum = 100;
float[] xx = new float[pointNum];
float[] yy = new float[pointNum];
float[] speeds = new float[pointNum];
float[] sizes = new float[pointNum];
float repeatMargin = 50;

void setup() {
  size(600, 600, P3D);

  sd = loadShader("shader.glsl");

  for (int i=0;i<pointNum;i++) {
    xx[i] = random(width);
    yy[i] = random(height);
    speeds[i] = random(2, 10);
    sizes[i] = random(100, 1000);
  }
}

void draw() {
  //background(0);

  //particles  
  for (int i=0;i<pointNum;i++) {
    xx[i] += 0;
    yy[i] = yy[i]>width+repeatMargin ? -repeatMargin : yy[i] + speeds[i];
  }
  sd.set("xx", xx);
  sd.set("yy", yy);
  sd.set("sizes", sizes);
  shader(sd);

  rect(0, 0, width, height);
}



