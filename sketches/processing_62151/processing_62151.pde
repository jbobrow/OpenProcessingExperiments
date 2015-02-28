
PImage foto, foto1, foto2 ;  

void setup() {  
  size(1024, 768);  
  foto = loadImage("schloss.jpg");  
  foto1 = loadImage("1.png");
}

void draw () {
  tint(255, 255);
  background(foto);  
  image(foto1, 0, 100);
}


void mousePressed() {
  foto1 = loadImage("2.png");
}
void mouseReleased() {
  foto1 = loadImage("1.png");
}


