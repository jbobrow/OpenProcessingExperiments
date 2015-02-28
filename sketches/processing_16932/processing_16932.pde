

import processing.opengl.*;
import processing.video.*;
Capture video;
boolean pantalla;

String puntosOrden =
  "  ..  " +   "  ...  " + " ... " ;
  
char[] puntos;
float[] bright;
char[] chars;

PFont font;
float fontSize = 2.0;

 void setup() {
  size(640, 480, OPENGL);
  video = new Capture(this, 80, 60, 15);
  int count = video.width * video.height;

  font = loadFont("BSurfersPlane-48.vlw");
puntos = new char[256];
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, puntosOrden.length()));
    puntos[i] = puntosOrden.charAt(index);
  }
chars = new char[count];

bright = new float[count];
  for (int i = 0; i < count; i++) {

    bright[i] = 168;
  }
}
 void captureEvent(Capture c) {
  c.read();
}

void draw() {
  background(0);

pushMatrix();
float hgap = width / float(video.width);
  float vgap = height / float(video.height);

  scale(max(hgap, vgap) * fontSize);
  textFont(font, fontSize);

  int index = 0;
  for (int y = 1; y < video.height; y++) {
 translate(0,  1.0 / fontSize);
pushMatrix();
    for (int x = 0; x < video.width; x++) {
      int pixelColor = video.pixels[index];
  int r = (pixelColor >> 16) & 0xff;
      int g = (pixelColor >> 8) & 0xff;
      int b = pixelColor & 0xff;

  int pixelBright = max(r, g, b);
 float diff = pixelBright - bright[index];
 bright[index] += diff * 0.1;
 fill(pixelColor);
      int num = int(bright[index]);
      text(puntos[num], 0, 0);
index++;
 translate(1.0 / fontSize, 0);
    }
    popMatrix();
  }
  popMatrix();
  if (pantalla) {  
    set(0, height + video.height, video);
  }
}



