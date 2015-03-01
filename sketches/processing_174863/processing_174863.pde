


int X=0;
int Y=0;
int X2=0;
int X3=0;
int speed=2;
int velX=0;
int velY=0;
PImage fondo;
PImage fondo2;
PImage fondo3;
PImage spriteSheet;
PImage[] WalkLeft;
PImage[] WalkRight;
float counter=0;
float counter2=0;
int posY;
int posX;
int static1=1;
boolean static2;
float small[]=new float[100];
float small2[]=new float[100];
float small3[]=new float[100];
float small4[]=new float[100];


void setup() {
  size(600, 200);
  posX=width/2;
  posY=146;
  fondo = loadImage("fondo2.jpg");
  fondo2 = loadImage("fondo2.jpg");
  fondo3 = loadImage("fondo2.jpg");
  spriteSheet = loadImage("dot.png");
  WalkLeft = new PImage[6];
  WalkRight = new PImage[6];
  for (int j=0; j<small.length; j++) {
    small[j]=random(-500, 30);
    small2[j]=random(-1926,-1400);
    small3[j]=random(900,1500);
    small4[j]=random(2350,2950);
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
  if (static1==1) {
    image(WalkLeft[1], posX, posY);
  }
  if (static1==2) {
    dibujar();
  }
  if (static1==4) {
    image(WalkRight[1], posX, posY);
  }
  if (static1==3) {
    dibujar2();
  }

}
  


void dibujar() {


  if (counter>=1&&counter<=2) {
    image(WalkLeft[1], posX, posY);
  }
  if (counter>2&&counter<=3) {
    image(WalkLeft[2], posX, posY);
  }
  if (counter>3&&counter<=4) {
    image(WalkLeft[3], posX, posY);
  }
  if (counter>4&&counter<=5) {
    image(WalkLeft[4], posX, posY);
  }
  if (counter>5||counter<1) {
    image(WalkLeft[5], posX, posY);
  }

  if (counter>5) {
    counter =0;
  }
}


void dibujar2() {
  if (counter2>=1&&counter2<=2) {
    image(WalkRight[1], posX, posY);
  }
  if (counter2>2&&counter2<=3) {
    image(WalkRight[2], posX, posY);
  }
  if (counter2>3&&counter2<=4) {
    image(WalkRight[3], posX, posY);
  }
  if (counter2>4&&counter2<=5) {
    image(WalkRight[4], posX, posY);
  }
  if (counter2>5||counter2<1) {
    image(WalkRight[5], posX, posY);
  }
  if (counter2>5) {
    counter2 =0;
  }
}



void keyPressed() {

  if (key == CODED) {
    if (keyCode == LEFT) {
      counter+=0.9;
      velX=speed;
      static1=2;
    }
    if (keyCode == RIGHT) {
      counter2+=0.9;
      velX=-speed;
      static1=3;
    }
  }
}

void keyReleased() {

  if (key == CODED) {
    if (keyCode == LEFT) {
      velX=0;
      static1=1;
    }
    if (keyCode == RIGHT) {
      velX=0;
      static1=4;
    }
  }
}




