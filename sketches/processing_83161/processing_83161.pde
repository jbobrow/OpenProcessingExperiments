


float distance;
///////Tableaux indiquant le nombre de formeChaude et froide invoquer
int nbFormeChaude=10000;
int nbFormeFroide=5;
FormeChaude[] hot = new FormeChaude[nbFormeChaude];
FormeFroide [] cold = new FormeFroide[nbFormeFroide];
//Array List
ArrayList <FormeFroide> cool = new ArrayList <FormeFroide>();// Nous permet d'ajouter et de supprimer des formes froides à loisirs.
//////mise en place
void setup() {
  size(600, 600);
  //boucle
  for (int i=0; i<hot.length; i++) {
    hot[i] = new FormeChaude(random(0.5, 5));// designe la valeur de la variable vitesse pour chaque forme chaude
  }
  for (int i=0; i<cold.length; i++) {
   cold[i] = new FormeFroide(random(0.5, 10));// designe la valeur de la variable vitesse pour chaque forme froide
  }
}

void draw() {
background(0);
for (int i=0; i<hot.length; i++) {
  hot[i].bouge();
  hot[i].rond();
}
for (int i=0; i<cold.length; i++) {
  cold[i].bouge();
  cold[i].rond();
}
  for (int i=0;i<cool.size();i++) 
  {
       cool.get(i).rond();
       cool.get(i).bouge();
  }
}

//void efface()
//{
////effacer quand on appuie sur espace
//  if (keyPressed) {
//   if (key== ' ')
//   {
//     background(0);
//   }
//  }
//}


 void mousePressed() //Ajout de forme lorsque que l'on clique
{
cool.add(new FormeFroide(random(1, 5)));
} 






class FormeChaude{

float centreX; //coordonées en x des ellipses
float centreY; // coordonées en x des ellipses
float directionX = 1;
float directionY = 1;
float vitesse = 0.4; // vitesse de déplacement des ellipses
float taille= 1;  // diamètre des ellipses
float distance; //distance entre les ellipses


///////////Couleur des ellipses
float R = 0;//valeurs de rouge
float G = 0;//valeurs de vert
float B=  0;//valeurs de bleu


  FormeChaude(float _vitesse) {
   vitesse = _vitesse;       
   centreX = random(width); // Choix aléatoire des coordonées en x
   centreY=random(height); // Choix aléatoire des coord
   R=random(200, 255);
   G=random(0, 100);
   B=random(0, 50);
 }
////////////Creation du gabarit de forme////
////////////////////////////////////////////
////////////////////////////////////////////
void rond(){
   
  pushMatrix();
    noStroke();
    fill(R, G, B);
    ellipse(centreX, centreY,taille,taille);
   popMatrix();
   
}

////////////MOUVEMENT DES ELLIPSES//////////
////////////////////////////////////////////
////////////////////////////////////////////
  void bouge(){
    // Quand les coordonées en x d'une ellipse atteignent la valeur de la
   //largeur de l'écran (càd 600 dans notre cas) la direction change
   if (centreX > width) 
   {
       centreX = width;
       directionX *= -1;
   }
   // Même chose mais dans le cas ou centreX à la valeur minimal 0 donc
   //quand l'ellipse touche le bord gauche de l'écran
   if (centreX < 0){
       centreX = 0;
       directionX *= -1;
    }
    // Gère le deplacement dans l'éspace de l'éllipse.
    else{
       centreX += vitesse * directionX;
    }
    // Change de direction le mouvement de l'éllipse quand elle atteint le haut de l'écran
    // CentreY=600;
    if (centreY > height) {
       centreY = height;
       directionY *= -1;
    }
     // Change de direction le mouvement de l'éllipse quand elle atteint le bas de l'écran
    // CentreY=0; 
    if (centreY < 0) {
       centreY = 0;
       directionY *= -1;
     }
     // Gère le deplacement dans l'éspace de l'éllipse.
     else {
       centreY += vitesse * directionY;
     }
     
// ///////////////// collision des boules chaudes entre elle
//   for (int i=0; i<cold.length;i++) 
//  {
//    distance= dist(centreX, centreY, centreX, centreY);
//    if (distance<=10){
//    
//    }
//  }
// 

   
 ///////////////// collision des boules chaudes avec les froides
    for (int i=0; i<cold.length;i++) 
    {
     distance= dist(centreX, centreY, cold[i].centreX, cold[i].centreY);// calcul des distances entre les ellipses
     // Quand la distance entre les formes est inferieur à " " un changement sur la forme s'opère
     if (distance<=70){
       stroke(255);
       fill(255);
       ellipse(centreX, centreY, 6, 6);
    }
  }
  
  
 }
}


class FormeFroide{

float centreX; //coordonées en x des ellipses
float centreY; // coordonées en x des ellipses
float directionX = 1;
float directionY = 1;
float vitesse = 0.4; // vitesse de déplacement des ellipses
float taille= 15;  // diamètre des ellipses
float distance; //distance entre les ellipses
float repousse; //distance forme souris

///////////Couleur des ellipses
float R = 0;//valeurs de rouge
float G = 0;//valeurs de vert
float B= 0;//valeurs de bleu
  FormeFroide(float _vitesse) {
   vitesse = _vitesse;
   centreX = random(width); // Choix aléatoire des coordonées en x
   centreY=random(height); // Choix aléatoire des coordonées en y
   R=random(0, 100);
   G=random(0,100);
   B=random(70, 245);// Choix aléatoires des valeurs de bleu entre 10 et 215
   
 }
////////////Creation du gabarit de forme////
////////////////////////////////////////////
////////////////////////////////////////////
void rond(){
  pushMatrix();
  noStroke();
   fill(R, G, B);
   ellipse(centreX, centreY, taille, taille);
    fill(255);
   ellipse(centreX, centreY, 5, 5);
   popMatrix();
}
////////////MOUVEMENT DES ELLIPSES//////////
////////////////////////////////////////////
////////////////////////////////////////////
  void bouge(){
    centreY = centreY + (vitesse * directionY);
    centreX = centreX + (vitesse * directionX);
    if (centreX >= width || centreX <= 0) {
      directionX *= -1;
      centreX = centreX + (1 * directionX);
      centreY = centreY + (1 * directionY);
    }
    if (centreY >= height || centreY <= 0) {
      directionY *= -1;
      centreY = centreY + (1 * directionY);
    }
   
 ///////////////// collision des boules
    for (int i=0; i<hot.length;i++) 
    {
     distance= dist(centreX, centreY, hot[i].centreX, hot[i].centreY);// calcul des distances entre les ellipses
     // Quand la distance entre les formes est inferieur à " " un changement sur la forme s'opère
     if (distance<=10){
       taille=random(5,55);
    }
  }
  
   ///////////////// Attraper les ellipses
 
      for (int i=0; i<hot.length;i++) 
    {
     repousse= dist(centreX, centreY, mouseX, mouseY);// calcul des distances entre les ellipses
     // Quand la distance entre les formes est inferieur à " " un changement sur la forme s'opère
     if (repousse<=40){
       centreX= mouseX+5;
       centreY= mouseY+5;
    }
  }
 
 
 
 
 }
}




