
int counter;
int[] numbers = {int(random(1, 7)), int(random(1, 7)),int(random(1, 7)), int(random(1, 7)), int(random(1, 7))}; // la liste en elle meme est le lance de des , les random sont les nombres aleatoires correspondant au chiffre present sur les des apres le lance
int le_bouton_a_ete_presse=0; // 1 oui : 0 non

void setup() {  
  size(2500, 600);// taille de la fenetre d'affichage
  background(#CECECE);  // couleur du background(= le fond)
  colorMode(HSB);   //luminosite
  }


void draw(){
 background(#CECECE);
 rectMode(CENTER);
 traiter_souris();
 if (le_bouton_a_ete_presse==1) {  // quand on clique sur la souris le programme " lance les des "
   numbers = {int(random(1, 7)), int(random(1, 7)),int(random(1, 7)), int(random(1, 7)), int(random(1, 7))}; 
   le_bouton_a_ete_presse=0;
 
 }
   fill(255);  //couleur des " rectangle "
   rect(80,80,125,125);// 5 des du jeu
   fill(0); // couleur de l'ecriture dans les rectangles 
   text(numbers[0],75,85); //nombre de la liste aleatoire , chiffre des des , et leurs coordonees
   
   fill(255);
   rect(210,180,125,125);
   fill(0);
   text(numbers[1],200,185);
   
   fill(255);
   rect(340,280,125,125);
   fill(0);
   text(numbers[2],300,300);
   
   fill(255);
   rect(470,380,125,125);
   fill(0);
   text(numbers[3],400,400);
  
   fill(255);
   rect(600,480,125,125);
   fill(0);
   text(numbers[4],500,500);
   
   {

PImage Des;
Des = loadImage("Des ISN 1.jpeg");
image(Des,200,185);
   }
   
  


void traiter_souris() {
    if (mousePressed == true && le_bouton_a_ete_presse==0) {
        le_bouton_a_ete_presse=1;
    }
    if (mousePressed == false && le_bouton_a_ete_presse==1) {
        le_bouton_a_ete_presse=0;
    }
}
