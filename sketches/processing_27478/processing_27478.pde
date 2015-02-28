
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 
//  Florence Labelle
//  avec l'aide incomparable du génial Reda Radi
//  TP4 Jeu
//  EDM4600-50
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import fisica.*; // Importer la logitheque.

////////////////////////
// Variables Globales //
////////////////////////

int colonnes = 6;
int rangees = 6;

FWorld world; // Déclarer une reference à la logithèque.
FBody vbleuf;
FBody vmauve;
//FBody vrose;
FBody vbrun;
FBody vrouge;
FBody vvertp;
FBody vbleup;
FBody vorange;
FBody vcitron;
FBody vjaune;
FBody vvertf;
FBody vbeige;
FBody vnoir;

PImage bleuf;
PImage mauve;
//PImage rose;
PImage brun;
PImage rouge;
PImage vertp;
PImage bleup;
PImage orange;
PImage citron;
PImage jaune;
PImage vertf;
PImage beige;
PImage noir;

PImage fleche;
PImage intro;
PImage fin;

int savedTime;


float posXbleuf;
float posYbleuf;
float velXbleuf;
float velYbleuf;

float posXmauve;
float posYmauve;
float velXmauve;
float velYmauve;
/*
float posXrose;
float posYrose;
float velXrose;
float velYrose;
*/
float posXbrun;
float posYbrun;
float velXbrun;
float velYbrun;

float posXrouge;
float posYrouge;
float velXrouge;
float velYrouge;

float posXvertp;
float posYvertp;
float velXvertp;
float velYvertp;

float posXbleup;
float posYbleup;
float velXbleup;
float velYbleup;

float posXorange;
float posYorange;
float velXorange;
float velYorange;

float posXcitron;
float posYcitron;
float velXcitron;
float velYcitron;

float posXjaune;
float posYjaune;
float velXjaune;
float velYjaune;

float posXvertf;
float posYvertf;
float velXvertf;
float velYvertf;

float posXbeige;
float posYbeige;
float velXbeige;
float velYbeige;

float posXnoir;
float posYnoir;
float velXnoir;
float velYnoir;


////////////////////////////
// Creation de la Fenetre //
////////////////////////////


