
/*
Philippe Tardif 
Algorithmie de base et interactivité EDM4600-
Monstre Interactif
Inspiration: Parameters GIR(http://www.openprocessing.org/visuals/?visualID=5890), Goron(Wind Waker)

Interactivite:- Dans le coin, en haut à gauche et bas à droite, le mouvement de la souris
                produit l'apparition de bulles
              - Lorsque l'on clique et on bouge le personnage change de couleur et une
                bulle apparait
*/
//Déclaration des variables globales
int postionX=mouseX;
PImage bgJour;
PImage bgNuit;
PImage tarte;
float angle = 0.0;
//-----------------------------------

void setup(){
  smooth();
  size(400,400);
  colorMode(RGB);
  
  bgJour = loadImage("data/background.jpg");
  bgNuit = loadImage("data/background_nuit.jpg");
  tarte = loadImage("data/tarte.png");
}
void draw(){
//Déclaration des variables--------------------------- 
  int couleurPeau=mouseY/2;
  float tremblement = random(-2,2);
  int x = width/2;
  int y = height/2;
  int limiteCote = int((x-mouseX)/60);
  int limiteHaut = int((y-mouseY)/50);
  int tailleX=0;
  int tailleY=0;
//-----------------------------------------------------
 
 if(mousePressed){
   background(bgNuit);
   fill(255,255,255);
   ellipse(x-79, y-140, 100, 60);
   ellipse(x-38, y-110, 10, 10);
   ellipse(x-27, y-101, 5, 5);
   image(tarte, 102,43);
 }else{
    background(bgJour);
 }

  ellipseMode(CENTER);
 if(mouseX<=250 && mouseY<=150 && mousePressed==false){
   //Bulle de penser  
   fill(255,255,255);
   ellipse(x-73, y-140, 100, 60);
   ellipse(x-38, y-110, 10, 10);
   ellipse(x-27, y-101, 5, 5);
   
   //Texte----
   fill(0,0,0);
   text("Sauvons les citrouilles!!", 93,43,100,60);
 }
 
 if(mouseX>=246 && mouseY>=289 && mousePressed==false){
   //Bulle de penser  
     fill(255,255,255);
     ellipse(x-68, y-145, 130, 50);
     ellipse(x-38, y-110, 10, 10);
     ellipse(x-27, y-101, 5, 5);
   
   //Texte----
     fill(0,0,0);
     text("Non, je ne peux pas!!", 93,43,100,60);
 }

//Jambe, Soulier et pantalon//////////////////////////////////////////////
//Pied Gauche----------------------------------------------
  fill(162,161, 159);
  beginShape();
    curveVertex(x-33,y+156);
    curveVertex(x-33,y+156);
    curveVertex(x-41,y+169);
    curveVertex(x-41,y+183);
    curveVertex(x-25,y+180);
    curveVertex(x-20,y+173);
    curveVertex(x-12,y+152);
    curveVertex(x-25,y+149);
    curveVertex(x-25,y+149);
  endShape(CLOSE);
  
  beginShape();
    curveVertex(x-34,y+168);
    curveVertex(x-34,y+168);
    curveVertex(x-28,y+168);
    curveVertex(x-23,y+170);
    curveVertex(x-23,y+170);
    endShape();
    
    beginShape();
    curveVertex(x-31,y+162);
    curveVertex(x-31,y+162);
    curveVertex(x-24,y+164);
    curveVertex(x-21,y+166);
    curveVertex(x-21,y+166);
    endShape();
//Pied droite----------------------------------------------
  fill(162,161, 159);
  beginShape();
    curveVertex(x+19,y+166);
    curveVertex(x+19,y+166);
    curveVertex(x+32,y+179);
    curveVertex(x+42,y+178);
    curveVertex(x+44,y+167);
    curveVertex(x+36,y+155);
    curveVertex(x+27,y+149);
    curveVertex(x+17,y+149);
    curveVertex(x+14,y+155);
    curveVertex(x+14,y+155);
    endShape(CLOSE);
    
    beginShape();
      curveVertex(x+29,y+169);
      curveVertex(x+29,y+169);
      curveVertex(x+34,y+167);
      curveVertex(x+38,y+166);
      curveVertex(x+38,y+166);
    endShape();
    beginShape();
      curveVertex(x+24,y+163);
      curveVertex(x+24,y+163);
      curveVertex(x+28,y+160);
      curveVertex(x+33,y+158);
      curveVertex(x+33,y+158);
    endShape();
// Jambes----------------------------------------------------

 fill(245, 139, 52);
 if(mousePressed){
  fill(couleurPeau, 200-couleurPeau, 142);
  beginShape();
    curveVertex(x-24,(y+132)+tremblement);
    curveVertex(x-24,(y+132)+tremblement);
    curveVertex(x-24,(y+154)+tremblement);
    curveVertex(x-20,(y+155)+tremblement);
    curveVertex(x-16,(y+155)+tremblement);
    curveVertex(x-16,(y+138)+tremblement);
    curveVertex(x-16,(y+138)+tremblement);
  endShape();
 
  beginShape();
    curveVertex(x+17,(y+132)+tremblement);
    curveVertex(x+17,(y+132)+tremblement);
    curveVertex(x+17,(y+152)+tremblement);
    curveVertex(x+21,(y+153)+tremblement);
    curveVertex(x+26,(y+152)+tremblement);
    curveVertex(x+26,(y+136)+tremblement);
    curveVertex(x+26,(y+136)+tremblement);
  endShape();
  }else{
    beginShape();
      curveVertex(x-24,y+132);
      curveVertex(x-24,y+132);
      curveVertex(x-24,y+154);
      curveVertex(x-20,y+155);
      curveVertex(x-16,y+155);
      curveVertex(x-16,y+138);
      curveVertex(x-16,y+138);
    endShape();
 
    beginShape();
      curveVertex(x+17,y+132);
       curveVertex(x+17,y+132);
      curveVertex(x+17,y+152);
      curveVertex(x+21,y+153);
      curveVertex(x+26,y+152);
      curveVertex(x+26,y+136);
      curveVertex(x+26,y+136);
    endShape();
  } 
//Pantalon-----------------------------------------------------------------
  fill(155,107,45);
  beginShape();
    curveVertex(x-24,y+66);
    curveVertex(x-24,y+66);
    curveVertex(x-32,y+140);
    curveVertex(x-29,y+139);
    curveVertex(x-21,y+143);
    curveVertex(x-15,y+141);
    curveVertex(x-8,y+145);
    curveVertex(x+5,y+91);
    curveVertex(x+6,y+91);
    curveVertex(x+7,y+141);
    curveVertex(x+11,y+140);
    curveVertex(x+18,y+145);
    curveVertex(x+21,y+142);
    curveVertex(x+25,y+145);
    curveVertex(x+29,y+141);
    curveVertex(x+33,y+144);
    curveVertex(x+34,y+62);
    curveVertex(x+34,y+62);
  endShape();
  
  
// CORPS ET BARS DU PERSONnAGE//////////////////////////////////////////
// Corps---------------------------------------------
  fill(185, 17, 17);
  beginShape();
     curveVertex(x-4,y-48);
     curveVertex(x-4,y-48);
     curveVertex(x-19,y-3);
     curveVertex(x-24,y+58);
     curveVertex(x+3,y+65);
     curveVertex(x+7,y+66);
     curveVertex(x+34,y+58);
     curveVertex(x+40,y+03);
     curveVertex(x+32,y-44);
     curveVertex(x+32,y-44);
 endShape();
//Détails chandail------------------------------------------------
 beginShape();
     curveVertex(x+10,y-20);
     curveVertex(x+10,y-20);
      curveVertex(x+8,y+15);
     curveVertex(x+5,y+36);
     curveVertex(x+3,y+65);
     curveVertex(x+3,y+65);
   endShape();
   
   fill(0,0,0);
   ellipse(x+4, y-3, 4, 4);// Bouton du haut
   fill(0,0,0);
   ellipse(x+1, y+36, 4, 4);// Bouton du bas
   
// Main Gauche-------------------------------------------------------
  fill(245, 139, 52);
  if(mousePressed){
  fill(couleurPeau, 200-couleurPeau, 142);
   beginShape();
       curveVertex(x-35,(y+58)+tremblement);
       curveVertex(x-35,(y+58)+tremblement);
       curveVertex(x-40,(y+68)+tremblement);
       curveVertex(x-40,(y+70)+tremblement);
       curveVertex(x-37,(y+69)+tremblement);
       curveVertex(x-39,(y+74)+tremblement);
       curveVertex(x-37,(y+79)+tremblement);
       curveVertex(x-30,(y+77)+tremblement);
       curveVertex(x-29,(y+73)+tremblement);
       curveVertex(x-30,(y+81)+tremblement);
       curveVertex(x-27,(y+87)+tremblement);
       curveVertex(x-23,(y+77)+tremblement);
       curveVertex(x-25,(y+69)+tremblement);
       curveVertex(x-18,(y+69)+tremblement);
       curveVertex(x-22,(y+54)+tremblement);
       curveVertex(x-22,(y+54)+tremblement);
   endShape();
 }else{
   beginShape();
       curveVertex(x-35,y+58);
       curveVertex(x-35,y+58);
       curveVertex(x-40,y+68);
       curveVertex(x-40,y+70);
       curveVertex(x-37,y+69);
       curveVertex(x-39,y+74);
       curveVertex(x-37,y+79);
       curveVertex(x-30,y+77);
       curveVertex(x-29,y+73);
       curveVertex(x-30,y+81);
       curveVertex(x-27,y+87);
       curveVertex(x-23,y+77);
       curveVertex(x-25,y+69);
       curveVertex(x-18,y+69);
       curveVertex(x-22,y+54);
       curveVertex(x-22,y+54);
   endShape();
 }
// Main droite---------------------------------------------------
 if(mousePressed){
   fill(couleurPeau, 200-couleurPeau, 142);
   beginShape();
       curveVertex(x+26,(y+61)+tremblement);
       curveVertex(x+26,(y+61)+tremblement);
       curveVertex(x+22,(y+66)+tremblement);
       curveVertex(x+20,(y+71)+tremblement);
       curveVertex(x+28,(y+70)+tremblement);
       curveVertex(x+24,(y+82)+tremblement);
       curveVertex(x+25,(y+88)+tremblement);
       curveVertex(x+29,(y+86)+tremblement);
       curveVertex(x+32,(y+77)+tremblement);
       curveVertex(x+31,(y+86)+tremblement);
       curveVertex(x+37,(y+84)+tremblement);
       curveVertex(x+40,(y+80)+tremblement);
       curveVertex(x+41,(y+75)+tremblement);
       curveVertex(x+40,(y+74)+tremblement);
       curveVertex(x+40,(y+67)+tremblement);
       curveVertex(x+40,(y+67)+tremblement);
   endShape();
 }  
 else{
   beginShape();
       curveVertex(x+26,y+61);
       curveVertex(x+26,y+61);
       curveVertex(x+22,y+66);
       curveVertex(x+20,y+71);
       curveVertex(x+28,y+70);
       curveVertex(x+24,y+82);
       curveVertex(x+25,y+88);
       curveVertex(x+29,y+86);
       curveVertex(x+32,y+77);
       curveVertex(x+31,y+86);
       curveVertex(x+37,y+84);
       curveVertex(x+40,y+80);
       curveVertex(x+41,y+75);
       curveVertex(x+40,y+74);
       curveVertex(x+40,y+67);
       curveVertex(x+40,y+67);
   endShape();
 }
 //Bicep gauche---------------------------------------------------
  fill(185, 17, 17);
  beginShape();
     curveVertex(x-4,y-48);
      curveVertex(x-4,y-48);
     curveVertex(x-20,y-40);
     curveVertex(x-38,y+3);
     curveVertex(x-18,y+15);
     curveVertex(x-11,y-2);
     curveVertex(x-11,y-2);
 endShape();
 fill(185, 17, 17);
 beginShape();
     curveVertex(x-39,y+3);
     curveVertex(x-39,y+3);
     curveVertex(x-39,y+58);
     curveVertex(x-22,y+55);
     curveVertex(x-20,y+27);
     curveVertex(x-13,y+8);
     curveVertex(x-13,y+8);
 endShape();

// Bras Droite-------------------------------------------------------

  beginShape();
     curveVertex(x+29,y-2);
      curveVertex(x+29,y-2);
     curveVertex(x+32,y+18);
     curveVertex(x+54,y+19);
     curveVertex(x+51,y-16);
     curveVertex(x+32,y-44);
     curveVertex(x+32,y-44);
 endShape();
 beginShape();
     curveVertex(x+29,y+12);
     curveVertex(x+29,y+12);
     curveVertex(x+33,y+37);
     curveVertex(x+26,y+62);
     curveVertex(x+40,y+66);
     curveVertex(x+52,y+34);
     curveVertex(x+56,y+4);
     curveVertex(x+56,y+4);
 endShape();

//Cou----------------------------------------------------------------------
  if(mousePressed){
    fill(couleurPeau, 200-couleurPeau, 142);  
  } else{
    fill(245, 139, 52);
  }
   beginShape();
     curveVertex(x+1,y-56);
     curveVertex(x+1,y-56);
     curveVertex(x,y-48);
     curveVertex(x-3,y-46);
     curveVertex(x+10,y-21);
     curveVertex(x+19,y-33);
     curveVertex(x+31,y-43);
     curveVertex(x+29,y-47);
     curveVertex(x+29,y-47);
  endShape(CLOSE);
  
  beginShape();//Hypiglote
     curveVertex(x+7,y-43);
     curveVertex(x+7,y-43);
     curveVertex(x+12,y-41);
     curveVertex(x+18,y-42);
     curveVertex(x+18,y-42);
 endShape();
  
//TETE DU PERSONNAGE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 if(mousePressed){
  fill(couleurPeau, 200-couleurPeau, 142);
  ellipse(x+15, (y-80)+tremblement, 75,70);//tete
 }else{
   fill(245, 139, 52);
   ellipse(x+15, y-80, 75,70);//tete
 }

