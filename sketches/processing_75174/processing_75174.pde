
int X = 0;
int Yspeed= 10;

PFont font;
String txt = "fall down";


void setup() {
  size(300, 600, P2D);
  smooth(5);

  font = loadFont ("ACaslonPro-Bold-50.vlw");
  textFont (font);
}


void draw() {
  background(200);

  fill(230);
  textSize(20);
  text(txt, X, Yspeed);

  Yspeed = Yspeed + 2;
  
  if (Yspeed > 600){
    Yspeed = 0;
  }
}