void setup () {
  size(400,400); // taille et mode de la fenetre 
  frameRate(30); // nombre d'images par seconde
  smooth(); // antialliasing
  savedTime = millis();

  Fisica.init(this); // Initialiser la logitheque.
  world = new FWorld(); // Créer une référence à la logitheque.
  world.setGravity(0, 0); // Activer la gravite ( x , y ).
  world.setEdges(); // Activer les murs du pourtour de la scene .
 
  // Charger les images.
  bleuf = loadImage("bleuf.JPG");
  mauve = loadImage("mauve.JPG");
//  rose = loadImage("rose.JPG");
  brun = loadImage("brun.JPG");
  rouge = loadImage("rouge.JPG");
  vertp = loadImage("vertp.JPG");
  bleup = loadImage("bleup.JPG");
  orange = loadImage("orange.JPG");
  citron = loadImage("citron.JPG");
  jaune = loadImage("jaune.JPG");
  vertf = loadImage("vertf.JPG");
  beige = loadImage("beige.JPG");
  noir = loadImage("noir.JPG");
  intro = loadImage ("intro.jpg");
  fin = loadImage("fin.jpg");
  fleche = loadImage ("fleche.jpg");

// ####################################### VOITURE BLEU FONCE ####################################
    vbleuf = new FBox(bleuf.width,bleuf.height);
    float xbleuf = 297;
    float ybleuf = 38;
    vbleuf.setPosition(xbleuf,ybleuf); // Place le corps dans la scene à une position donnée.
    vbleuf.setGrabbable(true);
    vbleuf.setRotatable(false);
    float res1 = 0;
    vbleuf.setRestitution(res1);
    vbleuf.attachImage(bleuf); // Attacher une image au corps.
    world.add(vbleuf); // Ajouter le corps a la simulation.
    
// ####################################### VOITURE MAUVE ######################################## 
    vmauve = new FBox(mauve.width,mauve.height);
    float xmauve = 168;
    float ymauve = 201;
    vmauve.setPosition(xmauve,ymauve); // Place le corps dans la scene à une position donnée.
    vmauve.setGrabbable(true);
    vmauve.setRotatable(false);
    float res2 = 0;
    vmauve.setRestitution(res2);
    vmauve.attachImage(mauve); // Attacher une image au corps.
    world.add(vmauve); // Ajouter le corps a la simulation.
 
 // ####################################### VOITURE ROSE ########################################   
/*    vrose = new FBox(rose.width,rose.height);
    float xrose = 136;
    float yrose = 103;
    vrose.setPosition(xrose,yrose); // Place le corps dans la scene à une position donnée.
    vrose.setGrabbable(true);
    vrose.setRotatable(false);
    float res3 = 0;
    vrose.setRestitution(res3);
    vrose.attachImage(rose); // Attacher une image au corps.
    world.add(vrose); // Ajouter le corps a la simulation.
    
*/

  // ####################################### VOITURE BRUNE ########################################   
    vbrun = new FBox(brun.width,brun.height);
    // Placer le corps aleatoirement dans la scene.
    float xvbrun = 234;
    float yvbrun = 137;
    vbrun.setPosition(xvbrun,yvbrun);
    vbrun.setRotatable(false);
    float res4 = 0;
    vbrun.setRestitution(res4);
    // Attacher une image au corps.
    vbrun.attachImage(brun);
    // Ajouter le corps a la simulation.
    world.add(vbrun);
  
 // ####################################### VOITURE ROUGE ########################################    
    // Créer un nouveau corps.
    vrouge = new FBox(rouge.width,rouge.height);
    // Placer le corps aleatoirement dans la scene.
    float xvrouge = 72;
    float yvrouge = 170;
    vrouge.setPosition(xvrouge,yvrouge);
    vrouge.setRotatable(false);
    float res5 = 0;
    vrouge.setRestitution(res5);
    // Attacher une image au corps.
    vrouge.attachImage(rouge);
    // Ajouter le corps a la simulation.
    world.add(vrouge);
    
 // ####################################### VOITURE VERT PALE ########################################    
    // Créer un nouveau corps.
    vvertp = new FBox(vertp.width,vertp.height);
    // Placer le corps aleatoirement dans la scene.
    float xvvertp = 72;
    float yvvertp = 235;
    vvertp.setPosition(xvvertp,yvvertp);
    vvertp.setRotatable(false);
    float res6 = 0;
    vvertp.setRestitution(res6);
    // Attacher une image au corps.
    vvertp.attachImage(vertp);
    // Ajouter le corps a la simulation.
    world.add(vvertp);
    
 // ####################################### VOITURE BLEU P ########################################    
    // Créer un nouveau corps.
    vbleup = new FBox(bleup.width,bleup.height);
    // Placer le corps aleatoirement dans la scene.
    float xvbleup = 103;
    float yvbleup = 333;
    vbleup.setPosition(xvbleup,yvbleup);
    vbleup.setRotatable(false);
    float res7 = 0;
    vbleup.setRestitution(res7);
    // Attacher une image au corps.
    vbleup.attachImage(bleup);
    // Ajouter le corps a la simulation.
    world.add(vbleup);
   
 // ####################################### VOITURE ORANGE ########################################    
    // Créer un nouveau corps.
    vorange = new FBox(orange.width,orange.height);
    // Placer corps aleatoirement dans la scene.
    float xvorange = 39;
    float yvorange = 329;
    vorange.setPosition(xvorange,yvorange);
    vorange.setRotatable(false);
    float res8 = 0;
    vorange.setRestitution(res8);
    // Attacher une image au corps.
    vorange.attachImage(orange);
    // Ajouter le corps a la simulation.
    world.add(vorange);
   
 // ####################################### VOITURE CITRON ########################################    
    // Créer un nouveau corps.
    vcitron = new FBox(citron.width,citron.height);
    // Placer le corps aleatoirement dans la scene.
    float xvcitron = 200;
    float yvcitron = 360;
    vcitron.setPosition(xvcitron, yvcitron);
    vcitron.setRotatable(false);
    float res9 = 0;
    vcitron.setRestitution(res9);
    // Attacher une image au corps.
    vcitron.attachImage(citron);
    // Ajouter le corps a la simulation.
    world.add(vcitron);
  
 // ####################################### VOITURE JAUNE ########################################     
    // Créer un nouveau corps.
    vjaune = new FBox(jaune.width,jaune.height);
    // Placer le corps aleatoirement dans la scene.
    float xvjaune = 359;
    float yvjaune = 299;
    vjaune.setPosition(xvjaune, yvjaune);
    vjaune.setRotatable(false);
    float res10 = 0;
    vjaune.setRestitution(res10);
    // Attacher une image au corps.
    vjaune.attachImage(jaune);
    // Ajouter le corps a la simulation.
    world.add(vjaune);
   
 // ####################################### VOITURE VERT FONCE ########################################    
    // Créer un nouveau corps.
    vvertf = new FBox(vertf.width,vertf.height);
    // Placer le corps aleatoirement dans la scene.
    float xvvertf = 168;
    float yvvertf = 73;
    vvertf.setPosition(xvvertf, yvvertf);
    vvertf.setRotatable(false); 
    float res11 = 0;
    vvertf.setRestitution(res11);
    // Attacher une image au corps.
    vvertf.attachImage(vertf);
    // Ajouter le corps a la simulation.
    world.add(vvertf);
  
 // ####################################### VOITURE BEIGE ########################################    
   vbeige = new FBox(beige.width,beige.height);
    // Placer le corps aleatoirement dans la scene.
    float xvbeige = 200;
    float yvbeige = 297;
    vbeige.setPosition(xvbeige, yvbeige);
    vbeige.setRotatable(false);
    float res12 = 0;
    vbeige.setRestitution(res12);
    // Attacher une image au corps.
    vbeige.attachImage(beige);
    // Ajouter le corps a la simulation.
    world.add(vbeige);
  
 // ####################################### VOITURE NOIRE ########################################    
    vnoir = new FBox(noir.width,noir.height);
    // Placer le corps aleatoirement dans la scene.
    float xvnoir = 265;
    float yvnoir = 233;
    vnoir.setPosition(xvnoir, yvnoir);
    vnoir.setRotatable(false);
    float res13 = 0;
    vnoir.setRestitution(res13);
    // Attacher une image au corps.
    vnoir.attachImage(noir);
    // Ajouter le corps a la simulation.
    world.add(vnoir);
}

 
///////////////////
// Fonction Draw //
///////////////////

