
float vx, vy, vz;
float r, alpha, d, moon_d;

void setup() {
  size(400, 400);
  colorMode(RGB);
  background(0);
  moon_d = 130;
}

void draw() {
  background(0);
  for (int x = 0 ;x<width;x++) {
    for (int y = 0 ;y<height;y++) {
      d =dist(x, y, width/2, height/2);
      vx+=0.015;
      if (d<=moon_d) {
        if (d<=moon_d-50) {
          alpha = 255;
        }
        else if (d<moon_d-50 && d<moon_d-8) {
          alpha = map( d, moon_d-50, moon_d-5, 255, 100);
        }
        else alpha = map( d, moon_d-5, moon_d, 100, 0);
        r=lerp(0, 60, noise(vx, vy, vz));
        stroke(160+r, 140+r, 100+r, alpha);
        point(x, y);
      }
    }
    vx = 0;
    vy += 0.015;
    vz+= 0.015;
  }
}



