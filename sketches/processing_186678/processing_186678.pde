
PImage foto;
PImage fotoPapa;
PImage fondo;
float px=1000;
float py=300;
float ppx=1200;
float ppy=300;
void setup() {
  size(1000, 600);
  foto = loadImage("nemo.png");
  fotoPapa = loadImage("marlin.png");
  fondo= loadImage("fondo.jpg");
}
void draw() {
  image(fondo, 0, 0);
  py = 50*sin(px*0.02);
  ppy = 40*sin(px*0.015);
  px--;
  ppx--;

  image(foto, px, 300+py, 90, 60);
  image(fotoPapa, ppx, 300+ppy, 140, 100);
}



