
/***
* Sketch original de Leo Solaas
* Modificado por Agustín Pecchia para el Seminario de Arte Generarivo
* Maestría en Artes Electrónicas - UNTreF 2012
*
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/

//cantidad de agentes autónomos
int cant = 160;

Bola bolas[];

void setup(){
  size(600, 600);
  background(0);
  //frameRate(20);
  //fill(0);
  //strokeWeight(2);
  smooth();
   //crear todos los agentes y almacenarlos en un array
  bolas = new Bola[cant];
  for(int n=0; n<cant; n++){
    bolas[n] = new Bola();
  }
  
}

void draw(){
  fill(random(79),random(38),random(41),random(16));
  rect(0,0,width,height);
  stroke(random(255), random(203), random(198),random(78,213));
  //recorrer todos los agentes y moverlos
  for(int i=0; i<cant; i++){
    bolas[i].paso();
  }
}

//definición de la clase Bola
class Bola{
  // vectores de posición y velocidad
  PVector pos, vel;

  Bola(){
    pos = new PVector(random(width), random(height));
    vel = new PVector(random(2)<1 ? -1 : 1, random(2)<1 ? -1 : 1);
    vel.normalize();
  }
  
  void paso(){
    // almacenar la posición actual antes de cambiarla
    PVector prev = new PVector(pos.x, pos.y);
    //modificar mi posición actual sumándole mi velocidad
    pos.add(vel);

    
    //leer el color del pixel en el que estoy
    color pcol = get(int(pos.x), int(pos.y));
    
    //dibujar trayectoria
    line(prev.x, prev.y, pos.x, pos.y);
    
    //si estoy en un pixel que ya fue pintado, saltar a otro punto de la pantalla
    if(red(pcol) > 150){
      pos.x = random(width);
      pos.y = random(height);
      }
    if(green(pcol) > 83){
      pos.x = random(width);
      pos.y = random(height);
      }
    if(blue(pcol) > 42){
      pos.x = random(width);
      pos.y = random(height);
      } 
    
    //si me voy por un borde de la pantalla, reingresar por el opuesto
    if(pos.x < 0) pos.x += width;
    if(pos.x > width) pos.x -= width;
    if(pos.y < 0) pos.y += height;
    if(pos.x > height) pos.y -= height;
  }
}
