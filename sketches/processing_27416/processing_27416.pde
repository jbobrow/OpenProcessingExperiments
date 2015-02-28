
/*
SUPER JEU INCROYABLE : L'ATTRAPE-BILLES!
Jeu créé par Félix Descôteaux dans le cadre du cours EDM 4600
Créé à l'aide de la librairie fisica, Merci FISICA ! Sans toi mon jeu ne serais rien
 */

//Importation de la librairie d'enfer
import fisica.*;

//Appel des classes
FWorld monde;
FBox petitRectangle;
FBox plancher;

//Initialisation des variables
int points = 0;
int vitesseDeferlement = 70;
int lastScore;


//Initialisation de la variable contenant la police
PFont font;
PImage bg1, bg;

//
boolean debutPartie;

void setup() {
  size(400, 400);
  smooth();
  frameRate(60);
  bg1 = loadImage("bg1.png");
  bg = loadImage("bg.png");
  font = loadFont("ForteMT-48.vlw");
  Fisica.init(this);

 //Installation du monde Fisica et des objets présents
  monde = new FWorld(0.0,0.0,400.0,400.0);
  
  petitRectangle = new FBox(50, 20);
  petitRectangle.setPosition(width/2, height - 40);
  petitRectangle.setStatic(true);
  petitRectangle.setFill(60,255,20);
  petitRectangle.setRestitution(0);
  monde.add(petitRectangle);
  
  plancher = new FBox(400, 2);
  plancher.setPosition(200, height - 5);
  plancher.setStatic(true);
  plancher.setFill(0);
  plancher.setRestitution(0);
  monde.add(plancher);
  
}



void draw() {
   
  if(debutPartie==true){ //Vérifie si le jeu est lancé
  
  //Met le background adéquat
  background(bg);
  
  //écriture du score
  textFont(font);
  fill(255);
  textAlign(LEFT);
  text(points, 20,50);
   
  //Apparition des cercles
  if (frameCount % vitesseDeferlement == 0) {
  FCircle b = new FCircle(random(5, 20));
  b.setPosition(random(0+10, width-10), 50);  
  b.setVelocity(0, 200);
  b.setRestitution(0);
  b.setNoStroke();
  b.setFill(0, 255, 255);
  monde.add(b);
    }
    
  //Mouvement du petit rectangle
  petitRectangle.setPosition(mouseX, height - 40);
  
   
  monde.draw();
  monde.step();
  
  //Appel de la fonction Score
  Score();
  //Appel de la fonction qui écrit le dernier score
  dernierScore();
  }
  
  else{
    //background du menu
    background(bg1);
    keySpace();
  }
  
}

//Fonction qui établit le contact entre les cercles et le petit rectangle
int contactStarted(FContact c) {
  
  FBody ball = null;
  if (c.getBody1() == petitRectangle) {
    ball = c.getBody2();
    // points += 1;
  } else if (c.getBody2() == petitRectangle) {
    ball = c.getBody1();
    // points += 1;
  }
   
   if (ball == null) {
    return 0;
  }
  
  ball.setFill(30, 190, 200);
  monde.remove(ball);
  points += 1;
 
  return points;
 }
 
 //Fonction qui établit le contact avec le plancher
 int contactResult(FContactResult c){
   FBody ball2 = null;
   if (c.getBody1() == plancher) {
    ball2 = c.getBody2();
    
    
    
  } else if (c.getBody2() == plancher) {
    ball2 = c.getBody1();
    
  }
  
  if (ball2 == null) {
    return 0;
  }
  ball2.setFill(30, 190, 200);
  monde.remove(ball2);
  
  vitesseDeferlement = 70;
  lastScore = points;
  points = 0;
  setup();
  return lastScore ;
  
 }
 
//Fonction qui modifie la vitesse de déferlement en fonction du score
void Score()
{
  if (points == 2)
  { 
    vitesseDeferlement = 60; 
  }
  else if (points == 5)
  { 
    vitesseDeferlement = 50; 
  }
   else if (points == 10)
  { 
    vitesseDeferlement = 40; 
  }
     else if (points == 15)
  { 
    vitesseDeferlement = 30; 
  }
   else if (points == 20)
  { 
    vitesseDeferlement = 20; 
  }
  else if (points == 30)
  { 
    vitesseDeferlement = 15; 
  }
  else if (points == 40)
  { 
    vitesseDeferlement = 10; 
  }
}

//Fonction qui écrit le dernier score obtenu
void dernierScore(){
  textFont(font);
  fill(255);
  textAlign(RIGHT);
  text("LAST: " + lastScore, 370,50);
}

//fonction qui change le boolean à true
void keySpace()
{
 if(keyCode==32){
     debutPartie = true;
   }
}

/*
void mousePressed (){
  println (points);
}


void keyPressed() {
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
}
*/



