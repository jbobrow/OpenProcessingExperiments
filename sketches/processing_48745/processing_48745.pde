
import controlP5.*;

ControlP5 controlP5;
Textfield myTextfield;

// VARIABLES //
int b;
int  tmpX;
int  tmpY;
boolean bover;

/*------------------------------
 SETUP
 ------------------------------*/
void setup() {
  size(500, 500);
  controlP5 = new ControlP5(this);
}

/*------------------------------
 DRAW
 ------------------------------*/

void draw() {
}
void mousePressed () {
  bover = false;
  tmpX = mouseX;
  tmpY = mouseY;
  if (mouseButton == RIGHT) {
    myTextfield = controlP5.addTextfield("comment"+b, tmpX, tmpY, 200, 20);
    int a = 1;
    b += a++;
    println(myTextfield.getTextList());
  }
}
void keyPressed() {
  if (keyCode == ENTER) {
    int a = 1;
    b += ((a++)-1);
    String title = ("text" + (b-1) + ".txt");
    saveStrings(title, myTextfield.getTextList());
  }
}


