
/* Autor: Sergi Garcia Calero - 1o ASIX C.E.Roca - 20/10/2013

Processing2: Segundo ejercicio de processing para clase de PB.
-Objetivo: Modificar la cara y darle movimiento
-Precondicion: Debe utilizarse la cara original

*/
float escala = 1.0;
boolean reduccion = false;
int i=0;
int j=0;
int k=0;
boolean patata = false;


void setup(){
  size(800, 600); //Tamaño del "Lienzo"
  frameRate(100); //Velocitat
  background(230, 230, 230); //Fondo
  
  
}

void draw(){
 //Haremos que el fondo de pantalla sea un valor semialeatorio 
 background(k%190, k%115, k%143);
 textSize(30);
 text("Fes clic per portar al gat a passejar", 200, 150);
  //Trigger
  if (mousePressed){
  patata=true;
  }
  //Movimiento
  if (patata && i<300){
    ++i; ++j;
    
  }
  translate (i,j);
  
  //Reduccion
  if (escala > 0.2 && !reduccion) escala -= 0.01; 
  else {
    reduccion = true;
  }
  scale(escala);
  //Comportamiento del Gato al acabar el movimiento
  if (patata && j==300){ 
    textSize(180);
    text("Miaaaaaau!!!!", 400, 550);
    rotate(k/4);
    //Si volvemos a pulsar el raton, se acaba el movimiento.
    if (mousePressed){
      patata=false;
    }
  }
  /* K hace lo siguiente:
    -Regula el color de fondo, esa "semialetoriedad"
    -Regula la velocidad de rotacion del gato
    -Controla que el programa no "pete", ya que es mejor usar
    un valor fijo incremental que un random
  */
  ++k;
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
  
  
  
  




