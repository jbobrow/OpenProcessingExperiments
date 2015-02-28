
// acd 20091118
// Mona

public static final float SCALEX = 1.25;
public static final float SCALEY = 1.25;
public static final float SCALEZ = .125;
public static final float RAD = 100;

PImage img;
float[][] brights;
int[][] colors;
float angle = 0;

void setup() {
  size(600, 600, P3D);
  img = loadImage("mona_lisa.png");
  brights = new float[img.width][img.height];
  colors = new int[img.width][img.height];
  // load height and colour from image
  for (int y = 1 ; y < img.height ; y++) {
    for (int x = 1 ; x < img.width ; x++) {
      colors[x][y] = img.get(x, y);
      brights[x][y] = brightness(colors[x][y]);
    }
  }
}

void draw() {
  background(0);
  camera(SCALEX * img.width / 2 + RAD * cos(angle), SCALEY * img.height / 2 + RAD * -sin(angle), 225, 
    SCALEX * img.width / 2, SCALEY * img.height / 2, 0, 
    0, 1, 0);
  angle += .1;

  // draw grid  
  for (int y = 1 ; y < img.height ; y++) {
    for (int x = 1 ; x < img.width ; x++) {
      stroke(colors[x][y]);
      // draw vertical line
      line(SCALEX * (x - 1), SCALEY * y, SCALEZ * brights[x - 1][y], SCALEX * x, SCALEY * y, SCALEZ * brights[x][y]);
      // draw horizontal line
      line(SCALEX * x, SCALEY * (y - 1), SCALEZ * brights[x][y - 1], SCALEX * x, SCALEY * y, SCALEZ * brights[x][y]);
    }
  }
}

void keyPressed() {
  saveFrame("mona_####.png");
}