//Ligne du visage--------------------
   beginShape();
     curveVertex(x-11,y-85);
     curveVertex(x-11,y-85);
     curveVertex(x-10,y-67);
     curveVertex(x-5,y-52);
     curveVertex(x-5,y-52);
  endShape();
  beginShape();
     curveVertex(x+8,y-84);
     curveVertex(x+8,y-84);
     curveVertex(x+6,y-68);
     curveVertex(x+9,y-47);
     curveVertex(x+9,y-47);
  endShape();
  beginShape();
     curveVertex(x+21,y-83);
     curveVertex(x+21,y-83);
     curveVertex(x+23,y-66);
     curveVertex(x+20,y-47);
     curveVertex(x+20,y-47);
  endShape();
  beginShape();
     curveVertex(x+36,y-81);
     curveVertex(x+36,y-81);
     curveVertex(x+37,y-67);
     curveVertex(x+30,y-49);
     curveVertex(x+30,y-49);
  endShape();

//yeux du personnage-------------------
 
  fill(252, 252, 252);
  ellipse(x+25,y-79,15,15);//globe droit
  
  fill(0, 0, 0);
  
  //Condition pour limiter le mouvement de l'oeil gauche
 if(mousePressed){
   noFill(); 
   strokeWeight(1.5);
   pushMatrix();
   translate(x+25,y-78);
   rotate(frameCount*0.1);
    beginShape();
     curveVertex(0, 0);
     curveVertex(0, 0);
     curveVertex(2, 0);
     curveVertex(3, -4);
     curveVertex(-2, -5);
     curveVertex(-4, -1);
     curveVertex(-2, 3);
     curveVertex(-2, 3);
   endShape();
   popMatrix();
   strokeWeight(1);
 }
 else{
    if(mouseY<111){
      ellipse((x+25)-limiteCote,y-79,5,5);
    }else{
      ellipse((x+25)-limiteCote,(y-78)-limiteHaut,5,5);
    }
 }
  fill(252, 252, 252);
  ellipse((x-1),(y-81),15,15);//globe gauche
  fill(0, 0, 0);
  
 //Condition pour limiter le mouvement de l'oeil droit
  if(mousePressed){
     noFill();
     strokeWeight(1.5);
     pushMatrix();
     translate(x,y-80);
     rotate(frameCount*0.1);
     beginShape();
       curveVertex(0, 0);
       curveVertex(0, 0);
       curveVertex(4, -2);
       curveVertex(3, -4);
       curveVertex(-3, -5);
       curveVertex(-4, -1);
       curveVertex(-1, 3);
       curveVertex(-1, 3);
     endShape();
     popMatrix();
     strokeWeight(1);  
  }  
  else{ 
    if(mouseY<111){
       ellipse((x-1)-limiteCote,y-81,5,5);
     }else{
       ellipse((x-1)-limiteCote,(y-80)-limiteHaut,5,5);
     }
  } 

