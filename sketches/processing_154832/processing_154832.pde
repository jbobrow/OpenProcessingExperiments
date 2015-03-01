
int radius;
int rotX, rotZ, rotStepX, rotStepZ;
float threshold; //  Threshold of
float step;
float noiseScale;

void setup() {
  size(500, 500, P3D);
  colorMode(HSB, 1.0, 1.0, 1.0);
  smooth();
  noLoop();    // Comment this off for rotation animation
  radius = 125;
  rotX = 0;    // initial rotational orientation on X-axis
  rotZ = 0;    // initial rotational orientation on Z-axis
  rotStepX = TWO_PI/72; // Rotation increment on X-axis
  rotStepZ = TWO_PI/66; // Rotation increment on Z-axis
  threshold = 0.001;
  step = .10;
  noiseScale = 0.015;
}

void draw() {
  background(0);
  //lights();
  //directionalLight(64, 255, 255, .2, .2, 0);
  translate(width/2, height/2, radius);
  rotateX(HALF_PI*rotX/20);
  rotateZ(HALF_PI*rotZ/36);
  float x, y, z;
  x = 0;
  while (x <= radius * 2) {
    y=0;
    while (y <= radius * 2) {
      z=0;
      while (z <= radius * 2) {
        float toCenter = dist(x - radius,y - radius,z - radius,0,0,0);
        if (toCenter < radius) {
          float nois = noise(x * noiseScale, y * noiseScale, z * noiseScale);
          float distance;
          distance = map(z, 0, radius*2, 0, 1.0);  // "distance" from camera
          toCenter /= (float) radius;
          if (nois > .5-threshold && nois <.5 + threshold) {
            stroke(toCenter, nois*distance, distance);
            point(x - radius, y - radius, z - radius);
          }
        }
        z += step;
      }
      y += step;
    }
    x += step;
  }
  rotX += rotStepX;
  rotZ += rotStepZ;;
  rotX = rotX % TWO_PI;
  rotZ = rotZ % TWO_PI;
  /*
  String fileName;
  fileName = new String();
  if (frameCount < 10) fileName = "cloud_00";
  else if (frameCount < 100) fileName = "cloud_0";
  else noLoop();
  saveFrame(fileName + frameCount+".jpg");*/
}
