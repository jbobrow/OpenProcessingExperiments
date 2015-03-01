
PImage tomates, escena;
 
int tomate = 40;

//arrays de pos y velocidades
float []posx = new float [tomate];
float []posy = new float [tomate];
float []velx = new float [tomate];
float []vely = new float [tomate];
 
void setup() {
  
  size (800, 600);
  escena= loadImage("teatro.jpg");
  tomates = loadImage ("tomate.png");
  frameRate(30);
 //inicio de posiciones y velocidades
  for (int i=0; i<tomate; i ++) {
    posx[i]=width/2;
    posy[i]=height/2;
    velx[i] = random (1, 5);
    vely[i] = random (1, 5);
  }
}
 
void draw () {
  image(escena, 0, 0,width, height);
 
 //bucle para que realice la accion para todos los elementos del array
  for (int i=0; i<tomate; i++) {
    //actualizamos posiciones
    posx[i] += velx[i];
    posy[i] += vely[i];
 //comprobamos los bordes X
    if (posx[i] <0 || posx[i] >width) {
      velx[i] = -velx[i];
    }
    //comprobamos los bordes Y
    if ((posy[i] <0) || (posy[i] >height)) {
      vely [i] = -vely [i];
    }
  }
 //otro bucle donde dibujamos las imagenes
  for (int i=0; i<tomate; i++) {
    image (tomates, posx[i], posy[i],tomates.width*0.3,tomates.height*0.3);
  }
}



