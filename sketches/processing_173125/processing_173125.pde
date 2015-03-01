
/*
 Autor: Joan Soler-Adillon (www.joan.cat)
 Tutorial de Processing
 2012
 */


//creamos un objeto
follower[] f = new follower[50];
PImage img;
PImage img2;

void setup() {
  size(600, 400);
  img = loadImage("shark.png");
  img2 = loadImage("1.gif");
  //instanciamos el objeto en medio de la pantalla, con velocidades 40 y tamaÃ±o 20
  for (int i=0; i<50; i++) {
    f[i] = new follower(random (0,width), random (0,height),random(0,100),random(0,100),i);
 

    noStroke();
  }
}

void draw() {
  //fondo con alfa
  fill(10, 100, 255);
  rect(0, 0, width, height);
  //ejecutamos el objeto
  for (int i=0; i<50; i++) {
    f[i].run();
  }
  cursor(img2);
  
}

///////////////////////////////////////
///////////////////////////////////////
//Clase follower
class follower {
  //variables
  float x, y, myX, myY, vx, vy, sz, movement;
  color fillColor, strokeColor;


  //constructor
  follower(float _x, float _y, float _vx, float _vy, float _sz) {
    myX = _x;
    myY = _y;
    vx = _vx;
    vy = _vy;
    sz = _sz;
    x = width/2;
    y = height/2;
    _sz = random (5,50);
    fillColor = color(random(255), random(255), random(255));
    strokeColor = color(random(255), random(255), random(255));

    movement = random(1, 5);
  }
  //funcion run (la que invocamos desde el draw)
  void run() {
    randomMove();
    update();
    drawing();

  }

  void randomMove() {
    float r = random(100);
    if (r < 25) {
      //derecha
      x += movement;
    } else if (r < 50) {
      //izquierda
      x -= movement;
    } else if (r < 75) {
      //arriba
      y -= movement;
    } else {
      //abajo
      y += movement;
    }
  }


  //actualizacion (de posiciones, aquí)
  void update() {
    //calculamos la distancia entre mouse i bola
    float distanceX = mouseX-myX;
    float distanceY = mouseY-myY;


    // actualizamos posicion a lo tortuga de zenon
    myX += distanceX/vx;
    myY += distanceY/vy;
  }

  //dibujo
  void drawing() {
    fill(0,0,random(0,255),80);
    image(img, myX, myY, sz, sz);
  }
}



