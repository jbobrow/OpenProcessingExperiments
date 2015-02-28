

//-----------------------------------------------------------------------------------------------------
//                    CERCLES INTERACTIFS
//-----------------------------------------------------------------------------------------------------
        int maxCircles = 10;//nombre max de cercles que l'on peut créer
        //pour plus de précisions dans les movements de vitesse, on
        //définit les coordonnées en float au lien de int
        float[] xcircles = new float[maxCircles];//tableaux des positions des cercles
        float[] ycircles = new float[maxCircles];
        int[] dcircles = new int[maxCircles];//diamètre des cercles
        color[] ccircles = new color[maxCircles];
        float[] sXcircles = new float[maxCircles]; //vitesse en x
        float[] sYcircles = new float[maxCircles]; //vitesse en y

        int nCircles = 0;//index de la 1ere case libre dans le tableau

        Boolean startNewCircle=false;//vraie quand on commence un nouveau cercle

  SpinSpots fond[] = new SpinSpots [100];
  SpinSpots spots;   // définit les cercles par rapport à la class SpinSpots
  SpinArm arm;       // aiguille

void setup() {
  
  size (800,800);
  smooth ();
  
  arm = new SpinArm(width/2, height/2, 0.01);             // positionnement du point d'origine en x, en y, vitesse de rotation 
  spots = new SpinSpots(width/2, height/2, -0.004, 50);   // positionnement en x, en y, vitesse de rotation, taille des cercles
     
   for(int i=0; i<fond.length; i++){
    fond[i]= new SpinSpots (random(width), random(height), 50, 50);
  }  
}

void draw() {
 
  background(0,250,225);
  
  arm.update ();      // mise à jour de la vitesse de l'aiguille
  arm.display ();     // affiche "arm"
  spots.update ();    // mise à jour de la vitesse des cercles
  spots.display ();   // affiche "spots"
  
    for(int i=0; i<fond.length; i++){
      fond[i].update();
      fond[i].displayFond();   
    }
 
  arm.update ();      // mise à jour de la vitesse de l'aiguille
  arm.display ();     // affiche "arm"
  spots.update ();    // mise à jour de la vitesse des cercles
  spots.display ();   // affiche "spots"  
       
        for (int i=0; i<nCircles; i++) {
          stroke (0);
          fill(ccircles[i]);//applique sa couleur
          ellipse(xcircles[i], ycircles[i], dcircles[i], dcircles[i]); 
          moveCircle(i); //applique le mouvement  
        }
     
        if (startNewCircle){ //dessine le cercle en cours de création
          stroke (0);
          fill(255); //le nouveau en blanc
          ellipse(xcircles[nCircles], ycircles[nCircles], dcircles[nCircles], dcircles[nCircles]);
        }
  
  
}

