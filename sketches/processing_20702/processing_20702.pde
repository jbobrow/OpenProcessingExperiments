
/*
 
 Travail # 1 - edm4600 - Algorithmie de base et interactivite
 Sophie Blondeau
 11 fevrier 2011
  
 */

//Déclaration des variables
float positionX = 200;
float positionY = 250;

//Variables pour yeux
float xOeil = positionX+30; //Position de l'oeil droit X
float yOeil = positionY-140; //Position de l'oeil droit Y
float xOeilG = positionX-30; //Position de l'oeil gauche X
float yOeilG = positionY-140; //Position de l'oeil gauche Y
float wOeil; // Largeur de l'oeil
float hOeil; // hauteur de l'oeil
float wpOeil; //Largeur de l'iris
float hpOeil; //Hauteur de l'iris
PImage img;


/*========================================================================================*/
void setup() {
  size(400,400); //Taille 800 x 600 px
  smooth();  //Anti-alias
  noCursor();
  img=loadImage("background.jpg"); //Chargement de l'image
}
void draw() {
  image(img,0,0,400,400); //Appele le pImage aux coordonnées 0,0 et de grosseur 800x600
  strokeWeight(1); //Définit la grosseur de contour
  ellipseMode(CENTER); //Place le centre des cercles comme point de référence
  corpCochon(); //Fonction de base pour appeler le cochon
  curseurMouche();
  }