//Bouche------------------------------------
   if(mousePressed == true){
     fill(0, 0, 0);
     tailleX=4;
     tailleY=3;
  }else{
     tailleX=8;
     tailleY=6;
  }
  ellipse(x+15,y-55,tailleX,tailleY);

//Nez---------------------------------------
 noFill();
  beginShape();
    curveVertex(x+9,y-72);
    curveVertex(x+9,y-72);
    curveVertex(x+11,y-76);
    curveVertex(x+15,y-70);
    curveVertex(x+15,y-70);
  endShape();
//Cheveux---------------------------------------
  fill(255,248,198);
  beginShape();
     curveVertex(x-24,y-84);
     curveVertex(x-24,y-84);
     curveVertex(172,y-76);
     curveVertex(177,y-78);
     curveVertex(182,y-72);
     curveVertex(188,y-83);
     curveVertex(x+9,y-81);
     curveVertex(x+14,y-74);
     curveVertex(x+15,y-83);
     curveVertex(x+36,y-78);
     curveVertex(x+43,y-70);
     curveVertex(x+46,y-77);
     curveVertex(x+54,y-60);
     curveVertex(x+58,y-74);
     curveVertex(x+58,y-74);
  endShape();

//Chapeau du personnage/////////////////////////////////////////
  fill(118,65,14);
  beginShape();
     curveVertex(x-37,y-81);
     curveVertex(x-37,y-81);
     curveVertex(x+14,y-80);
     curveVertex(x+64,y-72);
     curveVertex(x+57,y-108);
     curveVertex(x+54,y-180);
     curveVertex(x+37,y-181);
     curveVertex(x+21,y-184);
     curveVertex(x-16,y-104);
     curveVertex(x-16,y-104);
  endShape(CLOSE);

