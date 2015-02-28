
import processing.pdf.*;

/*
PROYECTO 01 SESION 3 : TECNICA skratch
 
 Título: titulo del sketch
 Nombre: tu nombre
 Fecha:  fecha
 Lugar: lugar de creación
 Objetivo: modificacion de un sketch mediante la técnica skratch
 */
//
/*  Alba G. Corral  */

int posx,posy;


int distancia; //distancia entre cada linea

int conty1,contx1,contx2,conty2;
color c = color(250, 0, 0);

void setup()
{
  size(900,700);//ponemos el posx y el posy de la ventana
  frameRate(15);
  noStroke();//deshabilita la posibilidad de poner borde
  smooth();
  iniciar();
}

void draw()
{ 
  contx1 = contx1 - distancia/2;
  conty1 = conty1 + distancia;
  conty2 = conty2 - distancia;
  contx2 = contx2 + distancia*2;
  if (conty1 > height*4){
    iniciar();
  }
   //line(x1, y1, x2, y2)
  line(contx1,posy,posx,conty1);
  line(posx,conty1,contx2,posy);
  line(posx,conty2,contx1,posy);
  line(posx,conty2,contx2,posy);

}
void iniciar(){
   saveFrame("estrella-####.png");
   delay(4000);
   background(color(0,0,0));

  stroke(c,random(50,80));
  distancia=int(random(6,4));
  posy = height/2;
  posx = width/3;
  contx1 = posx;
  conty1 = 0;
  contx2 = posx/4;
  conty2 = posy*2;


}
void mousePressed() {

  noLoop();
}

void mouseReleased() {
  // background(0,0,0);//variaciion
  loop();
}
void keyPressed() {
    if (key == 'b' || key == 'B') {
     iniciar();
    }
     if (key == 's' || key == 'S') {
     saveFrame("estrella-####.png");
  }
}




