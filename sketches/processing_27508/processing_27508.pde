
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//JEU DE PING PONG
//PAR SANDRICK MATHURIN
//EDM4600 UQAM

//19AVRIL 2011


////*****************************************************************VARIABLES GLOBALES

//importer librairie

Minim minim;
AudioPlayer groove;




//images
PImage israel ;
PImage mer;
PImage requin1;
PImage requin2;

//position initiale de la palette 1
int ypal1=height/2;

//position initiale de la balle
float x= 200;
float y= 200;

//grandeur de la balle
float grandeur =50;
//position x des palettes
float xpal1=35;
float xpal2=365;

//vitesse de la balle
float vitesse =4;
float dirx= vitesse;
float diry= vitesse;
//score
int score;

//scènes
boolean victoire=false;
boolean start=false;
boolean gameover=false;
boolean menu=true;
//la police
PFont myFont;
PFont myFont2;
//************************************************************SETUP
void setup ()
{
  
 size(400,400);
 frameRate(30);
 smooth();
;
 //chargement des images
 israel= loadImage("israel.png");
 mer= loadImage("mer.jpg");
 requin1= loadImage("requin1.png");
 requin2= loadImage("requin2.png");
 
 //chargement de la police
  myFont = createFont("LetMeRide", 110);
  myFont2 = createFont("LetMeRide", 23);
  textFont(myFont);
  
  
  
 //audio
 minim = new Minim(this);
  groove = minim.loadFile("israel.mp3",320000);
 

  // see the example Recordable >> addListener for more about this

 

 //scènes

 
}


//**********************************fonction de controle palette 1

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {ypal1=ypal1-50;}
    if (keyCode == DOWN){ypal1=ypal1+50;}
  }
  

  
}

//****************************************fontion dessin

void draw () {
  
  
if (menu){  
  
background(mer);

fill(234,124,232);
//palette numéro 1
imageMode(CENTER);
image(requin1,xpal1,200,58,124);
//palette numéro 2

image(requin2,xpal2,200,58,124);
//texte
textFont(myFont2);
fill(0);
textAlign(CENTER);
text("COMMENCER",200,200);

if (mousePressed){start=true;}




}
  
if (start){
  
groove.play();

background(mer);

fill(234,124,232);
//palette numéro 1
imageMode(CENTER);
image(requin1,xpal1,ypal1,58,124);
//palette numéro 2

image(requin2,xpal2,mouseY,58,124);  

//*********************************BALLE
 //************************************
//mouvement de la balle
x=x+dirx;
y=y+diry;

//balle
imageMode(CENTER);
image(israel,x, y,grandeur,grandeur);

//si partie débuter, activer mouvement
if (start == true){}

//*****************************************************************REBONDISSEMENTS
////*****************************************************************

if (x == xpal2-grandeur/2 && y <= mouseY+100 && y >= mouseY-100) {
 //si la balle touche la palette le score est augmenté   
      score += 1 ;
//si c'est moins que le centre, la balle rebondit vers le haut
      if (y < mouseY) {
         dirx =  - vitesse;
         diry =  - vitesse;
      }
//si c'est moins que le centre, la balle rebondit vers le bas
      if (y > mouseY) {
         dirx =  - vitesse;
         diry =  + vitesse;
      }
//si la balle arrive près du milieu elle rebondit tout droit
      if (y == mouseY) {
         dirx =  - vitesse;
         diry = 0  ;
      }
  }
   
 ///palette numéro 1  
  if (x == xpal1+grandeur/2 && y <= ypal1+100 && y >= ypal1-100) {

      score += 1 ;
//si c'est moins que le centre, la balle rebondit vers le haut
      if (y < ypal1) {
         dirx =   vitesse;
         diry =  - vitesse;
      }
//si c'est moins que le centre, la balle rebondit vers le bas
      if (y > ypal1) {
         dirx =   vitesse;
         diry =  + vitesse;
      }
//si la balle arrive près du milieu elle rebondit tout droit
      if (y <ypal1+5 && y>ypal1-5) {
         dirx =   vitesse;
         diry = 0  ;
      }
  }
  

//si la balle touche le haut et le bas de la scène
 if ( y > height) {
      diry =  - vitesse;
   }
   if ( y < 0) {
     diry =   vitesse;
   }
     

//si la balle dépasse les cotés scène
if (x>width){gameover=true;}

if (x<0){gameover=true;}

//Si le pointage est de 25 le joueur gagne la partie

if (score==25){victoire=true;}



   
//*************************************système de pointage 
  textFont(myFont);
    fill(255);
    textAlign(RIGHT, TOP);
    text(score, 220, 20);
    
 }//fin de start   
///*******************************************************GAMEOVER
if (gameover) {
//start=false;
textFont(myFont2);
background(mer);
fill(255);
textAlign(CENTER);
text("ISRAEL A GAGNÉ", 200, 150);

  
if (keyPressed){start=true;
gameover=false;}
      
}


if (victoire){
start=false;
menu=false;
textFont(myFont2);
fill(0);
textAlign(CENTER);
text("VICTOIRE",200,200);


//arret de la lecture et de la libraire
  groove.close();


 


}

}