//Ligne dans le chapeau----------------------------------------
  fill(118,65,14);
  beginShape();
     curveVertex(x+12,y-169);
     curveVertex(x+12,y-169);
     curveVertex(x+35,y-167);
     curveVertex(x+55,y-162);
     curveVertex(x+55,y-162);
  endShape();
  beginShape();
     curveVertex(x+6,y-156);
     curveVertex(x+6,y-156);
     curveVertex(x+32,y-157);
     curveVertex(x+55,y-149);
     curveVertex(x+55,y-149);
  endShape();
   beginShape();
     curveVertex(x,y-142);
     curveVertex(x,y-142);
     curveVertex(x+28,y-145);
     curveVertex(x+55,y-135);
     curveVertex(x+55,y-135);
  endShape();
  beginShape();
     curveVertex(x-4,y-129);
     curveVertex(x-4,y-129);
     curveVertex(x+26,y-131);
     curveVertex(x+55,y-120);
     curveVertex(x+55,y-120);
  endShape();
   beginShape();
     curveVertex(x-10,y-116);
     curveVertex(x-10,y-116);
     curveVertex(x+20,y-117);
     curveVertex(x+55,y-107);
     curveVertex(x+55,y-107);
  endShape();
  line(x-16, y-105,x+58, y-97);
  line(x-27, y-93,x+62, y-85);
}

