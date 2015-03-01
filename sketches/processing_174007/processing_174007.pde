



Walker[] wkrs = new Walker[1000]; 
PImage img;
PImage cursor1;


//int c;
//int d;
void setup() {
  //  c=3;
  //  d=1;
  size(800, 600);
  img = loadImage("a2.png");
  cursor1 = loadImage("cursor.png");


  image(img, 0, 0, width, height);

  //background(0);
  //Inicializamos los Walkers: les enviamos los parÃƒÆ’Ã‚Â¡metros step y tamaÃƒÆ’Ã‚Â±o
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i] = new Walker(1, 5, random(100, 300), random(100, 300));
  }
}

void draw() {

  cursor(cursor1, 5, 5);
  //rect(0, 0, width, height);
  //ejecutamos los walkers
  for (int i=0; i<wkrs.length; i++) {
    wkrs[i].run();
  }
  //  fill(0, d/2, d);
  //  noStroke();
  //  rect(363, 272, 77, 48, 8);
  //  d=d+c;
  //  if (d>200||d<2) {
  //    c = -c;
  //}


  if (mousePressed) {

    stroke(0, 0, 0, 200);
    strokeWeight(10);
    line(mouseX, mouseY, pmouseX, pmouseY);
    
    float rand = random(0,100);
    if (rand < 30) {
      strokeWeight(random(1,3));
    line(mouseX, mouseY, mouseX, pmouseY+random(0,50));
    }
    strokeWeight(1);
    
    //    for (int i=0; i < 100; i++) { 
    //      fill(0, 0, 0, 50);
    //      //strokeWeight(1);
    //      line(mouseX+random(-5, 5), mouseY+random(-5, 5), random(2, 10), random(2, 10));
    //    }
  }
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
    myX = width;
    myY = height;
  }

  //AquÃƒÆ’Ã‚Â­ no hay "draw", tenemos que crear una funciÃƒÆ’Ã‚Â³n de ejecuciÃƒÆ’Ã‚Â³n
  void run() {
    updatePosition();
    //drawMe();
  }

  void updatePosition() {
    //creamos un random para cada direcciÃƒÆ’Ã‚Â³n:
    float randX = random(100);
    float randY = random(100);
    float NmyX;
    float NmyY;
    //en la X, si es mayor a 50, el walker va para la derecha
    if (randX >= 51) {
      //ve hacia la derecha
      NmyX = myX + myStep;
    } // y si es menor, para la izquierda
    else {
      NmyX = myX - myStep;
    }
    //y lo mismo para Y: si es mayor a 50, el walker va para abajo
    if (randY >= 51) {
      //ve hacia abajo
      NmyY = myY + myStep;
    } // y si es menor, para arriba
    else {
      NmyY = myY - myStep;
    }
    //y finalmente, mantenemos el walker dentro de la ventana con constrin
    myX = constrain(myX, 0, width);
    myY = constrain(myY, 0, height);

    //float distanceX = mouseX-NmyX;
    //float distanceY = mouseY-NmyY;

    //NmyX += distanceX/vx;
    //NmyY += distanceY/vy;

    //preparamos color
    //noStroke();
    stroke(random(50), random(200), random(50), random(20, 70));
    //fill(0, 0, 255);
    //dibujamos:
    line(myX, myY, NmyX, NmyY);
    //rect(myX, myY, 5, 5);
    myX=NmyX;
    myY=NmyY;
  }

  //  void drawMe() {
  //    //preparamos color
  //    //noStroke();
  //    stroke(random(255),random(255),random(255),20);
  //    //fill(0, 0, 255);
  //    //dibujamos:
  //    line(myX, myY, NmyX, NmyY);
  //    
  //  }
} 



