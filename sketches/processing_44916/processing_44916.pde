
PGraphics pg;
int kernel[][];

float noiseValX = 0.02;
float noiseValY = 0.02;

void setup() {
  size(600, 600);
  pg     = createGraphics(600, 600, P2D); 
  kernel = new int[3][3];
}


void draw() {
  pg.beginDraw();
  pg.loadPixels();
  pg.fill(0);//, 20);
  pg.rect(0, 0, width, height);
  pg.updatePixels();
  pg.endDraw();
  for (int y = 0; y < pg.height; y++) {
    for (int x = 0; x < pg.width; x++) {
      int index = x + y*pg.width;
      float mg = mag(x - width/2, y - height/2);
      pg.pixels[index] = color(0, mg*noise(noiseValY)*2.1,  mg*1.5, 10);//color( , noise(noiseValY)*100);
      noiseValX += 0.03;
    }
    noiseValY += 0.02;
  }
  image(pg, 0, 0, width, height); 
}

