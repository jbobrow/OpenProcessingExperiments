
/* 
 Joan Soler-Adillon
 MUAD - UFP
 MÃ�Æ� ster en Arts Digitals, UPF
 http://www.joan.cat/
 */


//...y CREAMOS UN OBJETO WALKER, al que llamamos wkr
Walker[] wkrs = new Walker[500]; 
PImage img;
PImage img2;

//inicializamos
void setup() {
  size(600, 380);
  img = loadImage("1.png");
  img2 = loadImage("2.png");

  //Inicializamos los Walkers: les enviamos los parÃ�Æ�Ã�â��Ã�â��Ã�Â¡metros step y tamaÃ�Æ�Ã�â��Ã�â��Ã�Â±o
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i] = new Walker(2, 5, random(50,200),random(50,200));
  }
}

void draw() {
  image(img, 0, 0, width, height);
  //ejecutamos los walkers
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i].run();
  }
  cursor(img2);
}


///////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/// CLASE WALKER

class Walker {
  //declaramos variables:
  int mySz, myStep;
  float myX, myY, vx, vy;

  //Constructor: se ejecuta al crear la instancia del objeto
  Walker (int _st, int _sz, float _vx, float _vy) {
    myStep = _st;
    mySz = _sz;
    vx = _vx;
    vy = _vy;
    myX = width/2;
    myY = height/2;
  }

  //AquÃ�Æ�Ã�â��Ã�â��Ã�Â­ no hay "draw", tenemos que crear una funciÃ�Æ�Ã�â��Ã�â��Ã�Â³n de ejecuciÃ³n
  void run() {
    updatePosition();
    drawMe();
  }

  void updatePosition() {
    //creamos un random para cada direcciÃ�Æ�Ã�â��Ã�â��Ã�Â³n:
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
    //y finalmente, mantenemos el walker dentro de la ventana con constrin
    myX = constrain(myX, 0, width);
    myY = constrain(myY, 0, height);
    
    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;

      myX += distanceX/vx;
      myY += distanceY/vy;
  }

  void drawMe() {

    float randEquipo1 = random(100);

    if (randEquipo1 >= 50) {
      //preparamos color
      //noStroke();
      stroke(64, 0, 0);
      fill(255, 0, 64);
      //dibujamos:
      ellipse(myX, myY, mySz, mySz);
    } // y si es menor, para la izquierda
    else {

      //preparamos color
      //noStroke();
      stroke(64, 0, 0);
      fill(64, 0, 255);
      //dibujamos:
      ellipse(myX, myY, mySz, mySz);
    }
  } 
}



