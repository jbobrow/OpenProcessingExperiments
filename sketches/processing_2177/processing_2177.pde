
/*
PROYECTO 01 SESION 3 : TECNICA skratch
 
 Título: Forma rara a mitad
 Nombre: Andrea Farina
 Fecha:  25/05/09
 Lugar: Idep
 Objetivo: modificacion de un sketch mediante la técnica skratch
 */
//

int posx,posy;


int distancia; //distancia entre cada linea

int conty1,contx1,contx2,conty2;
color c = color(#369999);

void setup()
{
  size(500,700);//ponemos el posx y el posy de la ventana
  frameRate(10);
  noStroke();//deshabilita la posibilidad de poner borde
  smooth();
  iniciar();
}

void draw()
{ 

translate(300,0); 
rotate(PI/3.8);  
 


  contx1 = contx1 - distancia/2;
  conty1 = conty1 + distancia;
  conty2 = conty2 - distancia;
  contx2 = contx2 + distancia/2;


  
  if (conty1 > height/2){
    
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
  // delay(2000);
   background(color(0,148,50));

  stroke(c,random (30,100));
  distancia=int(random(10,50));
  posy = height/2;
  posx = width/2;
  contx1 = posx/2;
  conty1 = 0;
  contx2 = posx;
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



