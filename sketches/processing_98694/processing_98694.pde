
/* 
 Joan Soler-Adillon
 Realitat Virtual || Realidad Virtual - Processing
 Màster en Arts Digitals, UPF
 http://www.joan.cat/
 */

int totalCosas = 5;
ArrayList listaCosas = new ArrayList();
ArrayList listaLineas = new ArrayList();
PVector fuerza;
float distancia;
color[] miscolores = {#E5FF40, #FFF040, #7D008E, #00E281};
int colorBola;

////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(700, 450);
  noStroke();
}

////////////////////////////////////////////////////////////////////////////////////
void draw() {
  background(#949594);
  actualizarCursor();
  actualizarBolas();
  dibujarLineas();
  //agregarBolas();
}

////////////////////////////////////////////////////////////////////////////////////
void mouseReleased() {
  cosa c = new cosa(random(width)//pos x
  , random(height)//pos y
  , 8 //velocidad límite mínima
  , 15 //velocidad límite máxima
  , 15 //tamaño mínimo
  , 50 //tamaño máximo
  ); 
  listaCosas.add(c);
}

////////////////////////////////////////////////////////////////////////////////////
void actualizarCursor() {

  if (mousePressed) {
    cursor(HAND);
  } 
  else {
    cursor(ARROW);
  }
}

void actualizarBolas() {
  for (int i=0;i<listaCosas.size();i++) {
    cosa c = (cosa) listaCosas.get(i);
    c.run();
  }


  if (frameCount % 200 == 0) {
    for (int i = 0; i<listaCosas.size(); i++) {
      cosa c = (cosa) listaCosas.get(i);  
      c.vel.x = random(-5, 5);
      c.vel.y = random(-8, -0.5);
    }
  }
} 

////////////////////////////////////////////////////////////////////////////////////
void dibujarLineas() {
  for (int i = 0; i<listaCosas.size(); i++) {
    for (int j = 0; j<i; j++) {
      if (i != j) {
        cosa c = (cosa) listaCosas.get(i);
        cosa d = (cosa) listaCosas.get(j);
        colorBola = miscolores[i % 4];
        stroke(colorBola);
        line(c.pos.x, c.pos.y, d.pos.x, d.pos.y);
      }
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////
void keyPressed() {
  for (int i=0;i<listaCosas.size();i++) {
    cosa c = (cosa) listaCosas.get(i);
    listaCosas.remove(c);
  } 
}

//Esto me daba error, queria comprobar si colisionaban, sacar las que chocaban y poner en su lugar una bola de la sumatoria de las dos.
////////////////////////////////////////////////////////////////////////////////////
/*void agregarBolas() { 
  for (int i = 0; i<listaCosas.size(); i++) {
    for (int j = 0; j<i; j++) {
      if (i != j) {
        cosa c = (cosa) listaCosas.get(i);
        cosa d = (cosa) listaCosas.get(j);  
        distancia = dist(c.pos.x, c.pos.y, d.pos.x, d.pos.y);
        if (distancia <= (c.sz)/2 + (d.sz)/2) {
          cosa f = new cosa(random(width), random(height), 8, 15, int(distancia), int(distancia)); 
          listaCosas.remove(c);
          listaCosas.remove(d);
          listaCosas.add(f);
          }}}}}*/

class cosa {

  PVector pos, vel, acc;
  float sz;
  float velAcercamiento, maxVel;
  color[] miscolores = {#E5FF40, #FFF040, #7D008E, #00E281};
  int colorBola = miscolores[(int)random(4)];
  float alfa = random(50, 150); 
  float distance;
  float gravedad = 0.05;
  float valorDeFriccionY = -0.8;
  float valorDeFriccionX = -0.8;


  cosa(float _x, float _y, float _minMax, float _maxMax, int _minSz, int _maxSz) {
    pos = new PVector(_x, _y);
    vel = new PVector(0, 0);
    acc = new PVector(0, gravedad);
    maxVel = random(_minMax, _maxMax);
    sz = int(random(_minSz, _maxSz));
  }


////////////////////////////////////////////////////////////////////////////////////
  void run() {
    update();
    drawMe();
  }
  
////////////////////////////////////////////////////////////////////////////////////

  void update() {  

    vel.limit(maxVel);
    vel.y += acc.y;

    //actualitzamos las posiciones
    pos.add(vel);

    //comprobamos los bordes X
    if (pos.x<sz/2) {
      vel.x *= valorDeFriccionX;
      pos.x = sz/2;
    } 
    else if (pos.x>width-sz/2) {
      vel.x *= valorDeFriccionX;
      pos.x = width-sz/2;
    }

    //comprobamos los bordes 
    if (pos.y>height-sz/2) {
      vel.y *= valorDeFriccionY;
      //para que no se enganche:
      pos.y = height-sz/2;
    }

    if (pos.y<sz/2) {
      vel.y *= valorDeFriccionY;
      //para que no se enganche:
      pos.y = 0+sz/2;
    }
    
  }
  
////////////////////////////////////////////////////////////////////////////////////  
  void drawMe() {
    //y finalmente, dibujamos
    noStroke();
    fill(colorBola, alfa);
    ellipse(pos.x, pos.y, sz, sz);
  }


////////////////////////////////////////////////////////////////////////////////////
  void addForce(PVector _f) {
    //añadimos la fuerza a la acceleración, según el factor tamaño
    acc.add(PVector.mult(_f, sz));
  }

}



