
///////////////////////////
/// Definir la classe  ////
///////////////////////////


class Immeuble {

  int colonnes; // indique le nombre de colonnes 
  float rangees;// indique le nombre de rangees
  float largeur_immeuble ;
  float hauteur_immeuble ;
  int PosX_immeuble ; // Position de l immeuble sur l axe des X
  int PosY_immeuble ;// Position de l immeuble sur l axe des Y
  color c; // couleur des immeubles 
  int c_; // couleur temporaire 
  int w,h;
  int timeSaved;





  ////////////////////////////////////
  ///  Constructeur de la classe  ////
  ////////////////////////////////////

  Immeuble () {


    posx_i = PosX_immeuble ;
    posy_i = PosY_immeuble ;
    timeSaved = millis()-5000;
  }

  void trace(int posx_i, int posy_i,int hi,int li, color c_, int r) {

    largeur_immeuble = w/6.66 ;
    hauteur_immeuble = w*2/6.66;
    w = 200; // Largeur                                  //////////////////////////////////
    h = 200; // hauteur                                 ///  Declaration des variables ///
    int PosX_immeuble =( posx_i-13);                   //////////////////////////////////  
    int PosY_immeuble = ((posy_i+4)-li);
    float largeurColonne = largeur_immeuble/colonnes;
    float hauteurRangee = hauteur_immeuble/4;
    c = c_;
    colonnes = 3;
    rangees = r;
    float timeEllapsed = (millis()-timeSaved)/20;
    float time = timeEllapsed*0.083;



    rectMode(CORNER);
    fill(c);
    stroke(0);                                                        /////////////////////////////////
    rect(PosX_immeuble,PosY_immeuble, w/100, (li+w*2/6.66));         ///// Dessiner les immeubles ////
    rect(PosX_immeuble-9,PosY_immeuble+9, w/10, (li+w*2/6.66));     /////////////////////////////////
    rect(PosX_immeuble-14,PosY_immeuble+11, w/6.66, (li+w*2/6.66));


    for( int i= 0; i < colonnes; i=i+1) {
      for( int j= 0; j < rangees; j=j+1) { 
        fill(255, 255, time % 255);                 ////////////////////////////////
        float x = i*largeurColonne;                //// Dessiner les fenetres /////
        float y = j*hauteurRangee;                ////////////////////////////////
        rect((x+PosX_immeuble-14)+2,(y+PosY_immeuble+11)+2, largeurColonne-4, hauteurRangee-4);
      }
    }
  }
}


