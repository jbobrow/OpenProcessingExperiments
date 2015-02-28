
PImage bg;
PImage MadMan;

int oneSec=0;
int second=20;

float madManY=0;
float madManFinal=638;

PFont Helvetica;


void setup() {
  size(1280, 720);
  bg= loadImage("bg.jpg");
  MadMan=loadImage("madmen.png");
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


  fill(255);
  textFont(Helvetica);
  text(second, 46, 648 );

  fill(240, 46, 37);
  textFont(Helvetica);
  text("SEC", 200, 648 );


  image(MadMan, 0, madManY );
  madManY+=madManFinal/(10*30);
}








