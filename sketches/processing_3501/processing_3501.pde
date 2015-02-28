
Objeto S;
PImage fondo;    //Un fondo de imagen
int num;         //variable unica

void setup(){
fondo = loadImage("fondonoc.jpg");
    size(400,480);
    image(fondo,0,0);
  smooth();
  S = new Objeto();
}

void draw(){
  S.Luciernaga();
}




