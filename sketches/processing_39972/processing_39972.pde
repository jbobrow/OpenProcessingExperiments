

class Dessins {
  String name;
  int xStart, yStart, xEnd, yEnd;
  int xMStart,yMStart; // positions de la souris en début de "drag"
  boolean run=true;
  int x,y; // valeurs courantes
  int what=0; // 0 : nothing, 1 : over, 2 : drag, 3 : end, 4 : back to start
  
  boolean enPlace=false;
  
  // Le constructeur par défaut de Java suffit !
  
  void create(String name, int xStart, int yStart, int xEnd, int yEnd) {
    this.name=name;
    this.xStart=xStart;
    this.yStart=yStart;
    this.xEnd=xEnd;
    this.yEnd=yEnd;
    x=xStart;
    y=yStart;
  } // fin create
  
  boolean over(int x, int y, int largeur, int hauteur) { //méthode interne
    return ((mouseX >= x) && (mouseX <= x + largeur) &&
        (mouseY >= y) && (mouseY <= y + hauteur));
  }
  
  void dessiner(int valeur) { 
     // Dessin de l'image
        copy(fond,xEnd,yEnd,LARGEURDESSIN,HAUTEURDESSIN,x,y,LARGEURDESSIN,HAUTEURDESSIN);
        if (valeur==1) { // "over"
          fill(0,0); // remplir avec une couleur transparente
          strokeWeight(6); // épaisseur
          stroke(#179886); // couleur de bordure
          rect(x,y,LARGEURDESSIN,HAUTEURDESSIN);
          strokeWeight(1); 
        } 
  }
  
  void dessinerCache() { 
    if (what!=3) {
        //fill(#179886); // bleu-vert pour l'intérieur du rectangle
        //rect(xEnd+XFOND,yEnd+YFOND,LARGEURDESSIN,HAUTEURDESSIN);
        image(interro,xEnd+XFOND,yEnd+YFOND);
    }
  }
  
  boolean top() { // "true" si image en place
    switch (what) {
      case 0: // "nothing"
        dessiner(0);
        
        if (run) {
          //test "over"
          if (over(xStart,yStart,LARGEURDESSIN,HAUTEURDESSIN)) {
            what=1; // "over"
          }
        }
        break;
        
      case 1: // "over"
        if (run) {
          dessiner(1);
        
          //test "over"
          if (over(xStart,yStart,LARGEURDESSIN,HAUTEURDESSIN)==false) {
            what=0; // "nothing"
          } 
        } else {
          what=0;
        }
        
        break;
        
      case 2: // "drag"
        if (run) {
          x=xStart+mouseX-xMStart;
          y=yStart+mouseY-yMStart;
          dessiner(0);
        } else {
          what=0;
          x=xStart;
          y=yStart;
        }
        break;
        
      case 3: // "end"
        // rien à faire ni cache ni rien
        break;
        
      case 4: // "back to start"
        // animation à faire plus tard !!!
        break;
        
    } // fin switch
        return (what==3);
        
  } // fin top
  
  void mPressed() {
    if (what==1) { //"over"
      xMStart=mouseX;
      yMStart=mouseY;
      what=2; // "drag"
    }
  }
  
  void mReleased() {
    if (what==2) { // "drag"
      if (x>xEnd-NOTFAR && x<xEnd+NOTFAR && y>yEnd-NOTFAR && y<yEnd+NOTFAR) { // l'image est presque en place
        what=3; } // "end"
      else {
        what=0; // "nothing"
        x=xStart;
        y=yStart;
      }
    }   
  }
  
  void stop() {
    run=false;
  }
  
  void go() {
    run=true;
  }
  
  boolean run() {
    return run;
  }

} // fin Dessins

