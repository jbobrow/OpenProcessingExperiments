
  SpinSpots fond[] = new SpinSpots [100];
  SpinSpots spots;   // définit les monstres par rapport à la class SpinSpots
  SpinArm arm;       // petit monstre

void setup() {
  
  size (600,600);
  smooth ();
  
  arm = new SpinArm(width/2, height/2, 0.01);             // positionnement du point d'origine en x, en y, vitesse de rotation 
  spots = new SpinSpots(width/2, height/2, -0.004, 50);   // positionnement en x, en y, vitesse de rotation, taille des monstres
     
   for(int i=0; i<fond.length; i++){
    fond[i]= new SpinSpots (random(width), random(height), 50, 50);
}}

void draw() {
 
  background(30,240,0);
  
  arm.update ();      // met à jour la vitesse du petit monstre
  arm.display ();     // affiche "arm"
  spots.update ();    // met à jour la vitesse des monstres
  spots.display ();   // affiche "spots"
  
    for(int i=0; i<fond.length; i++){
      fond[i].update();
      fond[i].displayFond();   
 }
 
  arm.update ();      // met à jour la vitesse du petit monstre
  arm.display ();     // affiche "arm"
  spots.update ();    // met à jour la vitesse des monstres
  spots.display ();   // affiche "spots"  
       
}

