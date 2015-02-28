
PImage bg;
PImage MadMan;
PImage p1;
PImage p2;
PImage p3;
PImage p4;


int oneSec=0;
int threeSec=0;
int second=14947200;
int words=1;

float madManY=0;
float madManFinal=638;

PFont Helvetica;


void setup() {
  size(1280, 720);
  bg= loadImage("bg.jpg");
  MadMan=loadImage("madmen.png");

  p1=loadImage("01.png");
  p2=loadImage("02.png");
  p3=loadImage("03.png");
  p4=loadImage("04.png");

  Helvetica=loadFont("HelveticaNeue-Bold-30.vlw");
  frameRate(30);
}


void draw() {

  image(bg, 0, 0);


  if (oneSec<31)
  {
    oneSec++;
    println(oneSec);
  }
  else {
    oneSec=0;
    second--;
  }

  if (threeSec<31*3)
  {
    threeSec++;
  }
  else {
    threeSec=0;
    words++;

    if (words==5) {
      words=1;
    }
  }

  if (words==1) {

    image(p1, 0, 0 );
  }

  if (words==2) {

    image(p2, 0, 0 );
  }

  if (words==3) {

    image(p3, 0, 0 );
  }

  if (words==4) {

    image(p4, 0, 0 );
  }

  fill(255);
  textFont(Helvetica);
  text(second, 46, 648 );

  fill(240, 46, 37);
  textFont(Helvetica);
  text("SEC", 200, 648 );


  image(MadMan, 0, madManY );
  madManY+=madManFinal/(14947200*30);
}



