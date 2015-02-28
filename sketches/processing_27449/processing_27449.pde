
/*
LABYRINTHE
SEBASTIEN BELHUMEUR LEITH
EDM 4600
 */
//import fisica
import fisica.*;
// declaration des classes 
FWorld monde;
FCircle jet;
FCircle fin;
FPoly mur;
FPoly mur2;
FBox fenetrescore;
//boolean pour activier la joute
boolean gamedebut = true;
// image des instructions
PImage instruction;
//initialisation des variables
int points = 0;
int last = 0; 

void setup() {
  size(400, 400);
  smooth();

  Fisica.init(this);
   instruction = loadImage("instruction.jpg");
//initialisation du monde
  monde = new FWorld();
  monde.setGravity(0, 0);
  monde.setEdges();
  
 // active le jeu 
  if ( gamedebut == true ) {

  jet = new FCircle(20);
  jet.setPosition(20,172);
  jet.setFriction(1);
  jet.setGrabbable(false);
  //jet.addForce(0, 10000);
  //monde.add(jet);
  
  mur = new FPoly();
  mur.vertex(0, 152);
  mur.vertex(122, 152);
  mur.vertex(122, 34);
  mur.vertex(353, 34);
  mur.vertex(353, 270);
  mur.vertex(214, 270);
  mur.vertex(214, 360);
  mur.vertex(0, 360);
  mur.vertex(0, 400);
  mur.vertex(400, 400);
  mur.vertex(400, 25);
  mur.vertex(00, 25);
  //fusee.setPosition(width/2,height - 50);
  mur.setFill(15,15,15);
  mur.setNoStroke();
  mur.setStatic(true);
  mur.setGrabbable(false);
 // monde.add(mur);

  mur2 = new FPoly();

  mur2.vertex(0, 195);
  mur2.vertex(184, 195);
  mur2.vertex(184, 78);
  mur2.vertex(293, 78);
  mur2.vertex(293, 204);
  mur2.vertex(143, 204);
  mur2.vertex(143, 314);
  mur2.vertex(0, 314);
  mur2.setFill(15,15,15);
  mur2.setNoStroke();
  mur2.setStatic(true);
  mur2.setGrabbable(false);
  //monde.add(mur2);

  fin = new FCircle(20);
  fin.setFill(255);
  fin.setNoStroke();
  fin.setPosition(20,338);
  fin.setStatic(true);
  fin.setGrabbable(false);
 // monde.add(fin);
  

  
  
 

  monde.add(jet);
  monde.add(mur);
  monde.add(mur2);
  monde.add(fin);
  }

  

}
 
void draw() {
 
  background(100);
// affiche le score
  fill(255);
  textAlign(LEFT);
  text("NOMBRE DE COLLISION: "+points, 20,20);
  text("DERNIER RESULTAT: "+last, 240,20);
     if ( gamedebut == false ) {
     
   }
   
   // determine les mouvements du vaisseau
   if ( keyPressed && key == CODED ) {
   if ( keyCode == RIGHT ) {
     jet.addTorque(2);
   } else if ( keyCode == LEFT ) {
     jet.addTorque(-2);
   }
   else if ( keyCode == UP ) {
    float angle = jet.getRotation();
    float x = cos(angle) * 50;
    float y = sin(angle) * 50;

    jet.addForce(x,y);
   }
   else if ( keyCode == DOWN ) {
    float angle = jet.getRotation();
    float x = cos(angle) * -30;
    float y = sin(angle) * -30;
    //jet.setStatic(false);
    jet.addForce(x,y);
   }

   
   
   
  } 

 
 
  monde.step();
 
  monde.draw(this);
  //text(millis()/1000, 15, 30); 
 // textFont(font);
 //active l'image des instructions
  if ( gamedebut == true ) {
        
        
      background(instruction);


  }

}

// determine les contacts
void contactStarted(FContact contact) {
  if ( contact.getBody1() == mur || contact.getBody2() == mur ) {
   monde.remove(jet);
   monde.add(jet);
  jet.setForce(0,0);
  points += 1;
  }
  
  if ( contact.getBody1() == mur2 || contact.getBody2() == mur2 ) {
   monde.remove(jet);
   monde.add(jet);
  jet.setForce(0,0);
  points += 1;
  }
   
     
   if ( contact.getBody1() == fin || contact.getBody2() == fin ) {
   monde.remove(jet);
   jet.setForce(0,0);
   last = points; 
   points = 0;
   monde.add(jet);
  }
  
}


//active la joute lorsqu'il y a le clicque 
void mousePressed()
{
   gamedebut =false; 
   

}

