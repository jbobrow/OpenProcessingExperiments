
PImage bild;
void setup () {
  size (600,600);
  smooth ();
  bild = loadImage ("katzekatze1.png");
}
void draw () {
  background (random (255),random (255), random (255));
  float ps= mouseX + 128;
  for (int i = 0; i < width / ps + 1; i++) {
    for (int j = 0; j <height / ps + 1; j++) {
      image ( bild, i * ps, j * ps, ps,ps);
      }
    }
  }
  




