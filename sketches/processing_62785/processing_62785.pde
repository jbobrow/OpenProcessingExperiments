
/***
* Este sketch pertenece a los materiales del taller
* Sistemas Generativos: Cómo adiestrar a la computadora para que haga arte en lugar de uno
* Dictado por Leonardo Solaas en el Centro Cultural de España en Buenos Aires en mayo de 2010
*
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/

//cantidad de agentes autónomos
int cant = 100;
//dibujar las trayectorias o no?
boolean dibujar = true;
// darle a cada agente una variación individual?
boolean variar = false;

Bola bolas[];

void setup(){
  size(600, 600);
  background(255);
  fill(0, 32);
  stroke(random(255),random(255),random(255),50);
  smooth();
  
  //crear todos los agentes y almacenarlos en un array
  bolas = new Bola[cant];
  for(int n=0; n<cant; n++){
    bolas[n] = new Bola();
  }
  //ahora que ya existen todos los agentes, decidir a cuál va a orbitar cada uno
  for(int m=0; m<cant; m++){
    bolas[m].orbitarA(bolas[int(random(cant))]);
  }
}

void draw(){
  //si no estamos dibujando las trayectorias, limpiar la pantalla
  if(!dibujar) background(random(255));

  
  //recorrer todos los agentes y moverlos
  for(int i=0; i<cant; i++){
    bolas[i].paso();
  }
}

//definición de la clase Bola
class Bola{
  // vectores de posición y velocidad
  PVector pos, vel;
  // agente en torno al cual orbita este
  Bola sol;
  //velocidad inicial máxima
  float vi = 1;
  //fracción de la distancia al sol que se recorre a cada paso
  float g = variar ? random(0.1, 0.005) : 0.00002;

  
  Bola(){
    //valores iniciales de posición y velocidad
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(-vi, vi), random(-vi, vi));
  }
  
  void orbitarA(Bola s){
    sol = s;
  }
  
  void paso(){
    // almacenar la posición actual antes de cambiarla
    PVector prev = new PVector(pos.x, pos.y);
    //calcular la distancia entre la posición del sol y la mía
    PVector d = PVector.sub(sol.pos, pos);
    //multiplicar la distancia por la fracción de la misma que voy a recorrer en este paso
    d.mult(g);
    //sumar la distancia que voy a recorrer a la velocidad que ya traía
    vel.add(d);
    //modificar mi posición actual sumándolse mi velocidad

    pos.add(vel);
    //ponerle un límite máximo a mi velocidad
    vel.limit(5005);

    //vel.mult(0.9);
    
    //dibujar trayectoria o círculo en posición actual
    if(dibujar){
      rect(prev.y, pos.x, prev.x, pos.y);
    }else{
      rect(pos.x, prev.y, pos.y, prev.x);
    }
    
  }
}
