
PImage foto;
PImage foto1;
PImage foto2;
void setup (){
  size(800,800);
  foto = loadImage("IMGP3785.JPG");
  foto1 = loadImage("IMGP3850.JPG");
  foto2 = loadImage("IMGP2396.JPG");
}
void draw(){
 // tint para colorear//
 tint(245,67,248,178);
  image(foto,mouseX,mouseY,800,700);//SI CAMBIO POR mouseX hay movimiento//
  image(foto1,400,0,mouseX,700);
  image(foto2,400,0,400,mouseX);
  
}

