
/*==============================================================
  Philippe Tardif
  Algorithmie de base et interactivité EDM4600-50
  Simulation - TP3
  
  Des soldats sont largués sur une ville pour en prendre possesion. Vous devez tirer les ennemis avant qu'il ne touche le sol.
  Utiliser la souris pour viser vos ennemis et cliquer pour tirer
  
  Inspirations:
  - Invasion:http://www.openprocessing.org/visuals/?visualID=17044
  - Le jeu de iPhone : Kaboom paratrooper
  
  Remerciement:-Justin Leduc
//============================================================= */

//Déclarations des variables globales
PImage bg;
PImage curseur;

ArrayList paratrooper;

float posX;
float posY;
float rdVitesse;
float vitesseChute;

int temps;
int type;

void setup(){
  
  size(400,400);
  smooth();
  noCursor();
  
  bg=loadImage("data/fond.png");
  curseur=loadImage("data/curseur.png");
 
  paratrooper = new ArrayList();
 
  temps = millis();
}
//=========================================================================
// Fonction qui dessine le background et les paratroopers
//=========================================================================
void draw(){
  background(bg);
  
  //================================================================
  //Condition qui ajoute à l'ArrayList un instance de Paratrooper
  //================================================================
  if ( millis() - temps >2000) {
    temps =  temps +2000;
    type=round(random(1,3));
    posX=random(width/2+100);
    posY=random(-200,0);
    rdVitesse=random(0.004, 0.008); 
    paratrooper.add(new Paratrooper(type,posX, posY, QUARTER_PI/7, rdVitesse));// Crée un nouveau paratrooper
 }
 //===============Donne une vitesse de chute aléatoire au paratrooper et le dessine=========================
  for ( int n = 0; n < paratrooper.size();n++ ) {
   Paratrooper p = (Paratrooper) paratrooper.get(n);
   vitesseChute=random(0.3, 0.5); 
   p.parachute(vitesseChute);
   }
 image(curseur,mouseX,mouseY);//Curseur
 
}

//========================Lors du clic sur un paratrooper, il est supprimer==================================
  void mousePressed(){
    for(int i=paratrooper.size()-1; i>=0;i--){
      Paratrooper p = (Paratrooper) paratrooper.get(i);
      
      // Si l'utilisateur clique sur un paratrooper, il est ôter de l'interface
      if ( mouseX>p.positionX && mouseX<(p.positionX+36) && mouseY>(p.positionY) && mouseY<(p.positionY+60) && mouseY<=320){
         paratrooper.remove(i);//ôte le paratrooper cliquer 
      }  
    }
   
  }


