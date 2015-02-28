
ArrayList newTextPnt = new ArrayList();
ArrayList sentences = new ArrayList();

import controlP5.*;
ControlP5 controlP5;

Textfield myTextfield;

int boxSize = 100;
int textCol = 100;
int b;
boolean bover = false;


void setup() {
  size(1200, 500);
  controlP5 = new ControlP5(this);
  myTextfield = controlP5.addTextfield("comment", 100, 400, 200, 20);
  myTextfield.keepFocus(true);
}

void keyPressed(){
  if(keyCode == ENTER){
    int a = 1;
    b += a++;
    println(b);
    String Words = join(myTextfield.getTextList(),(" , "));
    String [] WordsI = (myTextfield.getTextList());
    sentences.add(new String (Words));
    saveStrings("word" + b + ".txt", WordsI);
  }
}

void draw() {
  background(0);
  for(int i = 0;i<sentences.size();i++){
    String newSentence = (String) sentences.get(i);
    if (bover) {
      
      for (int j = 0; j < newTextPnt.size(); j++) {
        PVector newPnt = (PVector) newTextPnt.get(j);
        ellipse(newPnt.x, newPnt.y, 2, 2);
        fill(250);
        int distParam = int (dist(mouseX, mouseY, newPnt.x, newPnt.y));
        if (distParam < 20) {
          pushStyle();
          text(newSentence, newPnt.x, newPnt.y, boxSize, boxSize);
          fill(textCol);
          popStyle();
        }
      }
    }
  }
}

void mouseReleased() {
  bover = true;
  int tmpX = mouseX;
  int tmpY = mouseY;
  newTextPnt.add(new PVector(tmpX, tmpY));
}

