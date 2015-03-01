
//Creem una matriu de 1000 Walkers
Walker[] wkrs = new Walker[1000]; 

//inicialitzem
void setup() {
  size(600, 600);
  //inicliatizem cada walker
  for (int i=0; i<wkrs.length;i++) {
    wkrs[i] = new Walker(6, 9,random(300,300),random(300,300)); //(distancia,tamañob y velocidad de las bolitas)
  }
}

void draw() {
  
  fill(0,5); //fondo con transparencia para que quede sombra en las bolitas
     rect(0,0,width,height);
  for (int i=0; i<wkrs.length;i++) {
    wkrs[i].run();
  }
}


///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/// CLASSE WALKER

class Walker {
  //declarem variables:
  int mySz, myStep;
  float myX, myY;
  float vx,vy;

  //Constructor: estos objetos son variables dentro de una clase que se ejecutan solo una vez. Para construir el objeto que luego se llamará cada vez como new
  Walker (int _st, int _sz,float _vx, float _vy) {
    myStep = _st;
    mySz = _sz;
    myX = width/2;
    myY = height/2;
    vx=_vx;
    vy=_vy;
  }

  
  void run() {
    updatePosition();
    drawMe();
  }

  void updatePosition() {
    //creem un random per cada dirección
    float randX = random(100);
    float randY = random(100);
 
    if (randX >= 50) {//va a la derecha
      //el fem avanzar
      myX += myStep;
    } //y si es menor a la izquierda
    else {
      myX -= myStep;
    }
   
    if (randY >= 50) {// y si es mayor a 50, va para abajo
      myY += myStep;
    } 
    else {
      myY -= myStep;// y si es menor para arriba
    }
    
    //distancia entre mouse y bola
       float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;
    
    myX += distanceX/vx;
    myY += distanceY/vy;
    
    //y mantenemos el walker dentro de la ventana
    myX = constrain(myX, 0, width);
    myY = constrain(myY, 0, height);
  }

  void drawMe() {
    //preparamos color
    noStroke();
    fill(random(0,255),random(0,255),random(0,255));
    //dibuixem:
    ellipse(myX, myY, mySz, mySz);
  }
} 



