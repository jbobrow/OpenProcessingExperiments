
/* 
 Joan Soler-Adillon
 MUAD - UFP
 MÃƒ ster en Arts Digitals, UPF
 http://www.joan.cat/
 */


//...y CREAMOS UN OBJETO WALKER, al que llamamos wkr
Walker[] wkrs = new Walker[1000]; 

//inicializamos
void setup() {
  size(300, 200);
  //Inicializamos los Walkers: les enviamos los parÃƒÆ’Ã‚Â¡metros step y tamaÃƒÆ’Ã‚Â±o
  for (int i=0; i<wkrs.length;i++) {
    wkrs[i] = new Walker(2,width/2,height/2,40,40, 5);
  }
}

void draw() {
  background(0);
  //ejecutamos los walkers
  for (int i=0; i<wkrs.length;i++) {
    wkrs[i].run();
  }
}


///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/// CLASE WALKER

class Walker {
  //declaramos variables:
  int mySz,myStep;
  float myX, myY, vX, vY;

  //Constructor: se ejecuta al crear la instancia del objeto
  Walker (int _st, float _x, float _y, float _vx, float _vy, int _sz) {
      myStep = _st;
      mySz = _sz;
    myX = _x;
    myY = _y;
    vx = _vx;
    vy = _vy;
  
  }

  //AquÃƒÆ’Ã‚Â­ no hay "draw", tenemos que crear una funciÃƒÆ’Ã‚Â³n de ejecuciÃƒÆ’Ã‚Â³n
  void run() {
    updatePosition();
    drawMe();
  }

  void updatePosition() {
    //creamos un random para cada direcciÃƒÆ’Ã‚Â³n:
    
    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;
    float randX = random(50);
    float randY = random(50);
    //en la X, si es mayor a 50, el walker va para la derecha
    myX += myStep/randX * distanceX/vx;
    myY += myStep/randY * distanceY/vy;
  
    myX = constrain(myX, 0, width);
    myY = constrain(myY, 0, height);
  }
  
  
  void drawMe() {
    //preparamos color
    //noStroke();
    stroke(64,0,0);
    fill(255, 0, 64);
    //dibujamos:
    ellipse(myX, myY, mySz, mySz);
  }


}



