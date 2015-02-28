
PFont schrift;
String txt="";

void setup() {
  size(400, 400);
  smooth();
  schrift = loadFont("calibri.vlw");
  textFont(schrift);
}
void draw() {
  background(255);
  fill(0, 0, 0);
  text("Hello", 50, 50);
  fill(255, 0, 0);
  text("World!", 50, 100);
  fill(0, 0, 255);
  text(txt, 50, 150);
}

void keyPressed() {
  println(key);
  if ( key !=CODED&&key!=BACKSPACE) {
    txt=txt+key;
  }
  if ( key == BACKSPACE) {
    if (txt.length()>0) {
      txt = txt.substring(0, txt.length()-1);
    }
  }
}


