
import peasy.*;
PeasyCam cam;

color[] colors;
float[][] points;

void setup() {
  size(720, 480, P3D);
  
  cam = new PeasyCam(this, 512);
  cam.rotateX(-PI / 3);
  
  String[] input = loadStrings("weekend.ply");
  int f = 0;
  while(!input[f++].equals("end_header"));
  int n = input.length - f;
  colors = new color[n];
  points = new float[n][3];
  String[] cur;
  for(int i = 0; i < n; i++) {
    cur = split(input[f++], ' ');
    points[i] = new float[]{float(cur[0]), float(cur[1]), float(cur[2])};
    colors[i] = color(int(cur[3]), int(cur[4]), int(cur[5]));
  }
  
  float[] offset = {3.5, -2, 0};
  float scaleFactor = 40;
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < 3; j++) {
      points[i][j] += offset[j];
      points[i][j] *= scaleFactor;
    }
  }
}

void draw() {
  background(0, 0, 0);
  strokeWeight(2);
  for(int i = 0; i < points.length; i++) {
    stroke(colors[i]);
    point(points[i][0], points[i][1], points[i][2]);
  }
}

