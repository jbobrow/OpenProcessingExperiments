
// Fonction (méthode supplémentaire de PApplet)
boolean mouseOver(int x, int y, int largeur, int hauteur) {
  return ((mouseX >= x) && (mouseX <= x + largeur) &&
      (mouseY >= y) && (mouseY <= y + hauteur));
}

class Bouton {
  int x,y;
  String nom;
  int etat; // 0 : normal, 1 : over, 2 : pressed, 3 : action, 4:invisible et inactif
  boolean debug=false;
  
  PImage imageBouton;
  int DECALAGE=5;
  
  Bouton(String nom, int x, int y, PImage imageBouton, boolean visible) {
    this.nom=nom;
    this.x=x;
    this.y=y;
    this.imageBouton=imageBouton;
    if (visible) {
      etat=0; // repos et actif
    } else {
      etat=4; // invisible et inactif
    } //fin if else
  } // fin constructeur
    
  void debugON() {
    debug=true;
  }
  
  void debugOFF() {
    debug=false;
  }
  
  void mPressed() {
    if (etat==1) { // over
      etat=2;
    }
  }
  
  void mReleased() {
    if (etat==2) { // pressed
      etat=3; // action
    } else { // etat==3 ! 
      etat=1; // over
    }
  }
  
  void show() {
    etat=0;
  }
  
  void hide() {
    etat=4;
  }
  
  boolean top() {
    boolean retour=false;
    switch (etat) {
      case 0: // repos
        if (over()){
          etat=1;
          afficheOver();
          debugOver();
        } else {
          afficheRepos();
        }
        break;
      case 1: // over
        if (over()) {
          afficheOver();
          debugOver();
        } else {
          afficheRepos();
          etat=0;
        }
        break;
      case 2: // pressed
        affichePressed();
        debugPressed();
        break;
      case 3: // action
        affichePressed();
        retour=true;
        etat=1; // over 
        break;
      case 4: // invisible
        // ne rien faire
        break;
    } // fin switch
    return retour;
  } // fin top()

  void debugOver() {
    if (debug) {
      println(nom+" : over");
    }
  }
  
  void debugPressed() {
    if (debug) {
      println(nom+" : pressed");
    }
  }
  
    boolean over() {
      return mouseOver(x,y,imageBouton.width,imageBouton.height);
    }
    
    void afficheRepos() {
      image(imageBouton,x,y);
    }
    
    void afficheOver() {
      afficheRepos();
    }
    
    void affichePressed() {
      image(imageBouton,x+DECALAGE,y+DECALAGE);
    }

} // Fin Bouton
  
  class GUI {
    Bouton[] lesBoutons;
    boolean visible;
    String nom;
    boolean debug=false,mReleased=false;
    
    GUI(String nom,boolean visible){
      this.visible=visible;
      this.nom=nom;
      lesBoutons=new Bouton[0];
    }
    
    void createBouton(String nom,PImage imageBouton,int x,int y) {
      lesBoutons = (Bouton[]) append(lesBoutons,new Bouton(nom,x,y,imageBouton,visible));
      if (debug) {
        println("Bouton n°"+lesBoutons.length+"("+nom+") Crée !");
      }
    }
    
    void mPressed() {
      for (int i=0;i<lesBoutons.length;i++) {
        lesBoutons[i].mPressed();
      }
    }
    
    void mReleased() {
      for (int i=0;i<lesBoutons.length;i++) {
        lesBoutons[i].mReleased();
        mReleased=true;
      }
    }
    
    void show() {
      for (int i=0;i<lesBoutons.length;i++) {
        lesBoutons[i].show();
      }
    }
    
    void hide() {
      for (int i=0;i<lesBoutons.length;i++) {
        lesBoutons[i].hide();
      }
    }
    
    int top() { // Renvoi 0 si pas d'action et le n° du bouton si action et -1 si clic sur rien
      int retour=0;
      for (int i=1;i<=lesBoutons.length;i++) {
        if (lesBoutons[i-1].top()) {
          retour=i;
        }
      }
      if (retour==0 && mReleased) {
        retour=-1;
      }
      mReleased=false;
      return retour;
    } // fin top()
    
    void listage() {
      for (int i=1;i<=lesBoutons.length;i++) {
        println("GUI : "+nom+", Bouton : n°"+i+"("+lesBoutons[i-1]);
      }
    }
/*    
    void debugON() {
      debug=true;
      <pour tous les boutons : debugON>
    }
    
    void debufOFF() {
      <similaire à debugON>
    } */
    
  } // fin GUI

