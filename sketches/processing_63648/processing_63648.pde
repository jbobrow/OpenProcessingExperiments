
/***
* Este sketch pertenece a los materiales del taller
* Sistemas Generativos: Cómo adiestrar a la computadora para que haga arte en lugar de uno
* Dictado por Leonardo Solaas en el Centro Cultural de España en Buenos Aires en mayo de 2010
*
* Este código se distribuye bajo licencia GNU/GPL v3: http://www.gnu.org/licenses/gpl.txt
***/

import processing.video.*;                // MAC

//GSCapture cam; // PC
Capture cam;   //MAC


//cantidad de relaciones por nodo
int relaciones = 200;
//largo de los vínculos entre nodos
float separacion = 100;

ArrayList bolas;




void setup(){
  
  
    cam = new Capture(this,320, 240);       // MAC
  
   
   tint(200,0,150,10); //color imagen
   frameRate(5); // modifica todo el programa generando distintas texturas asi como la imagen cam
  
  
  /// 
  size(800, 600);
  background(250);
  fill(255,228,0,10);
  stroke(20,200,250,20);
  
  //crear la lista dinámica de nodos
  bolas = new ArrayList();
}

void draw(){
  
  if (cam.available() == true) {
  
    cam.read();
    image(cam, 0, 0,width,height);
    // theta += 0.03;
    
     image(cam, 0, 0,width,height);
     //theta += 0.03;
   
    
  }
  
  
  
  //limpiar la pantalla
 // background(0);
  //recorrer todos los nodos y moverlos
  for(int i=0; i<bolas.size(); i++){
    Bola b = (Bola) bolas.get(i);
    b.paso();
    
 
    
  }
}


void mouseDragged
(){
  //crear un nuevo nodo en la posición del mouse
  Bola niu = new Bola(mouseX, mouseY);
  bolas.add(niu);
}

void keyPressed(){
  switch(key){
    case ' ':
    //recorrer todos los nodos y llamar a la función 'iniciar' para reconstruir las relaciones
    for(int i=0; i<bolas.size(); i++){
      Bola b = (Bola) bolas.get(i);
      b.iniciar();
    }
    break;
  }
}

//definición de la clase Bola
class Bola{
  // vectores de posición y velocidad
  PVector pos, vel;
  // multiplicador que reduce la velocidad a cada paso
  float roce = 0.49;
  //lista de agentes relacionados con este
  Bola[] rels;
  
  Bola(float _x, float _y){
    //valores iniciales de posición y velocidad
    pos = new PVector(_x, _y);
    vel = new PVector(50, 50);
    //crear lista de nodos relacionados
    rels = new Bola[relaciones];
    iniciar();
  }
  
  //función que busca los nodos más cercanos a este y almacena las relaciones
  void iniciar() {
    //hacer una lista de destancias
    float[] dists = new float[relaciones];
    for(int _n=0; _n<relaciones; _n++) dists[_n] = 100;
    
    for(int r=0; r<bolas.size(); r++){
      //para cada nodo...
      Bola b = (Bola) bolas.get(r);
      //que no sea este mismo...
      if(b == this) continue;
      //calcular la distancia
      float d = dist(b.pos.x, b.pos.y, pos.x, pos.y);
      //y evaluar si esta distancia es menor que alguna de las ya almacenadas
      for(int n=0; n<relaciones; n++){
        if(d < dists[n]){
          //si es el caso, empujar la que ya está hacia abajo y almacenarla
          if(n+1 < relaciones){
            dists[n+1] = dists[n];
            rels[n+1] = rels[n];
          }
          dists[n] = d;
          rels[n] = b;
          break;
        }
      }
      
       fill (0,1);
      
      
      
    }
  }
  
  void paso(){
    for(int i=0; i<rels.length; i++){
      Bola otra = rels[i];
      if(otra == null) continue;

      //calcular distancia con el nodo relacionado
      float d = dist(otra.pos.x, otra.pos.y, pos.x, pos.y);
      //y ángulo
      float a = atan2(otra.pos.y - pos.y, otra.pos.x - pos.x);
      float mod = (d-separacion) / 100;
      
      vel.x += mod * cos(a);
      vel.y += mod * sin(a);
      
      line(pos.x, pos.y, otra.pos.x, otra.pos.y);
    }
    
    //añadir velocidad a posición actual
    pos.add(vel);
    //ponerle un límite máximo a mi velocidad
    vel.mult(roce);
    
    //dibujar trayectoria o círculo en posición actual
    ellipse(pos.x, pos.y, 12, 12);
    
  }
}

