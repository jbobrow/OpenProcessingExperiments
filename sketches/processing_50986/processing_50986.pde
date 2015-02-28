
/* 

UQÀM - 2012

 MONSTRE
 par
 Ugo Magrini

EDM4600 - Algorithmie de base et intéractivité


--------------------------------------------------------------*/

// Declaration des variables
float x, v, r, bouche;


//Début du projet-----------------------------------------------
void setup()  {
  size(400,400);            //scène
  background(255,255,255);  //couleur de la scène

 x = 199;                   //valeur 1
 v = 50;                    //valeur 2

}


// Propriétés du dessin-----------------------------------------
  void draw() {
     smooth();              //antialiasing
     r = 160;               //valeur utilisé pour les dents de la bouche
     bouche = mouseY;       //valeur y de la souris pour intéraction
     
//cell ---------------------------------------------------------
  noStroke();               //pas de ligne
  fill(20,100,255);         //couleur du cell
  rect(x-v, 2*v, 2*v,x );//forme rectangulaire du cell
  
  
// antenne------------------------------------------------------
  rect(x+20,v+30,20,30);   //rectangle de l'antenne
  
  
// Écran--------------------------------------------------------
  fill(230);
  stroke(0,0,0);           //couleur de la ligne
  strokeWeight(2);         //largeur de la ligne de pourtour de l'écran
  rect(x-v+8, 2*v+8, 2*v-16,v+8);  
  
  
// oeil droit---------------------------------------------------
  stroke(0,0,0);
  strokeWeight(2); 
  fill(255,255,255);
  arc(x+22,x-26, v-8,30, 0, PI); //demi-cercle qui cert à faire l'oeil
  line(x+02,x-26,x+44, x-26);
  
  //pupille
  fill(0,0,0);
  arc(x+22,x-26, 10,10, 0, PI);
  
  //cerne
  noFill();
  arc(x+22,x-26, 40,40, 0, PI);
  
  
// oeil gauche--------------------------------------------------
  stroke(0,0,0);
  strokeWeight(2); 
  fill(255,255,255);
  arc(x-22,x-26, v-8,30, 0, PI);
  line(x-02,x-26,x-44, x-26);
  
  //pupille
  fill(0,0,0);
  arc(x-22,x-26, 10,10, 0, PI);
  
  //cerne
  noFill();
  arc(x-22,x-26, 40,40, 0, PI);
  
  
//bouche--------------------------------------------------------
  fill(200,240,255); //pour ca je me suis inspiré des notes données en cours (http://wiki.t-o-f.info/Processing/Boucle)
  rect(x-40,x+9,80,82);
  while ( r < x+40 ) { 
  line(r,x+10,r,x+90); 
  r = r + 20; 
  }
  
  //Intéractions  
  fill(0);
  rect(x-40,x+40,v+30, bouche/9);

 
//nez-----------------------------------------------------------
   strokeWeight(3);
   point(x+6,x+2);
   point( x-6,x+2);
   

//Bras----------------------------------------------------------
strokeWeight(12);
stroke(20,100,255); 
line(x-v, 5*v, x-2*v-10,5*v+15);
line(x+v, 5*v, x+2*v+10,5*v+15);


//Jambes + Pieds------------------------------------------------

//gauche
line(x-20,2*v+x,x-10,3*v+x);
line (x-10,3*v+x, x-30,3*v+x);

//droit
line(x+20,2*v+x,x+10,3*v+x);
line(x+10,3*v+x, x+30, 3*v+x);
}                
