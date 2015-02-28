
class bar2 {
  int len;
  int wid;
  int posX;
  int posY;
  int label;
  int shade;
  String name;
 
  
  // define bar constuctor
  bar2 (int tempLen, int tempWid, int tempPosX, int tempPosY, int tempLabel, int tempShade, String tempName) {
    len = tempLen;
    wid = tempWid;
    posX = tempPosX;
    posY = tempPosY;
    label = tempLabel;
    shade = tempShade;
    name = tempName;
  }

  void display() {
    fill (color_shade [shade]);
    rect (posX, posY, len, wid);
    fill (0);
    textAlign(CENTER, CENTER);
    textFont(fontA, 11);
    if (label != 0) {text(label, posX + len/2, posY + wid/2);}
    if ((mouseX > posX) && (mouseX < posX + len) &&
         (mouseY > posY) && (mouseY < posY + wid)) {
       fill (color_shade [shade]);
       rect (posX, posY, len, wid);
       fill (255);
       text(name + " " + label, posX + len/2, posY + wid/2);
     } 
  } 

}

