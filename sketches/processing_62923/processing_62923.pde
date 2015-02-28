
/***
* Este sketch pertenece a los materiales del taller
* Sistemas Generativos: Cómo adiestrar a la computadora para que haga arte en lugar de uno
* Dictado por Leonardo Solaas en el Centro Cultural de España en Buenos Aires en mayo de 2010
*
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/

//cantidad de agentes autónomos
int cant = 50;

// darle a cada agente una variación individual?
boolean variar = true;

Bola bolas[];


void setup(){
  size(600, 600);
  background(255);
  fill(0,64);
  stroke(0, 32);
  smooth();
  
  //crear todos los agentes y almacenarlos en un array
  bolas = new Bola[cant];
  for(int n=0; n<cant; n++){
    bolas[n] = new Bola();
  }
}

void draw(){
  //si no estamos dibujando las trayectorias, limpiar la pantalla
  
  
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
    ax = x = random (width);
    ay = y = random (height);
    rx = variar ? random(-3, 3) : 0;
    ry = variar ? random(-3, 3) : 0;
  }
  
  void paso(float inputX, float inputY){
    //modificar posición
    x = inputX + rx;
    y = inputY + ry;
    
    //trazar trayectoria o mostrar posición con un círculo
   
      rectMode (CENTER);
      rect (x,y,random (20),random (20));
      fill (int (random (255)),int (random (255)),int (random (255)));
      ellipse(x, y,random (15), random (15));
      
      rect (x,y, 10,10);
    
    
    //almacenar posición actual para el próximo paso
    ax = x;
    ay = y;
  }
}

