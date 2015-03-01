
//Melvin Jeovany Calderón Urbina.
//Conceptos de Arte Y tecnologías interactivas.
//Nov 2014

//INSTRUCCIONES:
//Mover el mouse.
//Click izq o Click der.

int a = 1;
int noFrame = 10;
int frame = 0;
PImage [] fotograma = new PImage[noFrame];
int nuFrame = 9;
int FRAME = 0;
PImage[] yfotograma = new PImage[nuFrame];
int nFrame = 5;
int Frame = 0;
PImage[] xfotograma = new PImage[nFrame];
float r;
int xx, yy;

void setup() {
  size(1200, 700);
  frameRate(5);


  //Primer Animación.
  fotograma[1] = loadImage("1.jpg");
  fotograma[2] = loadImage("2.jpg");
  fotograma[3] = loadImage("3.jpg");
  fotograma[4] = loadImage("4.jpg");
  fotograma[5] = loadImage("5.jpg");
  fotograma[6] = loadImage("6.jpg");
  fotograma[7] = loadImage("7.jpg");
  fotograma[8] = loadImage("8.jpg");
  fotograma[9] = loadImage("9.jpg");
  fotograma[0] = loadImage("10.jpg");
  //Segunda animación.

  yfotograma[0] = loadImage("0.jpg");
  yfotograma[1] = loadImage("01.jpg");
  yfotograma[2] = loadImage("02.jpg");
  yfotograma[3] = loadImage("03.jpg");
  yfotograma[4] = loadImage("04.jpg");
  yfotograma[5] = loadImage("05.jpg");
  yfotograma[6] = loadImage("06.jpg");
  yfotograma[7] = loadImage("07.jpg");
  yfotograma[8] = loadImage("08.jpg");
  //Tercer animación.
  xfotograma[0] = loadImage("001.jpg");
  xfotograma [1] = loadImage("002.jpg");
  xfotograma [2] = loadImage("003.jpg");
  xfotograma [3] = loadImage("004.jpg");
  xfotograma [4] = loadImage("005.jpg");
}

//
void draw() {
  a = a*3;



  imageMode(CORNER);
  r=random(100);

  println();


  //Primer animación, secuencia.
  frame++;
  if (frame == noFrame) {
    frame = 1;
  }

  background(#B92B2B+a*3);
  image(fotograma[frame], 0, 0, 600, 350);
  image(fotograma[frame], 600, 350, 600, 350);


  //Segunda animación, secuencia.

  FRAME++;
  if (FRAME == nuFrame) {
    FRAME = 1;
  }

  image(yfotograma[FRAME], 0, 350, 600, 350);
  image(yfotograma[FRAME], 600, 0, 600, 350);

  background(#B92B2B+a*3);

  //

  filter(THRESHOLD);
  //Click botoón mouse, derecho, izquierdo.

  if (mousePressed && (mouseButton == LEFT)) {
    background(r, #B92B2B+a*3);
    image(fotograma[frame], 0, 0, 600, 350);
    image(fotograma[frame], 600, 350, 600, 350);

    
 
  } else if (mousePressed && (mouseButton == RIGHT)) {
    background(r, #B92B2B+a*3);
    image(yfotograma[FRAME], 0, 350, 600, 350);
    image(yfotograma[FRAME], 600, 0, 600, 350);

    //segunda animación, secuencia.
    Frame ++;
    if (Frame == nFrame) {
      Frame = 1;
    }
  } else {


    background(r, #B92B2B+a*3);
    //Tercer animación, secuencia.
    Frame ++;
    if (Frame == nFrame) {
      Frame = 1;
    }
    xx = mouseX -25;
    yy = mouseY-25;
    image(xfotograma[Frame], xx, yy, 500, 250);
    }
    
  }

//Fin :3



