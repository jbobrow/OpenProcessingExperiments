
/* par Xavier Lévesque le 7 septembre 2012
*/
float rads=0;
float cbLigne1=0;
float cbLigne=0;
float incrementation1 = TWO_PI/60;

int etatRect = 0;
int etatCercle1 = 0;

//void--------------------
void setup() {
  size(400,400);
  smooth();
}

//void--------------------
void mousePressed(){  
  if (dist(mouseX, mouseY, 150, 200) < 30) {
    
//BOUTON CERCLE
if (etatCercle1 == 0) {
  etatCercle1 = 1;
}

else {
  etatCercle1 = 0;
  
}
  }
  
//BOUTON RECTANGLE
if (mouseX > 300-30 && mouseX < 300 + 30 && mouseY < 200+30 && mouseY > 200-30) {
  etatRect = 1;
  
}
}

//void--------------------
void mouseReleased() {
  etatRect = 0;
}

//void--------------------
void draw() {
  background(0);
  
  //LIGNES
  float incRayon = 0;
  while (incRayon < cbLigne) {
    stroke (222,199,212);
    line(0, incRayon, 400, incRayon);  
    incRayon +=15;
  }
  
//RECTANGLE INTERACTION

if (etatRect == 0){
  fill (20,150,0);
  if (cbLigne> 0)
  cbLigne -= 10;
  
}
else {
  fill (20,100,150);
  if (cbLigne < 400)
  cbLigne +=10;
  
}
rectMode(CENTER);
noStroke();
rect(300,200,60,60);

//CERCLEINTER

 if ( etatCercle1 == 0)
 {
   fill(20,200,0);
    
   if (cbLigne1 > 0) { cbLigne1 = cbLigne1 - 0.1;
    
   }
 }
  
 else
 {
   fill(20,200,200);
    
   if (cbLigne1 < TWO_PI) { 
     cbLigne1 +=0.07;
   }
 }
 
 //DRAW CERCLE
 noStroke();
 ellipse (150, 200, 50,50);
  
//DRAW LES LIGNES AUTOUR DU CERCLE
fill(24,24,24);
rads = 0;
while (rads < cbLigne1) {
  float sommetX1, sommetY1, sommetX2, sommetY2;
  stroke (200,200,140);
  strokeWeight(2);
   
  sommetX1 = 150 +cos(rads) * 45;
  sommetY1 = 200 + sin(rads) *45;
  sommetX2 = 150 + cos(rads) *75;
  sommetY2 = 200 + sin(rads) *75;
  line(sommetX2, sommetY1, sommetX2, sommetY2);
  rads += incrementation1;
}
}