void draw () {

   int elapsed = millis() - savedTime;
   if( elapsed < 10000) {
       background(intro);
     
      }
      else {
       niveau1();
        }
    if (posXrouge > 315){
       background(fin);
 }
 }

 
 /////////////
// Niveau 1 //
//////////////

void niveau1() {
  background(175); // couleur de l'arriere-plan
  
  fill(200);
  float largeurColonne = width/colonnes-2;
  float hauteurRangee = height/rangees-2;

  //////////////// Dessiner la grille du fond /////////////
  for(int i=0 ; i < colonnes ; i++){ 
    for(int j=0 ; j < rangees ; j++){ 
      float x = i*largeurColonne+10;
      float y = j*hauteurRangee+10;
      rect( x+1 , y+1 , largeurColonne-5 , hauteurRangee-5 );
    }
  }
 image (fleche,335,143);

  world.step(); // Executer une etape de la simulation
 
  posXbleuf = vbleuf.getX();
  posYbleuf = vbleuf.getY();
  velXbleuf = vbleuf.getVelocityX(); 
  velYbleuf = vbleuf.getVelocityY(); 
 
  posXmauve = vmauve.getX();
  posYmauve = vmauve.getY();
  velXmauve = vmauve.getVelocityX(); 
  velYmauve = vmauve.getVelocityY();
/*   
  posXrose = vrose.getX();
  posYrose = vrose.getY();
  velXrose = vrose.getVelocityX(); 
  velYrose = vrose.getVelocityY();
  */
  posXbrun = vbrun.getX();
  posYbrun = vbrun.getY();
  velXbrun = vbrun.getVelocityX(); 
  velYbrun = vbrun.getVelocityY();
  
  posXrouge = vrouge.getX();
  posYrouge = vrouge.getY();
  velXrouge = vrouge.getVelocityX(); 
  velYrouge = vrouge.getVelocityY();
  
  posXvertp = vvertp.getX();
  posYvertp = vvertp.getY();
  velXvertp = vvertp.getVelocityX(); 
  velYvertp = vvertp.getVelocityY();

  posXbleup = vbleup.getX();
  posYbleup = vbleup.getY();
  velXbleup = vbleup.getVelocityX(); 
  velYbleup = vbleup.getVelocityY();
  
  posXorange = vorange.getX();
  posYorange = vorange.getY();
  velXorange = vorange.getVelocityX(); 
  velYorange = vorange.getVelocityY();
  
  posXcitron = vcitron.getX();
  posYcitron = vcitron.getY();
  velXcitron = vcitron.getVelocityX(); 
  velYcitron = vcitron.getVelocityY();

  posXjaune = vjaune.getX();
  posYjaune = vjaune.getY();
  velXjaune = vjaune.getVelocityX(); 
  velYjaune = vjaune.getVelocityY();
  
  posXvertf = vvertf.getX();
  posYvertf = vvertf.getY();
  velXvertf = vvertf.getVelocityX(); 
  velYvertf = vvertf.getVelocityY();

  posXbeige = vbeige.getX();
  posYbeige = vbeige.getY();
  velXbeige = vbeige.getVelocityX(); 
  velYbeige = vbeige.getVelocityY();

  posXnoir = vnoir.getX();
  posYnoir = vnoir.getY();
  velXnoir = vnoir.getVelocityX(); 
  velYnoir = vnoir.getVelocityY();
 
 // println("postion X de la voiture mauve "+ posXmauve + "postion Y de la voiture mauve "+ posYmauve);
  //println("velocite X de la voiture mauve "+ velXmauve + "velocite Y de la voiture mauve "+ velYmauve);

  world.step(); // Executer une etape de la simulation
 
  // if (posXmauve >40){vmauve.adjustPosition(40,posYmauve);}
  if (posYbleuf > 38 ){vbleuf.setPosition(posXbleuf, 38);}
  if (posXmauve > 168){vmauve.setPosition(168, posYmauve);}
    if (posXmauve < 168){vmauve.setPosition(168, posYmauve);}
/*  if (posYrose > 103){vrose.setPosition(posXrose, 103);}
    if (posYrose < 103){vrose.setPosition(posXrose, 103);}*/
  if (posXbrun > 234){vbrun.setPosition(234, posYbrun);}
    if (posXbrun < 234){vbrun.setPosition(234, posYbrun);}
  if (posYrouge > 170){vrouge.setPosition(posXrouge, 170);}
    if (posYrouge < 170){vrouge.setPosition(posXrouge, 170);}
  if (posYvertp > 235){vvertp.setPosition(posXvertp, 235);}
    if (posYvertp < 235){vvertp.setPosition(posXvertp, 235);}
  if (posXbleup > 103){vbleup.setPosition(103, posYbleup);}
    if (posXbleup < 103){vbleup.setPosition(103, posYbleup);}
  if (posXorange > 39){vorange.setPosition(39, posYorange);}
    if (posXorange < 39){vorange.setPosition(39, posYorange);}
  if (posYcitron < 360){vcitron.setPosition(posXcitron, 360);}
    if (posYcitron > 360){vcitron.setPosition(posXcitron, 360);}
//  if (posXjaune > 297){vjaune.setPosition(297, posYjaune);}
    if (posXjaune < 359){vjaune.setPosition(359, posYjaune);}
  if (posXvertf < 168){vvertf.setPosition(168, posYvertf);}
    if (posXvertf > 168){vvertf.setPosition(168, posYvertf);}
  if (posYbeige < 297){vbeige.setPosition(posXbeige, 297);}
    if (posYbeige > 297){vbeige.setPosition(posXbeige, 297);}
  if (posYnoir < 233){vnoir.setPosition(posXnoir, 233);}
    if (posYnoir > 233){vnoir.setPosition(posXnoir, 233);}
  
 
  world.step(); // Executer une etape de la simulation
  world.draw(this); // Dessiner la simulation
  
}
/*
void mousePressed() {
        println("Clique: x "+mouseX+" y "+mouseY);

}
*/

