
float lightmap[][], b;
ArrayList<LightSource> ls = new ArrayList<LightSource>();
final int scale = 10; // should be between 1 and 10

void setup() {
  size(800, 600);
  noStroke();
  noSmooth();
  //frameRate(1000);
  lightmap = new float[width / scale][height / scale]; // the shadow
  for (int i = 0; i < 11; i++) // add lights
    ls.add(new LightSource(100, 100, 100 / scale));
  ls.get(5).pos.x = 10;
  ls.get(5).pos.y = 10;
  ls.get(6).pos.x = 10;
  ls.get(6).pos.y = height / scale / 2;
  ls.get(7).pos.x = 10;
  ls.get(7).pos.y = height / scale - 10;
  ls.get(8).pos.x = width / scale - 10;
  ls.get(8).pos.y = 10;
  ls.get(9).pos.x = width / scale - 10;
  ls.get(9).pos.y = height / scale / 2;
  ls.get(10).pos.x = width / scale - 10;
  ls.get(10).pos.y = height / scale - 10;
}

void draw() {
  background(0, 100, 0);
  
  updatelightmap();
  drawlightmap();
  
  ls.get(0).pos.x = mouseX / scale;
  ls.get(0).pos.y = mouseY / scale;
  for (int i = 1; i < 5; i++) { // rotate
    ls.get(i).pos.x = int(sin((millis() + 1500 * i) * 0.001) * 100 / scale + width / scale / 2);
    ls.get(i).pos.y = int(cos((millis() + 1500 * i) * 0.001) * 100 / scale + height / scale / 2);
  }
  fill(128);
  text(round(frameRate), 0, 10);
}

class LightSource {
  PVector pos;
  int rad;

  LightSource(float x, float y, int r) {
    pos = new PVector(x, y);
    rad = r;
  }

  int getLight(int x, int y) {
    float d = sqrt(sq(pos.x - x) + sq(pos.y - y)); // get the distance
    if (d > rad) // if out of range = black
      return 0;
    else
      return int(map(d, 0, rad, 255, 0));
  }
}

void updatelightmap() {
  b = 0;
  for (int y = 0; y < height / scale; y++) {
    for (int x = 0; x < width / scale; x++) {
        lightmap[x][y] = 0;
      for (int i = 0; i < ls.size(); i++) {
        b = ls.get(i).getLight(x, y); // get the distance = brightness
        //if (b > brightness)
        //  brightness = b;
        lightmap[x][y] += b;
        if (lightmap[x][y] >= 255) {
          lightmap[x][y] = 255;
          continue;
        }
      }
    }
  }
}

void drawlightmap() {
  for (int y = 0; y < height / scale; y++) {
    for (int x = 0; x < width / scale; x++) {
      fill(0, 255 - lightmap[x][y]);
      rect(x * scale, y * scale, scale, scale);
    }
  }
}
