
PImage mat;
ArrayList logos= new ArrayList();
 
void setup() {
  size(400, 500);
  frameRate(30);  
  mat=loadImage("hs.jpg");
}
 
void draw() {
  background(255);
  for (int i = 0; i < logos.size(); i++) { 
    logo p = (logo) logos.get(i); 
    p.dibujar();
  }
}
 
void mousePressed() {
  logos.add(new logo(mat, mouseX, mouseY));
}

class logo {
 
  PImage img;
  int ancho, alto, x, y;
 
  logo(PImage i, int Px, int Py) {
    int f=int(random(1, 5));
    img=i;
    ancho=60*f;
    alto=60*f;
    x=Px;
    y=Py;
  }
 
  void dibujar() {
    image(img, x-ancho/2, y-alto/2, ancho, alto);
  }
}


