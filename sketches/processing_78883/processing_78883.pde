
PImage foto;
int x;
int y;
void setup(){
  size(1000,1000);
  foto=loadImage("olga-kurylenko.jpg");
  image(foto,0,0);
  y=-foto.height;
  x=-foto.width;
}
void draw(){
  background(0);
  //x=(int)(width-foto.width)/2;
  image(foto,x,y);
  y++;
  x++;
}

