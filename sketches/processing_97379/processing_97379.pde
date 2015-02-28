
/* 
 Joan Soler-Adillon
 Realitat Virtual || Realidad Virtual - Processing
 Màster en Arts Digitals, UPF
 http://www.joan.cat/
 */
 
float gravedad, valorDeFriccionY, valorDeFriccionX;
int ballsSize = 15;
//cremos ARRAYLIST para guardar las bolas
//sin necesidad de decidir a priori su número
ArrayList bolas = new ArrayList();

int totalCosas = 2500;
ArrayList listaCosas = new ArrayList();


//declaramos variables
PVector fuerza;


void setup() {
  size(700,450);
   noCursor();
  
    gravedad = 0.1;
  //y finalmente, un valor de fricción, para ir desacelerando la bola a medida que  va tocando el suelo. 
  //Es el valor por el que multiplicaremos la velocidad de la misma.
  valorDeFriccionY = -0.8;
  valorDeFriccionX = -0.8;
 
  //instanciamos objetos
  for(int i=0; i<totalCosas; i++){
    cosa c = new cosa(random(width)//pos x
                    ,random(height)//pos y
                    ,2.1 //acceleración de acercamiento mínima
                    ,0.1 //acceleración de acercamiento máxima
                    ,2 //velocidad límite mínima
                    ,15 //velocidad límite máxima
                    ,3 //tamaño mínimo
                    ,2 //tamaño máximo
                    ); 
    listaCosas.add(c);
  }
  //smooth();
  noStroke();

}

void draw() {
      background(0);
  
  actualizarCursor();
  actualizarBolas();
  
  for(int i=0; i<listaCosas.size(); i++) {
    cosa c = (cosa) listaCosas.get(i);
    c.calcularAcercamiento();
    c.run();
  }
}

void actualizarCursor() {

  //////CURSOR  //si clicamos
  if(mousePressed) {
    //y dibuja una elipse donde está este, para dar la impresión que se creó una y el usuario la tiene 
 ellipse(mouseX,mouseY,ballsSize,ballsSize);
  } 
  //
}

void actualizarBolas() {
  for(int i=0;i<bolas.size();i++) {
    ball b = (ball) bolas.get(i);
    b.run();
  }
}

//al dejar el mouse
void mouseReleased() {
  //creamos una nueva bola
  ball b = new ball(); 
  //y la añadimos al Array
  bolas.add(b);
  //line(mouseX,mouseY, mouseX+100, mouseY);
}

//si clicamos una tecla
void keyPressed() {
  //si es ESPACIO, disparamos la bolas para arriba
  if (key==' ') {
    for(int i = 0; i<bolas.size(); i++) {
      ball b = (ball) bolas.get(i);  
      b.myV.x = random(-5,5);
      b.myV.y = random(-8,-0.5);
    }
  } //Si es la C, cambiamos el modo de color
  else if (key=='r') {
    bolas.clear();
  }
}


////////////////////////////////////////////////////////
///////////////// CLASS BOLAS

class ball {

  PVector myP, myV; 
  int mySz = 5;

  ball() {
    myP = new PVector(mouseX,mouseY);
    myV = new PVector(mouseX-pmouseX,mouseY-pmouseY);
  } 

  void run() {
    update();
    drawMe();
  }

  void update() {
    myV.y += gravedad;

    //actualitzamos las posiciones
    myP.x += myV.x;
    myP.y += myV.y;

    //comprobamos los bordes X
    if(myP.x<mySz/2) {
      myV.x *= valorDeFriccionX;
      myP.x = mySz/2;
    } 
    else if (myP.x>width-mySz/2) {
      myV.x *= valorDeFriccionX;
      myP.x = width-mySz/2;
    }

    //comprobamos los bordes sólo por abajo. 
    if (myP.y>height-mySz/2) {
      myV.y *= valorDeFriccionY;
      //para que no se enganche:
      myP.y = height-mySz/2;
    }
  }

  void drawMe() {
    noStroke();
    fill(255,200,100,80);
    //ellipse(myP.x,myP.y,mySz,mySz);
    triangle(myP.x,myP.y,myP.x+1,myP.y+1,mouseX,mouseY);
  }
}


class cosa {

  PVector pos, vel, acc;
  float sz;
  float velAcercamiento, maxVel;

  cosa(float _x, float _y, float _minAcerc, float _maxAcerc, float _minMax, float _maxMax, int _minSz, int _maxSz){
    pos = new PVector(_x,_y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    velAcercamiento = random(_minAcerc,_maxAcerc);
    maxVel = random(_minMax,_maxMax);
    sz = int(random(_minSz,_maxSz));
  }

  void run() {
    update();
    drawMe();
  }

  void update() {  
    //actualizamos velocidad
    vel.add(acc);
    vel.limit(maxVel);
    pos.add(vel);
    acc.mult(0);
  }

  void drawMe() {

    //y finalmente, dibujamos
        fill(255,50);
    ellipse(pos.x,pos.y,sz,sz);
  }

  void addForce(PVector _f) {
    //acc.add(_f);
    //añadimos la fuerza a la acceleración, según el factor tamaño
    acc.add(PVector.mult(_f,sz));
  }
  
  void calcularAcercamiento(){
        //calculamos la distáncia entre el mouse y la bola en los 2 ejes
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,pos);
    //normalizamos este vector de direccion. Esto es, le damos magnitud 1:
    dir.normalize();
    //y lo multiplicamos por la velocidad:
    dir.mult(velAcercamiento);
    addForce(dir);
  }
}





