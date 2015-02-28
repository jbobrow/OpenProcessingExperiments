
//Classe de curseur horizontal valeur réelle
class Hslider
{
  int swidth, sheight;    // largeur et hauteur du curseur
  int xpos, ypos;         // positions de l'extrémité gauche de la barre du curseur
  int spos, newspos;    // x position du curseur
  float val,valMin,valMax,valPrec; //valeur associée à la position du curseur comprise entre valmin et valmax
  boolean over;           // is the mouse over the slider?
  boolean locked;
  String label;

  Hslider (int xp, int yp, int sw, int sh, String lb, float vMin, float vMax) {
    swidth = sw;
    sheight = sh;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2;
    newspos = spos;
    valMin = vMin;
    valMax = vMax;
    val = valMin + (spos-xpos)*(valMax-valMin)/swidth;
    valPrec = val;
    label=lb;
  }

  void update() {
    if(over()) {
      over = true;
    } else {
      over = false;
    }
    if(mousePressed && over) {
      locked = true;
    }
    if(!mousePressed) {
      locked = false;
    }
    if(locked) {
      newspos = rampe(mouseX, xpos, xpos+swidth);
    }
    if(abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/2;
      val = valMin + (spos-xpos)*(valMax-valMin)/swidth;
    }
  }

  int rampe(int xx, int xxMin, int xxMax) {
    return min(max(xx, xxMin), xxMax);
  }

  boolean over() {
    if(mouseX >= xpos && mouseX <= xpos+swidth &&
    mouseY >= ypos-sheight/2 && mouseY <= ypos+sheight/2) {
      return true;
    } else {
      return false;
    }
  }

  void draw() {
    rectMode(CENTER);
    stroke(0);
      line(xpos,ypos,swidth+xpos,ypos);
   for(int i=1;i<2;i++){
       stroke(163,105,211,200-100*(i-1));
      line(xpos,ypos+i,swidth+xpos,ypos+i);
      line(xpos,ypos-i,swidth+xpos,ypos-i);
    }
    if(over || locked) {
      fill(163,105,211,120);
      stroke(255,255,255);
    } else {
      stroke(163,105,211);
      fill(255,255,255);
      }
    rect(spos, ypos, sheight, sheight);
    fill(0);
    text(label,xpos,ypos-sheight);
    text(val,xpos,ypos+2*sheight);
    rectMode(CORNER);
  }

  float getVal() {
    // donne la valeur associée au curseur.
    return val;
  }
  boolean change() {
    if(valPrec!=val) {
       valPrec=val;return true;
    } else {
      return false;
    }
  }
}

