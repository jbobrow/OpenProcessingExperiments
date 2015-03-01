
PImage foto;
void setup(){
foto= loadImage("chica.jpg");
size(foto.width,foto.height);
}
void draw(){
  image(foto,0,0,mouseX,mouseY);
}



