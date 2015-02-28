
//Alumno: Vargas Nolasco Santiago

PImage foto;
int posx;
int posy;

void setup() {
  size(400, 400);
  foto=loadImage("exec.jpg");
  posx=0;
  posy=0;
}

void draw() {

  background(0);
  image(foto,posx,posy);
  posx++;
  posy++;
  
  if(posx==400 || posy==248){
  noLoop();
}
}


