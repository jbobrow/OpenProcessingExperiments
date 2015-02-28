
class Bouton
{
//............................Paramètre superClasse...............................
  color couleurBouton ; color couleurONoff ;
  int mGB, mHB, lB, hB , etatBouton;
  Bouton (  int margeGaucheB, int margeHautB, int longueurB, int hauteurB ) 
  {
    mGB =  margeGaucheB ; mHB = margeHautB ; lB = longueurB ; hB = hauteurB ;
  }
    
  boolean jouerBouton = false ; boolean dedansBouton = false ;
  
//.....................................Détection survole carré.............................
  boolean detectionCercle() {
    
    float disX = mGB - mouseX  ; 
    float disY = mHB - mouseY  ; 
    if (sqrt(sq(disX) + sq(disY)) < lB/2 )
    {
      return true;
    } else {
      return false; 
    }
  }  
//.......................................Le Clic..........................................  
  void mousePressed () 
  {
    if ( detectionCercle() ) {
      dedansBouton = true ;
      if ( jouerBouton ) {
        jouerBouton = false ;
        etatBouton = 0 ;
        println ("OFF") ;
      } else {
        jouerBouton = true ;
        etatBouton = 1 ;
        println ("ON") ;  
      }
    }
  }
//............................................................................................  
}
//::::::::::::::::::::::::::::::::::::::::::::::LES BOUTONS:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

class Simple extends Bouton
{
  color cBINonBO, cBOUTonBO, cBINoffBO, cBOUToffBO, cBEinBO, cBEoutBO ;
  
  Simple (  int mGB,  int mHB, int lB, int hB, 
            color BoutonINonBO, color BoutonOUTonBO, color BoutonINoffBO, color BoutonOUToffBO,
            color BoutonEnsembleINBO, color BoutonEnsembleOUTBO)                  
 {
   super(mGB, mHB, lB, hB) ;
   cBINonBO = BoutonINonBO ; cBOUTonBO = BoutonOUTonBO ; cBINoffBO = BoutonINoffBO ; cBOUToffBO = BoutonOUToffBO ;
   cBEinBO = BoutonEnsembleINBO ; cBEoutBO = BoutonEnsembleOUTBO ;
 }
//......................................ELLIPSE.............................................
 void boutonCercle ()
 {
   if ( jouerBouton ) {
     if ( detectionCercle() ) {
       dedansBouton = true ;
       couleurONoff = cBINonBO ;
       println ( "dedans vert" ) ;
     } else {
       couleurONoff = cBOUTonBO ;
       println ( "dehors vert" ) ;
     }
   } else {
       if ( detectionCercle() ) {
       dedansBouton = true ;
       couleurONoff = cBINoffBO ;
       println ( "dedans rouge" ) ;
     } else {
       couleurONoff = cBOUToffBO ;
       println ( "dehors rouge" ) ;
     }
   }
   fill(couleurONoff) ; noStroke() ;
   ellipse(mGB, mHB, lB, hB) ;
 }
//.........................................................................................
  int getEtat() { // nom de variable et () permet de récupérer les données d'un return
  return etatBouton ;
    
  }
}

