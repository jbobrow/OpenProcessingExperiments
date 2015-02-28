
PImage foto;
int num = 8;
int x,y;
color c;
color[] w = {#FF9C00,#FAB409,#F6CA11,#F2DD19,#EEEE20,#C4EA28,#9EE52E,#7DE135,#5FDD3C,#46D942,#48D577,#46D942,#5FDD3C,#7DE135,#9EE52E,#C4EA28,#EEEE20,#F2DD19,#F6CA11,#FAB409};
int cont = 0;

void setup() {
  foto = loadImage("casablanca.jpg");
  size(488,360);
  background(foto);
}

void draw() {
  cont++;
  if (cont >= 3*w.length) {
    cont = 0;
  }
  set(0,0,foto);
  loadPixels();
  c = get(mouseX,mouseY);
  for (int i = 0; i < width*height-1; i++) {
    if (pixels[i] == c) {
      pixels[i] = w[int(cont/3)];
    }
  }
  updatePixels();
}