/*========================================================================================*/
void corpCochon(){
  /*Appele les différentes fonctions*/
  pattesCochon();
  queueCochon();
  
         //Corps
        fill(255,163,208); //Couleur de remplissage
        ellipse(positionX,positionY,165,120);//Définit taille et position du corps 
    oreillesCochon();
       //Forme tete
       fill(255,163,208); //Couleur de remplissage
       ellipse(positionX,positionY-120,150,150);//Définit la taille et position de la tete
   
   /*Appele les différentes fonctions*/
    oeilCochon();
    nezCochon();
    boucheCochon();
}
/*========================================================================================*/
void queueCochon(){  
  fill(255,163,208); //Couleur de remplissage
  ellipse(positionX+70, positionY-30, 25, 20);//Définit la taille et position de la queue
}
/*========================================================================================*/
void pattesCochon(){
  fill(255,163,208); //Couleur de remplissage
  /*Bouger les pattes si le clic est enfoncé*/
  if(mousePressed==true){
  ellipse(positionX+70,positionY+25,25,100); //Patte droite arrière
  ellipse(positionX+35,positionY+55,40,115); //Patte droite avant
  ellipse(positionX-55,positionY+40,43,155); //Patte gauche avant
   /*Sabot avant gauche*/
   fill(0);  
   triangle(positionX-50,positionY+120,positionX-45,positionY+130,positionX-40,positionY+120);
   triangle(positionX-50,positionY+120,positionX-55,positionY+130,positionX-60,positionY+120);
   triangle(positionX-60,positionY+120,positionX-65,positionY+130,positionX-70,positionY+120);
   rect(positionX-70,positionY+100,30,20);
  /*Sabot avant droit*/
   triangle(positionX+40,positionY+120,positionX+45,positionY+130,positionX+50,positionY+120);
   triangle(positionX+40,positionY+120,positionX+35,positionY+130,positionX+30,positionY+120);
   triangle(positionX+30,positionY+120,positionX+25,positionY+130,positionX+20,positionY+120);
   rect(positionX+20,positionY+100,30,20);
   
   /*Sabot arriere droite*/
   triangle(positionX+72,positionY+80,positionX+76,positionY+85,positionX+80,positionY+80);
   triangle(positionX+72,positionY+80,positionX+68,positionY+85,positionX+64,positionY+80);
   triangle(positionX+64,positionY+80,positionX+62,positionY+85,positionX+60,positionY+80);
   rect(positionX+60,positionY+65,20,15);
}
  
  
  
  /*Sinon les laisser statique*/
  else{
  //ellipse(positionX-30,positionY+35,25,100); //Patte gauche arrière
  ellipse(positionX+65,positionY+25,25,100); //Patte droite arrière
  ellipse(positionX+30,positionY+60,40,115); //Patte droite avant
  ellipse(positionX-60,positionY+40,43,155); //Patte gauche avant
   
   
   /*Sabot avant gauche*/
   fill(0);  
   triangle(positionX-55,positionY+115,positionX-50,positionY+125,positionX-45,positionY+115);
   triangle(positionX-55,positionY+115,positionX-60,positionY+125,positionX-65,positionY+115);
   triangle(positionX-65,positionY+115,positionX-70,positionY+125,positionX-75,positionY+115);
   rect(positionX-75,positionY+95,30,20);

 /*Sabot avant droit*/
   triangle(positionX+35,positionY+115,positionX+40,positionY+125,positionX+45,positionY+115);
   triangle(positionX+35,positionY+115,positionX+30,positionY+125,positionX+25,positionY+115);
   triangle(positionX+25,positionY+115,positionX+20,positionY+125,positionX+15,positionY+115);
   rect(positionX+15,positionY+95,30,20);
 
  /*Sabot arriere droite*/
   triangle(positionX+67,positionY+75,positionX+71,positionY+80,positionX+75,positionY+75);
   triangle(positionX+67,positionY+75,positionX+63,positionY+80,positionX+59,positionY+75);
   triangle(positionX+59,positionY+75,positionX+57,positionY+80,positionX+55,positionY+75);
   rect(positionX+55,positionY+60,20,15);
 
 } 
}
/*========================================================================================*/
void nezCochon(){   
    fill(221,126,169); // Couleur de remplissage du nez
    ellipse(positionX,positionY-100,75,55); // Créer le cercle formant le nez
   
   /*Si la souris est enfoncée, grossir les narinnes, sinon laisser tel quel*/
    if(mousePressed == true){
      fill(0);
      ellipse(positionX-10,positionY-100,12,12); //Narrine gauche
      ellipse(positionX+10,positionY-100,12,12); //Narrine droite
    }
    else{
      fill(0);
       ellipse(positionX-10,positionY-100,8,8); //Narrine gauche
      ellipse(positionX+10,positionY-100,8,8);} //Narrine droite
}
/*========================================================================================*/
void boucheCochon(){
  /*Souris enfoncée = Langue, sinon pas de langue*/
  if(mousePressed == true){
    strokeWeight(3);//Définir le trait a 3
    line(positionX-33,positionY-90,positionX+34,positionY-90);//Créer une ligne pour la bouche
    fill(255,0,0);//Couleur de remplissage langue
    noStroke();//Enlever le trait
    curve(positionX,positionY-300,positionX+15,positionY-90,positionX-15,positionY-90,positionX,positionY-300);//Créer la courbe pour la langue
    stroke(#7E0303);// Couleur du trait dans la langue
    line(positionX,positionY-90, positionX,positionY-75); //Crée la ligne
    stroke(1); // Redéfinnit le trait à sa couleur par défaut NOIR
 }
    else{ 
    strokeWeight(3);//Définit le trait a 3
    line(positionX-33,positionY-90,positionX+34,positionY-90);//Créer la bouche
  }
}
 /*========================================================================================*/
 void oreillesCochon(){
    fill(221,126,169); //Couleur de remplissage
    /*Souris enfoncée = grossis oreille, sinon tel quel*/
  if(mousePressed == true)
  {
    triangle(positionX-50,positionY-180,positionX-90,positionY-190,positionX-70,positionY-110); //Oreille gauche
    triangle(positionX+50,positionY-180,positionX+90,positionY-190,positionX+70,positionY-110); //Oreille droite
  }
  else{
    triangle(positionX-40,positionY-170,positionX-80,positionY-180,positionX-60,positionY-100); //Oreille gauche
    triangle(positionX+40,positionY-170,positionX+80,positionY-180,positionX+60,positionY-100); //Oreille droite
  }
  }
 /*========================================================================================*/
 void oeilCochon(){
    /*Si la souris est enfoncée on change la grosseur de l'oeil avec variable défénit en haut de page*/
    if(mousePressed == true){
      wOeil = 25;
      hOeil = 25;
      wpOeil = 15;
      hpOeil = 15;}
     else{
       wOeil = 20;
      hOeil = 20;
      wpOeil = 10;
      hpOeil = 10;}
      
      /*Oeil droit*/
     fill(255); // Couleur de remplissage du fond de l'oeil
     ellipse(xOeil,yOeil,wOeil,hOeil); // Créer le fond
     float radians = atan2(mouseY-yOeil,mouseX-xOeil); // Calcul l'angle en radians
     float distance = sqrt(pow(mouseY-yOeil,2)+pow(mouseX-xOeil,2)); // calcule la distance entre la souris et l'oeil pow et sqrt sont la pour les exponnentiels
     fill(0); // Remplir au noir
     ellipse(cos(radians)*min(distance,wOeil/2-wpOeil/2)+xOeil,sin(radians)*min(distance,hOeil/2-hpOeil/2)+yOeil,wpOeil,hpOeil); //Créer l'iris en plaçant le X et Y en fonction de la souris, grosseur déterminer au départ

     /*Oeil gauche*/
     fill(255); // Couleur de remplissage du fond de l'oeil
     ellipse(xOeilG,yOeilG,wOeil,hOeil); // Créer le fond
     float radiansG = atan2(mouseY-yOeilG,mouseX-xOeilG); // Calcul l'angle en radians
     float distanceG = sqrt(pow(mouseY-yOeilG,2)+pow(mouseX-xOeilG,2)); // calcule la distance entre la souris et l'oeil pow et sqrt sont la pour les exponnentiels
     fill(0); // Remplir au noir
     ellipse(cos(radiansG)*min(distanceG,wOeil/2-wpOeil/2)+xOeilG,sin(radiansG)*min(distanceG,hOeil/2-hpOeil/2)+yOeilG,wpOeil,hpOeil);//Créer l'iris en plaçant le X et Y en fonction de la souris, grosseur déterminer au départ
  }
  
 /*========================================================================================*/
 //Créer la mouche qui suit le curseur, donc les yeux
 void curseurMouche()
 {
   if(mouseX <= width/2)//Si ne dépasse pas la moitié de l'écran
   {
   stroke(0);
   ellipse(mouseX,mouseY-5,10,7);
   fill(0);
   ellipse(mouseX,mouseY,20,8);
   strokeWeight(2);
   line(mouseX+10,mouseY-4,mouseX+13,mouseY-8);
   fill(255);
   ellipse(mouseX+5,mouseY+1,7,7);}
   else
 {
   stroke(0);
   ellipse(mouseX,mouseY-5,10,7);
   fill(0);
   ellipse(mouseX,mouseY,20,8);
   strokeWeight(2);
   line(mouseX-10,mouseY-4,mouseX-13,mouseY-8);
   fill(255);
   ellipse(mouseX-5,mouseY+1,7,7);
 }
   
 }

  

