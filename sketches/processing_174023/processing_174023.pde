
/* 
 Joan Soler-Adillon
 MUAD - UFP
 MÃƒ ster en Arts Digitals, UPF
 http://www.joan.cat/
 */


//...y CREAMOS UN OBJETO WALKER, al que llamamos wkr
follower [] f = new follower [100]; 

//inicializamos
void setup() {
  size(300, 200);
  //Inicializamos los Walkers: les enviamos los parÃƒÆ’Ã‚Â¡metros step y tamaÃƒÆ’Ã‚Â±o
  for (int i=0; i<f.length; i++) {
    f[i] = new follower(random (1,10), random (1,10),40,40);
  }
}

void draw() {
  background(0);
  //ejecutamos los walkers
  for (int i=0; i<f.length; i++) {
    f[i].run();
  }
}


///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/// CLASE WALKER

class follower {
  //declaramos variables:
  
  float mySz,myStep,myX, myY,vx,vy;

  //Constructor: se ejecuta al crear la instancia del objeto
  follower (float _st, float _sz, float _vx, float _vy) {
    myStep = _st;
    mySz = _sz;
    myX = width/2;
    myY = height/2;
    vx=_vx;
    vy=_vy;
  }

  //AquÃƒÆ’Ã‚Â­ no hay "draw", tenemos que crear una funciÃƒÆ’Ã‚Â³n de ejecuciÃƒÆ’Ã‚Â³n
  void run() {
    updatePosition();
    drawMe();
  }

  void updatePosition() {
    //creamos un random para cada direcciÃƒÆ’Ã‚Â³n:
    float randX = random(100);
    float randY = random(100);
    //en la X, si es mayor a 50, el walker va para la derecha
    if (randX >= 50) {
      //ve hacia la derecha
      myX += myStep;
    } // y si es menor, para la izquierda
    else {
      myX -= myStep;
    }
    //y lo mismo para Y: si es mayor a 50, el walker va para abajo
    if (randY >= 50) {
      //ve hacia abajo
      myY += myStep;
    } // y si es menor, para arriba
    else {
      myY -= myStep;
    }
    
     float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;

// actualizamos posiciÃ³n a lo tortuga de zenÃ³n
    myX += distanceX/vx;
    myY += distanceY/vy;

    //y finalmente, mantenemos el walker dentro de la ventana con constrin
    myX = constrain(myX, 0, width);
    myY = constrain(myY, 0, height);
  }

  void drawMe() {
    //preparamos color
    //noStroke();
    stroke(64, 0, 0);
    fill(255, 0, 64);
    //dibujamos:
    ellipse(myX, myY, mySz, mySz);
  }
} 






