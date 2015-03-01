
/*
 Joan Soler-Adillon
 MUAD - UFP
 MÃƒ ster en Arts Digitals, UPF
 http://www.joan.cat/
 */
 
 
//...y CREAMOS UN OBJETO WALKER, al que llamamos wkr
Walker[] wkrs = new Walker[5];
PImage img;
PImage img2;
PImage img3;
 
//inicializamos
void setup() {
  size(800, 500);
  img = loadImage("Blue_Clouds.png");
  img2 = loadImage("prometheus.png");
  img3 = loadImage ("cuervo.png");
 
  //Inicializamos los Walkers: les enviamos los parÃƒÆ’Ã‚Â¡metros step y tamaÃƒÆ’Ã‚Â±o
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i] = new Walker(112, 115, random(5,5),random(5,10));
  }
}
 
void draw() {
  image(img, 0, 0, width, height);
  //ejecutamos los walkers
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i].run();
  }
  image(img2,mouseX,mouseY,0, 0);
  //cursor(img2);
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
    vx = _vx/3;
    vy = _vy/3;
    myX = width/2;
    myY = height/2;
  }
 
  //AquÃƒÆ’Ã‚Â­ no hay "draw", tenemos que crear una funciÃƒÆ’Ã‚Â³n de ejecución
  void run() {
    updatePosition();
    drawMe();
  }
 
  void updatePosition() {
    //creamos un random para cada direcciÃƒÆ’Ã‚Â³n:
    float randX = random(50);
    float randY = random(50);
    //en la X, si es mayor a 50, el walker va para la derecha
    if (randX >= 25) {
      //ve hacia la derecha
      myX += myStep;
    } // y si es menor, para la izquierda
    else {
      myX -= myStep;
 
    }
    //y lo mismo para Y: si es mayor a 50, el walker va para abajo
    if (randY >= 25) {
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
 
    float cuervos = random(100);
 
    if (cuervos >= 50) {
     
      stroke(64, 0, 0);
      fill(255, 0, 64);   
      image(img3,myX, myY, mySz, mySz);
    } // y si es menor, para la izquierda
  
    }
  
}



