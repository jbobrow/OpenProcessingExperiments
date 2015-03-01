
/*Codigo creado y modificado por Daniel Becerra
SpriteSheet vía http://www.openprocessing.org/sketch/92231
Imagen de fondo creada por Daniel Becerra
*/

int X=0;
int Y=0;
int X2=0;
int X3=0;
int velocidad=2;
int velX=0;
int velY=0;
PImage fondo;
PImage fondo2;
PImage fondo3;
PImage spriteSheet;
PImage[] WalkLeft;
PImage[] WalkRight;
float contador=0;
float contador2=0;
int posY;
int posX;
int estatico=1;
boolean estatico2;
float strokeStar = 1;
float strokeStarChange = .32;
float peque[]=new float[100];
float peque2[]=new float[100];
float peque3[]=new float[100];
float peque4[]=new float[100];
void setup() {
  size(600, 267);
  posX=width/2;
  posY=146;
  fondo = loadImage("fondo2.jpg");
  fondo2 = loadImage("fondo2.jpg");
  fondo3 = loadImage("fondo2.jpg");
  spriteSheet = loadImage("sprites_map_claudius.png");
  WalkLeft = new PImage[6];
  WalkRight = new PImage[6];
  for (int j=0; j<peque.length; j++) {
    peque[j]=random(-500, 30);
    peque2[j]=random(-1926,-1400);
    peque3[j]=random(900,1500);
    peque4[j]=random(2350,2950);
  }
}

void draw() {
  image(fondo, X, Y);
  image(fondo2, X2, Y);
  image(fondo3, X3, Y);
  X=X+velX;
  X2=X-1444;
  X3=X+1444;
  if (X2>0) {
    X=0;
  }
  if (X3<0) {
    X=0;
  }
  for ( int i = 0; i < 6; i++)
  {
    WalkLeft[i] = spriteSheet.get(i*32, 65, 32, 64);
  }
  for ( int i = 0; i < 6; i++)
  {
    WalkRight[i] = spriteSheet.get(i*32, 194, 32, 64);
  }
  if (estatico==1) {
    image(WalkLeft[1], posX, posY);
  }
  if (estatico==2) {
    dibujar();
  }
  if (estatico==4) {
    image(WalkRight[1], posX, posY);
  }
  if (estatico==3) {
    dibujar2();
  }

  estrellas();
}

void estrellas() {
  randomSeed(0);
  int anochecer=X+50;
  constrain(anochecer, 0, width);
  strokeWeight(strokeStar);
  stroke(245);
  for (int j=0; j<peque.length; j++) {
    point(peque[j], random(130));
     point(peque2[j], random(130));
     point(peque3[j], random(130));
     point(peque4[j], random(130));
    peque[j]+=velX;
    peque2[j]+=velX;
    peque3[j]+=velX;
    peque4[j]+=velX;
    strokeStar = strokeStar + strokeStarChange;
    if ((strokeStar>3) || (strokeStar<1)) {
      strokeStarChange = strokeStarChange * -1;
    }
  }
  
  
}



void dibujar() {


  if (contador>=1&&contador<=2) {
    image(WalkLeft[1], posX, posY);
  }
  if (contador>2&&contador<=3) {
    image(WalkLeft[2], posX, posY);
  }
  if (contador>3&&contador<=4) {
    image(WalkLeft[3], posX, posY);
  }
  if (contador>4&&contador<=5) {
    image(WalkLeft[4], posX, posY);
  }
  if (contador>5||contador<1) {
    image(WalkLeft[5], posX, posY);
  }

  if (contador>5) {
    contador =0;
  }
}


void dibujar2() {
  if (contador2>=1&&contador2<=2) {
    image(WalkRight[1], posX, posY);
  }
  if (contador2>2&&contador2<=3) {
    image(WalkRight[2], posX, posY);
  }
  if (contador2>3&&contador2<=4) {
    image(WalkRight[3], posX, posY);
  }
  if (contador2>4&&contador2<=5) {
    image(WalkRight[4], posX, posY);
  }
  if (contador2>5||contador2<1) {
    image(WalkRight[5], posX, posY);
  }
  if (contador2>5) {
    contador2 =0;
  }
}



void keyPressed() {

  if (key == CODED) {
    if (keyCode == LEFT) {
      contador+=0.9;
      velX=velocidad;
      estatico=2;
    }
    if (keyCode == RIGHT) {
      contador2+=0.9;
      velX=-velocidad;
      estatico=3;
    }
  }
}

void keyReleased() {

  if (key == CODED) {
    if (keyCode == LEFT) {
      velX=0;
      estatico=1;
    }
    if (keyCode == RIGHT) {
      velX=0;
      estatico=4;
    }
  }
}



