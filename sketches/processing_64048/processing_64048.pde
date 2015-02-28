
/***
* Este sketch pertenece a los materiales del taller
* Sistemas Generativos: Cómo adiestrar a la computadora para que haga arte en lugar de uno
* Dictado por Leonardo Solaas en el Centro Cultural de España en Buenos Aires en mayo de 2010
*
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/

//cantidad de agentes autónomos
int cant = 350;
//dibujar las trayectorias o no?
//boolean dibujar = false;
// darle a cada agente una variación individual?
boolean variar = true;

Bola bolas[];

void setup(){
  size(600, 600);
  background(0);
  fill(50,20);
  stroke(80,10);
  smooth();
  
  //crear todos los agentes y almacenarlos en un array
  bolas = new Bola[cant];
  for(int n=0; n<cant; n++){
    bolas[n] = new Bola();
  }
}

void draw(){
  //si no estamos dibujando las trayectorias, limpiar la pantalla
  //if(!dibujar) background(255);
  
  //recorrer la lista de agentes y moverlos. el primero sigue al mouse, los demás siguen al anterior en la lista
  for(int n=0; n<cant; n++){
    float x, y;
    if(n == 0){
       x = bolas[n].x + (mouseX - bolas[n].x) / 10;
       y = bolas[n].y + (mouseY - bolas[n].y) / 10;
    }else{
      x = bolas[n].x + (bolas[n-1].x - bolas[n].x) / 5;
      y = bolas[n].y + (bolas[n-1].y - bolas[n].y) / 5;
    }
    bolas[n].paso(x, y);
  }
}

//definición de la clase Bola
class Bola{
  float x, y; //posición actual
  float ax, ay; //posición anterior
  float rx, ry; //variación individual de la posición
  
  Bola(){
    // determinar valores iniciales de las variables
    ax = x = 0;
    ay = y = 0;
    rx = variar ? random(-3, 3) : 0;
    ry = variar ? random(-3, 3) : 0;
  }
  
  void paso(float inputX, float inputY){
    //modificar posición
    x = inputX + rx;
    y = inputY + ry;
    
    //trazar trayectoria o mostrar posición con un círculo
    //if(dibujar){
     // line(ax, ay, x, y);
    //}else{
      ellipse(x, y, 2, 2);
    }
    
    //almacenar posición actual para el próximo paso
    //ax = x;
    //ay = y;
  }
//

