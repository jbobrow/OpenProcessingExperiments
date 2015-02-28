

// Armando Rocha

PImage foto;
int posx;
int posy;
void setup(){
size(400,400);
foto=loadImage("Lena.jpg");
posy=-400;
posx=-400;
}
void draw(){
  background(0);
image(foto,posx,posy); // desplegar imagen
posy++;
posx++;
if(posx==0 && posy==0){
  noLoop();
}
}

