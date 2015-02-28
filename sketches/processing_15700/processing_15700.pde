
color parapluie = color(170,240,180);
color nuage = color(240,180,240);
int nbcouleurs = 0;
int lignes;


void setup() {
  size(300,500);
  background(200,180,240);
  lignes = 0;
}

void draw() {

  fill(nuage);           //couleur et contour du nuage.
  stroke(255);
  strokeWeight(3);
  arc(75,128,40,40,PI/1.18, TWO_PI-PI/3);
  arc(115,118,60,60,PI,TWO_PI-PI/3);
  arc(225,128,40,40,TWO_PI-PI/1.4, TWO_PI+3);
  arc(185,118,60,60,TWO_PI-PI,TWO_PI);
  arc(150,108,80,80,PI,TWO_PI);
  arc(45,148,20,20,PI/2,TWO_PI-PI/2);
  arc(255,148,20,20,PI,TWO_PI+1);
  line(45,158,259,158);
  line(45,138,256,138);
  
  
  
  fill(nuage);      //couleur et forme du nuage.
  noStroke();
  ellipse(75,128,40,40);
  ellipse(115,118,60,60);
  ellipse(225,128,40,40);
  ellipse(185,118,60,60);
  ellipse(150,108,80,80);
  rect(45,138,210,20);
  ellipse(45,148,20,20);
  ellipse(255,148,20,20);
  
  
  lignes = 12;          //différentes lignes qui créent la pluie.
  while(lignes<64) {
  fill(random(255),255,255,100);
  rect(lignes*4,160,1,352);
  lignes++;
  }
 
   
  fill(200,180,240);         //espace sous le parapluie où l'eau ne passe pas.
  rect(102,380,95,130);
  
  
  fill(parapluie);      //couleur et forme du parapluie.
  stroke(255);
  bezier(100,380,100,300,200,300,200,380);
  line(100,380,200,380);
  
  fill(255);     //contour du parapluie.
  strokeWeight(3);
  line(150,380,150,460);
  noFill();
  strokeWeight(2.5);
  arc(140,460,20,20,PI-PI,PI);
  }
  
 
  void mouseClicked() {      //changement de couleur dès que l'on clique.
   nbcouleurs = nbcouleurs + 1;
   if(nbcouleurs == 1) {
     parapluie = color(233,189,124);
   }else if(nbcouleurs == 2){
     parapluie = color(147,204,247);
   }else if(nbcouleurs == 3){
     parapluie = color(193,134,189);
   }else if(nbcouleurs == 4) {
     nbcouleurs = -1;
     parapluie = color(237,138,124);
   }else if(nbcouleurs == 0) {
     parapluie = color(170,240,180);
   }
   
 }
     
     
