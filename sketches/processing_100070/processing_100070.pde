
/**
 * Countdown(Hex)
 * 
 */

PFont font;
String tx;
String tx2;
int cont;

void setup(){
  size(1000, 480);

  frameRate(1);
  background(0);
  smooth();
  textSize(360);
  cont = 255;
}

void draw(){
  background(0);
  tx2 = "0x";
  tx = hex(cont, 2);
  if(cont < 16){
    fill(255, 0, 0);
  }
  text(tx2+tx,50,400);
  if(cont > 0){
    cont -= 1;
  }
}
