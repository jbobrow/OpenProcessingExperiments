
/* Autor: Sergi Garcia Calero - 1o ASIX C.E.Roca - 20/10/2013

Processing1: Primer ejercicio de processing para clase de PB.
-Objetivo: Dibujar una cara con un sentimiento visible.
-Precondicion: Sólo se pueden usar las instrucciones vistas
en clase, asi como las "2D Primitives" de Processing.org

*/


void setup(){
  size(800, 600); //Tamaño del "Lienzo"
  background(230, 230, 230); //Fondo
}

void draw(){
  //Orejas
  fill(#DF8000);
  triangle(237, 239, 308, 161, 244, 100); 
  triangle(540,97,485,162,565,256); 
  fill(#FFFFFF);
  //Base
  fill(#FFA000);
  ellipse (400, 300, 350, 330);
  fill(#FFFFFF);
  //Puntero para edición
  println(mouseX + ", " + mouseY);
  //Cejas_D
  noFill();
  arc(519, 236, 40, 40, PI, PI+QUARTER_PI*1.1);
  arc(501, 230, 40, 40, PI, PI+QUARTER_PI*1.1);
  arc(480, 229, 30, 30, PI, PI+QUARTER_PI*1.2);
  arc(456, 233, 15, 30, PI, PI+QUARTER_PI*1.3);
  //Cejas_I
  arc(323, 236, 40, 43, PI, PI+QUARTER_PI*1.1);
  arc(340, 231, 30, 33, PI, PI+QUARTER_PI*1.2);
  arc(355, 234, 15, 33, PI, PI+QUARTER_PI*1.3);
  //Ojos
  arc(472,250,70,40,PI+PI/8,2*PI-PI/8);
  arc(328,252,70,40,PI+PI/8,2*PI-PI/8);
   //Boca
  fill(#FF0000);
  arc(401,400,50,20,0, 2*PI);
  fill(#FFFFFF);
  //Mofletes
  fill(#B04010);
  arc(445,370,100,80,-HALF_PI/1.2,PI/1.2);
  arc(358,370,100,80,HALF_PI/3,PI+HALF_PI/1.2);
  fill(#FFFFFF);
  //Nariz
  fill(#8E6540);
  triangle(401,391,457,331,344,331);
  fill(#FFFFFF);
  //Pelos
  line(337,350,151,311);
  line(350,390,170,475);
  line(344,373,150,373);
  line(460,350,666,325);
  line(470,375,660,390);
  line(450,390,634,470);
}


