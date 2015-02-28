
/***************************************
  Auteur: Lasfra karim                   
  TP1 - Création d'un monstre interactif
  Cours: EDM4600
****************************************/
int x; //variable x servant a la position central des objets.
int y;//variable y servant a la position central des objets.
int f;//variable f servant a entreposer un chiffre x.
float a;//variable a servant a entreposer un code de couleur.
float b;//variable a servant a entreposer un code de couleur.
float vibe=200;// variable servant au grossisement des muscles et du changement de couleur
String click;// variable servant a activer le grossisement et le changement de couleur des muscles
PImage img;// variable servant a  loader l'image du shake de proteine.

void setup() {
  size(400, 400);//taille du cadre
  background(255);//couleur du cadre
  img = loadImage("shake_1.png");// telechargement de l'image du ''milkshake'' de proteine
  smooth();// lissage des lignes de contour
  a=216;// code de couleur 1
  b=112;//code de couleur 2
  x= 200; // position centrale sur l'axe des x
  y= 200; // position centrale sur l'axe des y
  f= 30;  // entrepose un chiffre qui sert au grossisement des muscles
}


void draw() {
  
 background(255);//couleur du fond d'écran
 noCursor();// rend la souris invisible
 fill(a,b,0);// remplit tout ce qui est en dessous de cette couleur
 triangle(100, 278, 300, 277, 200, 600);// le torse de notre personnage


if (mousePressed) {
  // fonction servant a verifier si le clic est effectué, ce qui autorise l'utilisation du random, de la variable f et vibe
  //Secouement,Transition de taille et de couleur
  ellipse(x-90+random(-5,5), y-30, vibe-100,vibe-100);
  ellipse(x-150+random(-5,5), y+120, vibe-170+f,vibe-170+f);
  ellipse(x-160+random(-5,5), y+85, vibe-150+f,vibe-150+f);
  ellipse(x-150+random(-5,5), y+50,vibe-130+f,vibe-130+f);
  ellipse(x-100+random(-5,5), y+15, vibe-75+f,vibe-75+f);
  
  ellipse(x+90+random(-5,5), y-30, vibe-100,vibe-100);
  ellipse(x+150+random(-5,5), y+120, vibe-170+f,vibe-170+f);
  ellipse(x+160+random(-5,5), y+85,vibe-150+f,vibe-150+f);
  ellipse(x+150+random(-5,5), y+50,vibe-130+f,vibe-130+f);
  ellipse(x+100+random(-5,5), y+15, vibe-75+f,vibe-75+f);
}else{
    //verification que le clic n'est plus effectué, ce qui annule l'utilisation du random et de la variable f(active la variable vibe)
  ellipse(x-90, y-30,vibe-100,vibe-100);
  ellipse(x-150, y+120,vibe-160,vibe-160);
  ellipse(x-160, y+85,vibe-140,vibe-140);
  ellipse(x-150, y+50, vibe-120,vibe-120);
  ellipse(x-100, y+15,vibe-65,vibe-65);

  ellipse(x+90, y-30, vibe-100,vibe-100);
  ellipse(x+150, y+120,vibe-160,vibe-160);
  ellipse(x+160, y+85, vibe-140,vibe-140);
  ellipse(x+150, y+50, vibe-120,vibe-120);
  ellipse(x+100, y+15,vibe-65,vibe-65);
}
  
 // Code de creation du visage du personnage
fill(a,b,0);
beginShape();
vertex(x,y-175);
vertex(x+50,y-175);
vertex(x+100,y-50);
vertex(x+100,y+80);
vertex(x,y+150);
vertex(x-100,y+80);
vertex(x-100,y-50);
vertex(x-50,y-175); 
vertex(x,y-175);
endShape(CLOSE);
 // Fin Code de creation du visage du personnage

arc(x, y, 150, 300, 0, PI/1);// code du menton du personnage

//code bouche
fill(219,161,0);//couleur jaune
arc(x, y-50, 120, 300, 0, PI/1); 
arc(x, y+30, 100, 100, 0, PI/1); 
//fin code bouche

//Debut code des dents
stroke(5,5,5);
strokeWeight(2);// taille des lignes
line (x,y+15,200,300);
line (x+10,y+15,210,297);
line (x+20,y+10,220,290);
line (x+30,y+6,230,280);
line (x+40,y-3,240,260);
line (x+50,y-15,250,235);
line (x-10,y+15,190,297);
line (x-20,y+10,180,290);
line (x-30,y+6,170,280);
line (x-40,y-3,160,260);
line (x-50,y-15,150,235);
strokeWeight(1);
fill(245,0,0);
//Fin code des dents

fill(a,b,0);
arc(x, y-50, 120, 130, 0, PI/1); //code bouche (levre superieur)

//Debut code Pantalon bleu
fill(15,112,200);//couleur bleu
triangle(123, 354, 277, 354, 200, 600);
fill(245,0,0);
//fin code Pantalon bleu

//code crane
fill(a,b,0);
arc(x, y-174, 100, 30, PI, TWO_PI);
//fin code crane

 //Code nez
fill(245,0,0);
ellipse(x,160,50,50);
 //Fin code nez

//Debut code Yeux
fill(0);//couleur noir
ellipse(x-50, y-120, 100, 100);// creation du contour de l'oeil gauche
fill(255);//couleur blanche
ellipse(x-50, y-120, 90, 90);// creation de l'iris de l'oeil gauche
float pX = (int) map(constrain(mouseX,0,width), 0, width, -20, 20);// code servant a donné une limite de mouvement et une contrainte au niveau de l'espace a la pupille sur l'axe des x
float pY = (int) map(constrain(mouseY,0,height), 0, height, -20, 20);// code servant a donné une limite de mouvement et une contrainte au niveau de l'espace a la pupille sur l'axe des y
fill(0);//couleur noir
ellipse(x+50, y-120, 100, 100);//creation du contour de l'oeil droit
fill(255);//couleur blanche
ellipse(x+50, y-120, 90, 90);// creation de l'iris de l'oeil droit

  //debut code click des yeux qui bougent 
  if (mousePressed) {
    // si la souris est enfoncé, les yeux changent de taille et se secouent 
  fill(0);
  ellipse(x+50+random(-5,5) + pX, y-120 + pY, 50, 50);
  ellipse(x-50+random(-5,5) + pX, y-120 + pY, 50, 50);
  fill(245,0,0);
  ellipse(x+50+random(-2,2) + pX, y-120 + pY, 30, 30);
  ellipse(x-50+random(-2,2) + pX, y-120 + pY, 30, 30);
   } else  {
   // si la souris n'est pas enfoncé, les yeux gardent leur taille et ne se secouent pas
  fill(0);
  ellipse(x+50 + pX, y-120 + pY, 50, 50);
  ellipse(x-50 + pX, y-120 + pY, 50, 50);
  fill(245,0,0);
  ellipse(x+50 + pX, y-120 + pY, 10, 10);
  ellipse(x-50 + pX, y-120 + pY, 10, 10);
  }
//Fin code click des yeux qui bougent 

  line(x, y+170, x, y+200);// ligne qui donne l'illusion que le personnage a des jambes
  image (img, mouseX-40, mouseY-40);//code d'integration et placement du ''milkshake'' de proteine
  
  //Debut de la fonction servant a verifer l'état du clic 
  //Mise en fonction des parametres  pour ce qui est de la taille et de la colorisation du corps du personnage
  if (click=="click" && vibe<= 220) {
  vibe++;
  }else if(click=="out"){
  if (vibe>=200){
  vibe--;
  }  //Fin de la fonction servant a verifer l'état du clic
   
  }
  
  a = map(vibe,200,220,216,220);//utilisation de la variable vibe et la variable de couleur A, pour creer une transition colorimétrique 
  b = map(vibe,200,220,112,0);//utilisation de la variable vibe et la variable de couleur B, pour creer une transition colorimétrique
 
} 

void mousePressed() {
  click="click";// verification que le click est activé et mise en oeuvre du l'élargissement, la colorisation et le ''shake'' du personnage 
  println("Clique: x "+mouseX+" y "+mouseY); //imprime le click de la souris
}

void mouseReleased() {
  click="out";// verification que le click est desactivé et mise en oeuvre de la remise en état et le retour de la colorisation  du personnage
 }



