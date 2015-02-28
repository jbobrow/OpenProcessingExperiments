
PImage foto;
int posx;
int posy;
void setup(){
  size(400,400);
  foto=loadImage("Lena.jpg");
  posx=-400;
  posy=-400;
}
void draw(){
  background(255);
  image(foto,posx,posy);
  posx++;
  posy++;
  if(posx==0 && posy==0){
    noLoop();
  }
}
