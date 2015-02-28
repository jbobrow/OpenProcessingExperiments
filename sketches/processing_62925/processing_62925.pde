
/***
* Sketch original de Leo Solaas
* Modificado por Agustín Pecchia para el Seminario de Arte Generarivo
* Maestría en Artes Electrónicas - UNTreF 2012
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/
//cantidad de agentes autónomos
int cant = 34;

Bola bolas[];

void setup(){
  size(600, 600);
  background(0);
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
  //color del trazo
  stroke(random(255), random(163), random(98),random(10,200));
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
    //incrementa la posición x y decrece la posición en y
    PVector prev = new PVector(pos.x+1, pos.y-2);
    //modificar mi posición actual sumándole mi velocidad
    pos.add(vel);

    
    //leer el color del pixel en el que estoy
    color pcol = get(int(pos.x), int(pos.y));
    
    //dibujar trayectoria
    line(prev.x, prev.y, pos.x, pos.y);
    
    //si estoy en un pixel que ya fue pintado, saltar a otro punto de la pantalla
    //dependiendo del color del pixel original
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
    //cambia la dirección x y en algún momento se va sin retorno... :( 
    if(pos.x < 0) pos.x = 0;
    pos.x++;
    if(pos.x > width) pos.x -= width;
    if(pos.y < 0) pos.y = 0;
    if(pos.x > height) pos.y -= height;
  }
}
