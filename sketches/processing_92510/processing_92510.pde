
PImage foto;
float x,y;
float speed;
void setup(){
  size(333,333);
  foto = loadImage("foto.png");
  x = width/2.0f;
  y = width/2.0f;
  speed = -2.0f;
}

void draw() {
  background(255);
  image(foto,x,y);
  if (y>width+106 || y < 0) speed*=-1;
  speed++;
  y-=speed;
}


