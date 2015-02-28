
//Classe de bouton
class Hbouton
{
  int width, height;// largeur et hauteur du bouton
  int xpos, ypos;     // positions du bouton
  boolean over;       // la souris est-elle sur le bouton ?
  boolean locked;     // le bouton est il ans l'état ON ?
  String label;  
  color couleurOn=color(169,111,217);
  color couleurOff=color(255,255,255);


  Hbouton (int xp, int yp, int sw, int sh, String lb) {
    width = sw;
    height = sh;
    xpos = xp;
    ypos = yp;
    label=lb;
    over=false;
    locked=false;
  }


  void draw() {
    rectMode(CORNER);
    if (over && !locked )
    {
      stroke(couleurOn);
      fill(couleurOn);
      rect(xpos, ypos, width, height);
      fill(couleurOff);
      text(label,xpos+width+10,ypos+height);
    }
    if (locked)
    {
      stroke(couleurOn);
      fill(couleurOn);
      rect(xpos, ypos, width, height);
      text(label,xpos+width+10,ypos+height);
    }
    if(!over && !locked){
      stroke(couleurOff);
      fill(couleurOff);
      rect(xpos, ypos, width, height);
     text(label,xpos+width+10,ypos+height);
    }
    }

}


