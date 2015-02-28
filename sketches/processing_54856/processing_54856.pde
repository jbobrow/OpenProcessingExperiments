
Botty bot1;
Botty bot2;
Botty bot3;

float interval;
float spacer;

float r = 400.0;
float angle = 0.0;
float speed = 0.01;


void setup ()
{
  size(800, 500);
  smooth(); 
  strokeCap(SQUARE);
  colorMode(RGB);
  spacer = width*2; 

  interval = width/4.0;

  bot1 = new Botty(150);
  bot2 = new Botty(400);
  bot3 = new Botty(650);
}

void draw ()
{

  background(255);


  bot1.neck();
  bot1.head();
  bot1.facebuttons();
  bot1.antenna();
  bot1.update();


  bot2.neck();
  bot2.head();
  bot2.facebuttons();
  bot2.antenna();
  bot2.update();

  bot3.neck();
  bot3.head();
  bot3.facebuttons();
  bot3.antenna();
    bot3.update();
}


