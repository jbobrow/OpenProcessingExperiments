
////////////////////////////////////////////////////////
///////////////// CLASS BOLAS

class ball {

  PVector myP, myV; 
  int mySz;
  float r, g, b;

  ball(int _mySz, float _r, float _g, float _b) {
    myP = new PVector(random(15, width-15), 15);
    myV = new PVector(random(-3, 3), random(-3, 3)); //mouseX-pmouseX,mouseY-pmouseY
    mySz = _mySz;
    r = _r;
    g = _g;
    b = _b;
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
    if (myP.x<mySz/2) {
      myV.x *= valorDeFriccionX;
      myP.x = mySz/2;
    } 
    else if (myP.x>width-mySz/2) {
      myV.x *= valorDeFriccionX;
      myP.x = width-mySz/2;
    }

    //comprobamos los bordes sÃƒÂ³lo por abajo. 
    if (myP.y>height-mySz/2) {
      myV.y *= valorDeFriccionY;
      //para que no se enganche:
      myP.y = height-mySz/2;
    }
  }

  void drawMe() {
    noStroke();
    fill(r, g, b);
    ellipse(myP.x, myP.y, mySz, mySz);
  }
}




float gravedad, valorDeFriccionY, valorDeFriccionX;
int ballsSize = 15;
int rectangleX, rectangleWidth, rectangleHeight, velocidadRect, rectCenter;
boolean collision, collision1, collision2;
float startTime, currTime, s, r, g, bl, Y, rectangleY;
float hitTime;
//cremos ARRAYLIST para guardar las bolas
//sin necesidad de decidir a priori su nÃƒÂºmero
ArrayList<ball> bolas = new ArrayList();


//reloj de manillas//
PVector segundos = new PVector(0, 0);
PVector minutos = new PVector(0, 0);
PVector horas = new PVector(0, 0);


float angSegundos = 0;
float angMinutos = 0;
float angHoras = 0;

float radioSegundos = 100;
float radioMinutos = 60;
float radioHoras = 40;
/*float radioSegundos = 100;
float radioMinutos = 20;
float radioHoras = 20;*/

int hour = (hour())%12; //para que vaya de 0 a 12 y no de 0 a 24

//



void setup() {
  size(500, 500);
  //gravedad. De hecho, es un valor de aceleraciÃƒÂ³n.
  gravedad = 0.3;
  //y finalmente, un valor de fricciÃƒÂ³n, para ir desacelerando la bola a medida que  va tocando el suelo. 
  //Es el valor por el que multiplicaremos la velocidad de la misma.
  valorDeFriccionY = -0.6;
  valorDeFriccionX = -0.6;

  rectangleX = 200;
  rectangleY = 200;
  rectangleWidth = 100;
  rectangleHeight = 10;
  velocidadRect = 3;

  hitTime = 1;
  startTime = second();

  noStroke();
  fill(255, 0, 0);
}


void draw() {

  noStroke();
  fill(0, 20);
  rect(0, 0, 500, 500);

  rectCenter = rectangleWidth/2;

  colores();
  relojManillas();
  actualizarBolas();
  creaBolas();
  colisiones();
  actualizarCursor();
}


void relojManillas() {
  angSegundos = map(second(), 0, 60, PI, -PI);

  segundos.x = width/2 + radioSegundos*sin(angSegundos);
  segundos.y = height/2 + radioSegundos*cos(angSegundos);


  angMinutos = map(minute(), 0, 60, PI, -PI);

  minutos.x = width/2 + radioMinutos*sin(angMinutos);
  minutos.y = width/2 + radioMinutos*cos(angMinutos);

  angHoras = map(hour, 0, 12, PI, -PI);

  horas.x = width/2 + radioHoras*sin(angHoras);
  horas.y = width/2 + radioHoras*cos(angHoras);

  if (keyPressed) {
    if (key =='r') {
      stroke(255, 0, 0);
      strokeWeight(1);
      line(width/2, height/2, segundos.x, segundos.y);
      strokeWeight(2);
      line(width/2, height/2, minutos.x, minutos.y);
      strokeWeight(4);
      line(width/2, height/2, horas.x, horas.y);
    } 
    else {
      noStroke();
    }
  }
}

void colores() {
  r = map(second(), 0, 60, 0, 255);
  g =  map(minute(), 0, 60, 0, 255);
  bl =  map(hour(), 0, 24, 0, 255);

  Y = map(hour(), 0, 24, 50, 350);
}

void actualizarCursor() {

  //////CURSOR  //si clicamos
  if (mousePressed) {
    cursor(CROSS);
    rectangleX = mouseX-rectCenter;
    rectangleY = mouseY-rectangleHeight;
  } 
  else {
    noCursor();
  }
  //
}

void actualizarBolas() {
  for (int i=0;i<bolas.size();i++) {
    ball b = bolas.get(i);
    b.run();
  }
}


void creaBolas() {

  ballsSize = second()+5;
  s = second();
  float sec = map(second(), 0, 60, 1, 61);
  currTime = s-startTime;

  if (currTime >= hitTime) {
    //creamos una nueva bola
    ball b = new ball(ballsSize, r, g, bl); 
    //y la aÃƒÂ±adimos al Array
    bolas.add(b);
    startTime = s;
  }

  if (sec >= 60) {

    /*hitTime = 1;
     s = second();
     currTime = s-startTime;*/
    startTime = 0;
    bolas.clear();
  } 
  println("a"+startTime);
  println("a"+s);
}

//si clicamos una tecla
void keyPressed() {
  //si es ESPACIO, disparamos la bolas para arriba
  if (key==' ') {
    for (int i = 0; i<bolas.size(); i++) {
      ball b = (ball) bolas.get(i);  
      b.myV.x = random(-5, 5);
      b.myV.y = random(-8, -0.5);
    }
  } //Si es la C, eliminamos los objetos
  else if (key=='c') {
    bolas.clear();
  }
}

void colisiones() {

  noStroke();
  fill(0, 255, 0);

  rectangleX += velocidadRect;
  if ((rectangleX+rectangleWidth > width)||(rectangleX < 0)) {
    velocidadRect = -velocidadRect;
  }

  rectangleY = Y;

  rectangleWidth = minute()*2+10;
  rect(rectangleX, rectangleY, rectangleWidth, rectangleHeight);

  for (int i = 0; i<bolas.size(); i++) {
    ball b = (ball) bolas.get(i);
    collision = isCollidingCircleRectangle(b.myP.x, b.myP.y, ballsSize/2, rectangleX, rectangleY, rectangleWidth, rectangleHeight);
  
    if (collision == true) {
      b.myV.y *= valorDeFriccionY;
      //para que no se enganche:
      b.myP.y = rectangleY-ballsSize/2;
    }
  }
}

boolean isCollidingCircleRectangle(
float circleX, 
float circleY, 
float radius, 
float rectangleX, 
float rectangleY, 
float rectangleWidth, 
float rectangleHeight)
{
  float circleDistanceX = abs(circleX - rectangleX - rectangleWidth/2);
  float circleDistanceY = abs(circleY - rectangleY - rectangleHeight/2);

  if (circleDistanceX > (rectangleWidth/2 + radius)) { 
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) { 
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) { 
    return true;
  }
  if (circleDistanceY <= (rectangleHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
    pow(circleDistanceY - abs(rectangleHeight/2), 2);

  return (cornerDistance_sq <= pow(radius, 2));
}

