
/***
* Este sketch pertenece a los materiales del taller
* Sistemas Generativos: Cómo adiestrar a la computadora para que haga arte en lugar de uno
* Dictado por Leonardo Solaas en el Centro Cultural de España en Buenos Aires en mayo de 2010
*
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/

//cantidad de agentes autónomos
int cant2 = 50;
//dibujar las trayectorias o no?
boolean dibujar2 = true;
// darle a cada agente una variación individual?
boolean variar2 = true;

int cant1 = 100;
//dibujar las trayectorias o no?
boolean dibujar1 = true;
// darle a cada agente una variación individual?
boolean variar1 = false;
float rand1;
float rand2;

Bola1 bolas1[];
Bola2 bolas2[];

void setup(){
  size(600, 600);
  background(0);
  //fill (0,64);
  //stroke(255,0,0,50); //  stroke(255,15,50,50);
  smooth();
  
  //crear todos los agentes y almacenarlos en un array
  bolas2 = new Bola2[cant2];
  for(int n=0; n<cant2; n++){
    bolas2[n] = new Bola2();
  }
  
    bolas1 = new Bola1[cant1];
  for(int n=0; n<cant1; n++){
    bolas1[n] = new Bola1();
  }
  //ahora que ya existen todos los agentes, decidir a cuál va a orbitar cada uno
  for(int m=0; m<cant1; m++){
    bolas1[m].orbitarA1(bolas1[int(random(cant1))]);
  }
}

  //crear todos los agentes y almacenarlos en un array


void draw(){
  //si no estamos dibujando las trayectorias, limpiar la pantalla
  if(!dibujar2) background(0);
  
  //recorrer la lista de agentes y moverlos. el primero sigue al mouse, los demás siguen al anterior en la lista
  for(int n=0; n<cant2; n++){
    float x, y;
    if(n == 0){
       x = bolas2[n].x + (mouseX - bolas2[n].x) / 10;
       y = bolas2[n].y + (mouseY - bolas2[n].y) / 10;
    }else{
      x = bolas2[n].x + (bolas2[n-1].x - bolas2[n].x) / 5;
      y = bolas2[n].y + (bolas2[n-1].y - bolas2[n].y) / 5;
    }
    bolas2[n].paso2(x, y);
  }
  
    if(!dibujar1) background(0);
  
  //recorrer todos los agentes y moverlos
  for(int i=0; i<cant1; i++){
    bolas1[i].paso1();
  }
}

//definición de la clase Bola
class Bola2{
  float x, y; //posición actual
  float ax, ay; //posición anterior
  float rx, ry; //variación individual de la posición
  
  Bola2(){
    // determinar valores iniciales de las variables
    ax = x = 0;
    ay = y = 0;
    rx = variar2 ? random(-3, 3) : 0;
    ry = variar2 ? random(-3, 3) : 0;
  }
  
  void paso2(float inputX, float inputY){
    //modificar posición
    x = inputX + rx;
    y = inputY + ry;
    
    //trazar trayectoria o mostrar posición con un círculo
    if(dibujar2){
      rand2 = random(0,150);
      stroke(50,250,50,rand2);
      line(ax, ay, x, y);
      
    }else{
      rand2 = random(100,250);
      stroke(50,250,50,rand2);
      ellipse(x, y, 15, 15);
    }
    
    //almacenar posición actual para el próximo paso
    ax = x;
    ay = y;
  }
}


//definición de la clase Bola

class Bola1{
  // vectores de posición y velocidad
  PVector pos, vel;
  // agente en torno al cual orbita este
  Bola1 sol;
  //velocidad inicial máxima
  float vi = 1;
  //fracción de la distancia al sol que se recorre a cada paso
  float g = variar1 ? random(0.01, 0.1) : 0.01;
  
  Bola1(){
    //valores iniciales de posición y velocidad
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-vi, vi), random(-vi, vi));
  }
  
  void orbitarA1(Bola1 s){
    sol = s;
  }
  
  void paso1(){
    // almacenar la posición actual antes de cambiarla
    PVector prev = new PVector(pos.x, pos.y);
    //calcular la distancia entre la posición del sol y la mía
    PVector d = PVector.sub(sol.pos, pos);
    //multiplicar la distancia por la fracción de la misma que voy a recorrer en este paso
    d.mult(g);
    //sumar la distancia que voy a recorrer a la velocidad que ya traía
    vel.add(d);
    //modificar mi posición actual sumándole mi velocidad
    pos.add(vel);
    //ponerle un límite máximo a mi velocidad
    vel.limit(5);
    //vel.mult(0.9);
    
    //dibujar trayectoria o círculo en posición actual
    if(dibujar1){
      rand1 = random(100,250);
      stroke(50,50,200,rand1);
      line(prev.x, prev.y, pos.x, pos.y);
    }else{
      rand1 = random(100,250);
      stroke(50,50,200,rand1);
      ellipse(pos.x, pos.y, 10, 10);
    }
    
  }
}

