
/* ************************************************************************************
   Exercice de Kim Guilbault
   Travail de rattrapage dans le cours EDM4600  
   Boutons et Boucles
********************************************************************************************* */

//Variables globales d'état
boolean etatCercle = false;
boolean etatCarre = false;

//Variables globales d'incrémentation
int incrementation; //Carré 
float incrementationCercle;

//Déclaration des variables pour le rectangle
int rectX;
int rectY;
int rectDiametre = 50;

//Déclaration des variables pour les lignes
int lineY;

//Déclaration des variables pour l'ellipse
float distance;
int ellipseX = (width/2) + 100;
int ellipseY = 200;
int ellipseDiametre = 50;

//Rayons de l'ellipse
int nombreDeRayons = 20;
int longueurRayons = 60;


void setup(){
  size(400,400);
  smooth();

  //Coordonnées du rectangle
  rectX = (width/2) + 75;
  rectY = (height/2) - (rectDiametre/2);
}


void draw(){
   background(100,100,100);//Gris
   fill(0,255,0);//Vert
   
   
// ------------------------------------------------------CARRÉ-------------------------------------------------------------------//
  //Vérification état du carré
  if ( etatCarre == true ) {
    
    //Dessine la forme en rose
    fill(255,0,255);//rose
    
    //Dessine les lignes
    lineY=0;
    while (lineY < incrementation){
      stroke(0);
      strokeWeight(6);
      line(0,lineY,width,lineY); 
      lineY = lineY + 15;
    }
    //Si les lignes dépassent la hauteur de la scène, on arrête d'en dessiner
    if(lineY > height)
    {
      incrementation = incrementation;
    }
    //Sinon, on incrémente
    else{
      incrementation = incrementation + 2;
    }
  }
  //Si l'état est à false
  else {
    fill(0,255,0);//vert
    
    lineY=0;
    while (lineY < incrementation){
      stroke(0);
      strokeWeight(6);
      line(0,lineY,width,lineY); 
      lineY = lineY + 15;
    }
    if(lineY < 0){
      incrementation = incrementation;
    }
    else if (incrementation > 0){
      incrementation = incrementation - 2;
    }
  }
  //Dessiner le carré
  noStroke();
  rect(rectX,rectY, rectDiametre,rectDiametre);


//------------------------------------------------CERCLE--------------------------------------------------------------------//
 //Dessiner les rayons du cercle
   float tranche = TWO_PI / nombreDeRayons;
   float rads = 0;
   float ratio = 0.55; //Distance du diamètre
    
   strokeWeight(5);
   stroke(0);
    
   while ( rads < incrementationCercle  ) {
     float x1 = ellipseX + cos(rads) * longueurRayons * ratio;
     float y1 = ellipseY + sin(rads) * longueurRayons * ratio;
     float x2 = ellipseX + cos(rads) * longueurRayons;
     float y2 = ellipseY + sin(rads) * longueurRayons;
     line(x1,y1,x2,y2 );
     rads = rads + tranche;
   }

  //Vérification de l'état du cercle -> S'il est à true on incrémente. S'il est à false, on désincrémente 
  if(etatCercle==true){
    if(incrementationCercle < TWO_PI ){
      incrementationCercle = incrementationCercle + 0.3;
    }
    fill(255,0,255);//rose
  }
  else{
    if(incrementationCercle > 0){
      incrementationCercle = incrementationCercle - 0.3;
    }
    fill(0,255,0);//vert
  }  

  //Dessiner l'ellipse
  noStroke();
  ellipse(ellipseX,ellipseY,ellipseDiametre,ellipseDiametre);

}

void mousePressed(){
  
  //Vérifier si la souris est dans le rectangle
  if( mouseX > rectX && mouseX < rectX + rectDiametre && mouseY > rectY && mouseY < rectY + rectDiametre ){
    etatCarre = true;
  }
  
  //Vérifier si la souris est dans le cercle
  distance = dist(mouseX,mouseY,ellipseX, ellipseY);
  
  if(distance < (ellipseDiametre / 2)){
    //S'il est activé, on le désactive
    if(etatCercle==true){
      etatCercle=false;
     }
    //S'il est désactivé, on le met à true
    else{
      etatCercle=true;
    }
  }
}

//Relachement de la souris sur le carré
void mouseReleased() {
    etatCarre = false;
}
