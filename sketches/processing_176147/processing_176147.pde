
int [][] mapanod;
int ini= -1;
int fin= -1;
int ancho=600, alto=600;
boolean ok;

ArrayList Abierta;
ArrayList Cerrada;
ArrayList nodos;
ArrayList camino;

void setup(){
 size(ancho,alto);
 mapanod = new int[ancho/20][alto/20];
 Abierta = new ArrayList();
 Cerrada = new ArrayList();
 nodos = new ArrayList(); 
 camino = new ArrayList(); 
 cuadricula();
 mapa(); // crea el mapa de nodos y asigna los vecinos de cada nodo

 
}


void draw() {
  
  Nodo n;
  for ( int i = 0; i < nodos.size(); i++ ) {
    n = (Nodo)nodos.get(i);
    if (i==ini) {
      fill(0,255,0);
    }
    else if (i==fin) {
      fill(255,0,0);
    }else {
      if (camino.contains(n)) {
        fill(0,0,255);
      }else if(Cerrada.contains(n)){
        fill(255,255,0);
      }else {
        fill(255,255,255);
      }
    }
   noStroke();
   rect(n.x+1,n.y+1,19,19);
  }
}
  
  void mousePressed() {
  if (mapanod[int(floor(mouseY/20))][int(floor(mouseX/20))]!=-1) {
    if (ini==-1) {
      ini = mapanod[int(floor(mouseY/20))][int(floor(mouseX/20))];
    }
    else if (fin==-1) {
      fin = mapanod[int(floor(mouseY/20))][int(floor(mouseX/20))];
      if (fin==ini) {
        fin = -1;
      }
    }
    else {
      ini = -1;
      fin = -1;
      camino.clear();
      Cerrada.clear();
    }
  }
}
void keyPressed() { 
  if (ini!=-1 && fin!=-1) {
   ok=AlgoritmoA(ini,fin);
   println(ok);
  }
}
  



void cuadricula(){
  int x,y;
  for (x = 0; x <= alto; x=x+20) {line(x, 0, x, ancho); }
  for (y = 0; y <= ancho; y=y+20) {line(0, y, alto, y); } 
}



void mapa() { // Crea mapa de nodos y añade a cada nodo sus vecinos
  int x,y;
  Nodo n;
  for (x = 0; x < ancho/20; x=x+1) {
    for (y = 0; y < alto/20; y=y+1) {
      mapanod[y][x] = -1;
      if (floor(random(7))!=0) {
        nodos.add(new Nodo(x*20,y*20));
        mapanod[y][x] = nodos.size()-1;
        if (y>0){
          if (mapanod[y-1][x]!=-1) {
            n = (Nodo)nodos.get(nodos.size()-1);
            n.addNbor((Nodo)nodos.get(mapanod[y-1][x])); 
            ((Nodo)nodos.get(mapanod[y-1][x])).addNbor(n);
          }
        }
        if (x>0) {
          if (mapanod[y][x-1]!=-1) {
            n = (Nodo)nodos.get(nodos.size()-1);
            n.addNbor((Nodo)nodos.get(mapanod[y][x-1]));
            ((Nodo)nodos.get(mapanod[y][x-1])).addNbor(n);
          }
        }     
     }
    }
  }
}

float dis(float x1,float y1,float x2,float y2) { // nos calcula h
  return sqrt(abs(y2-y1)+abs(x2-x1));
}

boolean AlgoritmoA(int A,int B) {
  float finX = ((Nodo)nodos.get(B)).x ,finY = ((Nodo)nodos.get(B)).y;
    
  Abierta.clear();
  Cerrada.clear();
  camino.clear();
  
  //Colocamos en lista abierta el nodo inicial
  Abierta.add(((Nodo)nodos.get(A)));
  ((Nodo)Abierta.get(0)).p = -1;
  ((Nodo)Abierta.get(0)).g = 0;
  ((Nodo)Abierta.get(0)).h = dis( ((Nodo)Abierta.get(0)).x, ((Nodo)Abierta.get(0)).y, finX, finY );
  
  Nodo actual;
  float aux;
  boolean mejor;
  float minimo = 100000000;
  int posmin= -1;
  
  while( Abierta.size()>0 ) { // mientras Abierta no este vacia continuar hasta terminar (true), si esta vacia retornamos fracaso (false)
    
    minimo = 100000000;
    for ( int i = 0; i < Abierta.size(); i++ ) {
      if ( ( ((Nodo)Abierta.get(i)).g+((Nodo)Abierta.get(i)).h ) <= minimo ) {
        minimo = ( ((Nodo)Abierta.get(i)).g+((Nodo)Abierta.get(i)).h ); //Establecemos nueva F minima
        posmin = i; //localizamos la posicion donde F es minima
      }
    }
    actual = (Nodo)Abierta.get(posmin);
    if ( (actual.x == finX) && (actual.y == finY) ) { // si es el nodo final
      
      Nodo d = (Nodo)Abierta.get(posmin);
      while( d.p != -1 ) { //recoge sucesores formando el camino de minimo coste
        camino.add( d );
        d = (Nodo)nodos.get(d.p);
      }
      return true;
    }
    //Si no es fin eliminar nodo de abierta y meter en cerrada
    Cerrada.add((Nodo)Abierta.get(posmin) );
    Abierta.remove(posmin);
    for ( int n = 0; n < actual.nbors.size(); n++ ) { //en cada nodo comprobamos los vecinos
      if ( Cerrada.contains((Nodo)actual.nbors.get(n) ) ) {
        continue;
      }
      aux = actual.g + dis(actual.x, actual.y, ((Nodo)actual.nbors.get(n)).x, ((Nodo)actual.nbors.get(n)).y ); // calcula F del nodo
      if ( !Abierta.contains((Nodo)actual.nbors.get(n) ) ) { // si el vecino no esta en la lista Abierta lo añadimos
        Abierta.add( (Nodo)actual.nbors.get(n) );
        mejor = true;
      }
      else if ( aux < ((Nodo)actual.nbors.get(n)).g ) {
        mejor = true;
      }
      else {
        mejor = false;
      }
      
      if (mejor) { //Si aux sigue siendo el camino de menos coste 
        ((Nodo)actual.nbors.get(n)).p = nodos.indexOf( (Nodo)Cerrada.get(Cerrada.size()-1) ); 
        ((Nodo)actual.nbors.get(n)).g = aux; 
        ((Nodo)actual.nbors.get(n)).h = dis(((Nodo)actual.nbors.get(n)).x, ((Nodo)actual.nbors.get(n)).y, finX, finY);
      }
    }
  }
  return false;
}


class Nodo {
  float x,y;
  float g,h;
  int p;
  ArrayList nbors; 
 
  Nodo(float _x,float _y) {
    x = _x;
    y = _y;
    g = 0;
    h = 0;
    p = -1;
    nbors = new ArrayList();
    
  }
  void addNbor(Nodo _node) {
    nbors.add(_node);
   
  }
}







