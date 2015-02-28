
  
  //*************///////////////////
  // Mouches à marde // Par Xavier Bégin-Leblanc.
  //*************///////////////////
 
  /*TP3-Simulation
  Se présente une nouvelle mouche à tous les 1.875 seconde, et le diamètre de son corps est différent d'apparitions en apparitions.
  
  Le jeu pourrait etre de detruire des mouche le plus possible avant que le soleil se couche ou bien
  que la pluie vienne g^cher ce spectacle naturel, présent plus souvent qu'autrement dans les contrés agricoles lointaines! 

/////////********Déclaration des variables*****////////////////

float X = 0;
float Y = 0;
int temps;
ArrayList mouche;
///float angle = atan2(cibleY-Yy, cibleX-Xx);
//float distance = dist(cibleX, cibleY, Xx, Yy);
//Xx= cos()*min(vitesse, distance) + Xx;          eventuellement, les nuages bougeront et pourront faire tomber de la pluie 
//Yy = sin(angle)*min(vitesse, distance) + Yy;


void setup() {
  
size (400,400);
smooth();

mouche = new ArrayList(); 
temps=millis();

}
void draw() {
background(77,159,250);

/*Contrainte qui permet a une nouvelle mouche d'appara^itre aux 1.875 seconde, et le diamètre
de cette derniere différera de façon aléatoire.*/

if (millis() - temps > 1877) {
  temps = temps + 2000;
  color c = color(0,0,0);
  constrain(200,300,500);
  Mouche b = new Mouche (random(width), random(height), random(1,5), c);
  mouche.add(b);

}



//////////BACKGROUND////////// 

  noStroke();
  fill(104,155, 5);
  rect(0,180, 400,250);
  
///////Tas de défécation///////  
stroke  (125,88,0);
fill    (159,113,2);
ellipse (200,220, 135,60);
ellipse (200,200, 110,45);
ellipse (200,180, 90,40);
ellipse (200,160, 50, 30);

//Les nuages
noStroke();
fill(255);
  ellipse(X+36,Y+ 72, 135, 50);
  ellipse(X+203,Y+ 13, 120,40);
  ellipse (X+314,Y+ 122, 100, 20);

//Début de la boucle pour les mouches.
for ( int i = 0 ; i < mouche.size() ; i++ ) {
     Mouche b = (Mouche) mouche.get(i);
     b.draw();}
}


///Condition "physique" des mouches.///

// Pour bien comprendre, la variable "d" consiste en fait au diamètre du corps de la mouche.

class Mouche {
  float x,y,d;
  color c;
  
  Mouche (float x, float y, float d, color c){
  this.x =x;
  this.y = y;
  this.d= d;
  this.c= c;
}

void draw() {
  x = x + random(-1,1);
  y = y + random(-1,1);
  
  noStroke();
  fill(0);
  ellipse (x, y, 4, 4);
  fill(255);
  ellipse(x+2,y,3,2);
  ellipse(x-2,y+2,d,d);
}


}
void mousePressed() {
  println("Clique x"+mouseX+" y "+mouseY);
}










