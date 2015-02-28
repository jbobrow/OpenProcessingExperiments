
/* ---------------------------------------
MONSTRE
par
Guillaume Perreault Roy
----------------------------------------*/
float feuX,feuY,oeilG,oeilD; //facteurs de modification des points composant le feu et les yeux

boolean modeFeuX,modeFeuY,modeOeilG,modeOeilD; // Modification des points du feu (et les yeux) en mode expansion ou retraction

void setup()  {

  size(400,400);

  strokeWeight(8);
  
  frameRate(30);
  
  feuX = 0;
  feuY = 5;
  modeFeuX = true;
  modeFeuY = true;
  oeilG = 20;
  oeilD = 20;
  modeOeilG = true;
  modeOeilD = true;
  
}


  


void draw() {

  float x;
  float y;
  
  x = 0;
  y = 0;

  smooth(); // rhooooooooooooooooo les beeeeeeelles lignes!

  strokeJoin(BEVEL);

  rectMode(CENTER); 
  
  noStroke();

  background(255, 204, 100); // booya de la couleur RGB
  
  fill(68, 112, 255); //De la couleur Bleue
  
  rect(200,83,410,200); // Le ciel


  fill(255, 0, 0); //De la couleur Rouge
  
  stroke(0,0,0);
  
  ellipse(x+220,y+70,50,50); //Crete1
  ellipse(x+162,y+77,50,50); //Crete2
  ellipse(x+126,y+122,50,50); //Crete3
  
  ellipse(x+110,y+237,30,30); //Crete4
  ellipse(x+80,y+251,30,30); //Crete5
  ellipse(x+50,y+246,27,27); //Crete6
  
  fill(55, 404, 100); //De la couleur Verte
  
  rect(x+150,y+180,60,70); //derriere de bouche(masque)
  
  //Pieds de monstre 
  
  int pied =1; // initialisation
  int piedX =125;
  
  while ( pied < 4 ) { // condition
  
    arc(x+piedX,y+305,25,25,0,PI); //piedgauche
    arc(x+piedX+100,y+305,25,25,0,PI); //pieddroit
  
    pied +=1;
    piedX +=25;
  
  }
  
  if ( pied == 4 ) { // condition
    arc(x+150,y+305,75,75,PI,PI*2); //piedgauche
    arc(x+250,y+305,75,75,PI,PI*2); //pieddroit
    pied +=1;
  }
  
  
  rect(x+200,y+250,160,80); // corps
  
  arc(x+200,y+150,160,160,PI,PI*2); //tete
  
  line(x+180,y+150,x+280,y+150); // ligne de bouche
  
  noStroke();
  rect(x+150,y+200,51,70); //masque pour cacher ligne de corps de trop
  stroke(0);
  
  rectMode(CORNER);
  noStroke();
  rect(x+120,y+220,5,70); //masque pour cacher ligne de la queue
  stroke(0);
  
  beginShape();  // Queue de monstre
  curveVertex(x+89, y+186); //Point de contrôle 1
  curveVertex(x+120, y+220);
  curveVertex(x+91, y+252);
  curveVertex(x+41, y+245);
  curveVertex(x+43, y+267);
  curveVertex(x+122, y+290);
  curveVertex(x+232, y+224); //Point de contrôle 2
  endShape();
  
  fill(175, 76, 164); //Couleur des yeux
  
  // Les 8 commandes suivantes gèrent un effet d'aller-retour de la grosseur des yeux
  if(oeilG<80 && modeOeilG==true){ //Pour l'oeil Gauche
    oeilG += random(8);
  }
  if(oeilG>79 && modeOeilG==true){
   modeOeilG=false;
  }
  if(oeilG>40 && modeOeilG==false){
    oeilG -= random(8);
  }
  if(oeilG<41 && modeOeilG==false){
   modeOeilG=true;
  }
 
 if(oeilD<60 && modeOeilD==true){ //Pour l'oeil Droit
    oeilD += random(5);
  }
  if(oeilD>59 && modeOeilD==true){
   modeOeilD=false;
  }
  if(oeilD>40 && modeOeilD==false){
    oeilD -= random(5);
  }
  if(oeilD<41 && modeOeilD==false){
   modeOeilD=true;
  }
  
  ellipse(x+190,y+97,oeilG/2,oeilG/2); //Yeux
  ellipse(x+150,y+137,oeilD/2,oeilD/2);
  
  fill(255, 255, 255); // Couleur des dents
  
  //Dents de monstre 
  
  int dents =1; // initialisation
  int dentsX =190;
  
  while ( dents < 4 ) { // condition
  
  triangle(x+dentsX,y+150,x+dentsX+30,y+150,x+dentsX+15,y+170); //(rangée du haut)
  triangle(x+dentsX-10,y+210,x+dentsX+20,y+210,x+dentsX+5,y+190); //(rangée du bas)
  
  dents +=1;
  dentsX +=30;
  }
  
  noFill();   //Main du monstre
  arc(x+147,y+245,20,20,1.2,PI);
  arc(x+177,y+249,20,20,0,2);
  arc(x+160,y+250,20,20,0,PI);
  
  fill(255, 0, 0, 200); //De la couleur Rouge
  
  // Les 8 commandes suivantes gèrent un effet d'aller-retour du feu sur une 20aine de pixel
  if(feuX<30 && modeFeuX==true){ //Pour l'axe des X
    feuX += random(4);
  }
  if(feuX>29 && modeFeuX==true){
   modeFeuX=false;
  }
  if(feuX>0 && modeFeuX==false){
    feuX -= random(4);
  }
  if(feuX<1 && modeFeuX==false){
   modeFeuX=true;
  }
 
 
 if(feuY<30 && modeFeuY==true){ //Pour l'axe des Y
    feuY += random(4);
  }
  if(feuY>29 && modeFeuY==true){
   modeFeuY=false;
  }
  if(feuY>0 && modeFeuY==false){
    feuY -= random(4);
  }
  if(feuY<1 && modeFeuY==false){
   modeFeuY=true;
  }
  
  beginShape();  // Feu de monstre
  curveVertex(x+380+feuX, y+39+feuY); //Point de contrôle 1
  curveVertex(x+373+feuX/3, y+175+feuY/3);
  curveVertex(x+311+feuX/8, y+204+feuY/8);
  curveVertex(x+290+feuX/16, y+180+feuY/16);
  curveVertex(x+313+feuX/8, y+157+feuY/8);
  curveVertex(x+373+feuX/3, y+175+feuY/3);
  curveVertex(x+401+feuX, y+6+feuY); //Point de contrôle 2
  endShape();

}

/* L'utilisation de la fonction void est tirée de l'exemple ÉVÈNEMENT ALÉATOIRE
par Thomas O Fredericks (http://www.openprocessing.org/visuals/?visualID=20044),
implantée par essai/erreur. */                              
