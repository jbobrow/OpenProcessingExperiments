
/*Nuit de l'info 2012
 DENAUX Robin - équipe XID de l'ENSISA
 Défis processing de Polytech Grenoble
 
 Programme de démonstration de ce que j'ai cherché à créer : la partie liaison avec la base de données a été abandonnée, 
 et remplacée par la création de sites touristiques aléatoires.
 La carte montre les regroupements de lieux qui intéressent l'utilisateur, selon ses propres critères. 
 */
 
 
  lieu[] lieu = new lieu[300];
  int valeur0=3,valeur1=3,valeur2=3,valeur3=3,valeur4=3;
  PImage carte, nature, monuments, loisirs, spectacles, culturels;


//***********************setup***************************
void setup(){
  carte = loadImage("carte.png");
  nature = loadImage("nature.png");
  monuments = loadImage("monuments.png");
  loisirs = loadImage("loisirs.png");
  spectacles = loadImage("spectacles.png");
  culturels = loadImage("culturels.png");
  size(500, 516+30);
 
  noLoop();
  
  //création des lieux
  for(int i=0; i<300; i++)
    lieu[i] = new lieu();
  
}//setup


//***********************draw***************************
void draw(){
  //affichage des boutons et de la carte
  image(carte,0,0);
  image(monuments,0,516);
  image(loisirs,100,516);
  image(spectacles,200,516);
  image(culturels,300,516);
  image(nature,400,516);
  
  //affichage des cercles
      int valeur = 0;
      for(int j = 0; j<300; j++){
        lieu[j].setValeur();
        strokeWeight(0);
        fill(40*lieu[j].valeur,0,0, 20*lieu[j].valeur);
        ellipse(lieu[j].X, lieu[j].Y, 20, 20);
    }

//fond des boutons
  fill(30*valeur0,0,0,80); rect(0,516,100,30);
  fill(30*valeur1,0,0,80); rect(100,516,100,30);
  fill(30*valeur2,0,0,80); rect(200,516,100,30);
  fill(30*valeur3,0,0,80); rect(300,516,100,30);
  fill(30*valeur4,0,0,80); rect(400,516,100,30);
}//draw


//***********************classe lieu***************************
class lieu{
  int X, Y, valeur, type;
  
  lieu(){
  X = (int)random(150, 400);
  Y = (int)random(100, 400);
  type = (int)random(5); 
  }
  
  //mise à jour de la valeur de chaque lieu avant de les redessiner
  void setValeur(){
    if(type == 0) valeur = valeur0;
    if(type == 1) valeur = valeur1;
    if(type == 2) valeur = valeur2;
    if(type == 3) valeur = valeur3;
    if(type == 4) valeur = valeur4;
  }
  
}//lieu


//***********************souris***************************
void mousePressed() {
  //détection du bouton cliqué et modification de la valeur associée
  if(mouseY>516&&mouseX;/100==0) 
    if(valeur0==4) valeur0 = 0;
    else valeur0++;
  if(mouseY>516&&mouseX;/100==1) 
    if(valeur1==4) valeur1 = 0;
    else valeur1++;
  if(mouseY>516&&mouseX;/100==2) 
    if(valeur2==4) valeur2 = 0;
    else valeur2++;
  if(mouseY>516&&mouseX;/100==3) 
    if(valeur3==4) valeur3 = 0;
    else valeur3++;
  if(mouseY>516&&mouseX;/100==4) 
    if(valeur4==4) valeur4 = 0;
    else valeur4++;
  redraw();
}//pousePressed
