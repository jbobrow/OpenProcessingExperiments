
// Opération fractale sur un cercle
// cgiles videoactif 2010

// Merci a Daniel Shiffman pour son site nature of code
// http://www.shiffman.net/teaching/nature/

// intialisation des variables, d'abord nb pour le compte des rangs de la fractale,
// et ensuite la frequence d'image.
int nb=0;
int freqI=30;
// partie setup
void setup(){
// taille et frequence d'image
size(640,480);
frameRate(freqI);
// mode de dessin des ellipses et smooth
ellipseMode(CENTER);
smooth();
}
// dessinons
void draw(){
// fond en gris 204 "processing", et deplacement du centre au milieu de l'image  
background(204);
translate(width/2,height/2);
//appel de la fonction de dessin de fractale
cercle(0,0,450,nb);
// vérifie si le nombre de rang désiré est atteint, ici 7.
// Si oui retour du compte des rangs à 7.
if(nb>7){
  nb=0;
}
// si le reste de la division du nombre d'image créé depuis le début de l'animation 
// par la fréquence d'image est égale à 0, alors on incrémente le nombre de rang 
if(frameCount%freqI==0){
  nb++;

}
}
// création de l'objet cercle
// variable : x= position en x, y position en y, taille = diametre du cercle, n = nombre de fois a dessiner restant
void cercle (int x,int y, float taille,int n){
  
  
// dessin du cercle
  ellipse(x,y,taille,taille);
// decrementation du nombre de rang restant
  n--;
  // verifie si la taille est encore assez grande et si le nombre de rang n'est pas égale a 0
  if(taille>10&& n>0){
    // reduction de la taille
    taille*=0.5;
    // memorisation de la position 
    pushMatrix();
    //calcul et decallage de la position
    float x2=x-taille/2;
    translate(x2,y);
    //creation d'un nouvel objet a la nouvelle coordonné, taille et nombre de rang restant
    cercle(x,y,taille,n);
    //remise a 0 de la position
    popMatrix();
    // calcul et decallage de la position
    float x3=x+taille/2;
    translate(x3,y);
    //creation d'un nouvel objet a la nouvelle coordonné, taille et nombre de rang restant
    cercle(x,y,taille,n);
  }
}

