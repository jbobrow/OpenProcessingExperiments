
/*
PROYECTO 01 SESION 3 : TECNICA skratch
 
 Título: cuaderno de lineas
 Nombre: iNÊSantiago
 Fecha:  23.05.209
 Lugar: IDEP - barcelona
 Objetivo: modificacion de un sketch mediante la técnica skratch

 La trigonometría nos sirve para oscilar entre varios valores. un seno o un coseno
 siempre oscilara entre valores decimales entre -1 y 1. Por ahora con esto nos basta para poder
 utilizarlo en el movimiento de la flor
 */

int posx,posy;


int distancia; //distancia entre cada linea

int conty1,contx1,contx2,conty2; // declaraçao de variaveis
color c = color(1,255,150); // cor das linhas

void setup()
{
  size(800,700);//ponemos el posx y el posy de la ventana
  frameRate(80); // velocidade do desenho
  strokeWeight(4);//deshabilita la posibilidad de poner borde
 smooth();
  iniciar();
}

void draw() // desenhar continuamente
{ 
  contx1 = contx1 - distancia;
  conty1 = conty1 - distancia;
  conty2 = conty2 + distancia;
  contx2 = contx2 + distancia;
  if (conty1 > width/5){
    iniciar();
  }
   //line(x1, y1, x2, y2)
  rect(contx1,posy,posx,conty1);
  rect(posx,conty1,contx2,posy);
  rect(posx,conty2,contx1,posy);
  rect(posx,conty2,contx2,posy);

}
void iniciar(){

   background(color(0));

  //stroke(c,random(20,30)); atribui um alpha entre 20 e 30% a cada linha
  stroke(c); // stroke sem alpha
  distancia=int(random(5,100));
  posy = height; //posiçao da estrela no centro y do ecra
  posx = width/2; // posiçao da estrela no centro x do ecra
  contx1 = posx*2;
  conty1 = 0;
  contx2 = posx;
  conty2 = posy; // 


}
void mousePressed() {

  noLoop();
}

void mouseReleased() {
  // background(0,0,0);//variaciion
  loop();
}
void keyPressed() {
    if (key == 'b' || key == 'B') { //ao teclar a tecla 'b' inicia a forma, começa do void draw
     iniciar();
    }

  }




