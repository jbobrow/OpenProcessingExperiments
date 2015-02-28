
/*////////////////////////////
Florence Labelle
EDM4600
TP2 - Tapisserie
///////////////////////////*/


int rayon = 27;  //distance entre le point de départ d'un arc et son extrémité
int sz = 55;  //définit la grosseur de l'arc
float noiseScale=0.5;
float r,g,b;
float rrg,grg,brg;


void setup(){
  size(400, 400);  //définit la grosseur du canevas
  smooth();
  strokeWeight(2);  //définit la taille du trait
  stroke(255);  //couleur du trait par défaut(blanc)
  newColor();
  frameRate(20);
  
}



void draw(){
  background(0);  //couleur de l'arrière-plan
  
  
  //////////////// ARCS DE COULEUR ///////////////////////

  fill(random(255), random(255), random(255), random(255));  //couleur aléatoire
    for ( int x = 50 ; x <400 ; x+=60 ) {  //première boucle (largeur: x)
      for ( int y = 45 ; y <400 ; y+=100 ) {  //deuxième boucle (hauteur: y)
       arc(x, y, sz, sz, 0, PI/2);  //arc en bas à droit
  fill(random(255), random(255), random(255), random(255));  //couleur aléatoire
       arc(x, y, sz, sz, PI, TWO_PI-PI/2);  //arc en haut à gauche
 
 
 
   if ( random(100) < 2 ) {  //couleur aléatoire progressive
     newColor();
     }
     r = ( rrg - r ) / 100 + r;  //paramètres pour le niveau de rouge
     g = ( grg - g ) / 40 + g;  //paramètres pour le niveau de vert
     b = ( brg - b ) / 80 + b;  //paramètres pour le niveau de bleu
     fill(r,g,b);  //remplit le cercle d'une couleur, mode RGB
  
  
  
  ////////////// CERCLE COMPLET, APPARAIT ///////////////
  
 float distance = dist( mouseX , mouseY , x , y );  //calcule la distance en le centre de deux arcs et leur extrémité
  if ( distance < rayon ) {  // la souris est alors par-dessus
      ellipse(x, y, sz, sz);  //si la souris est par-dessus, un cercle de couleur apparait
      
     } else {
      noFill();  //sinon, le cercle est invisible
  } 
  ellipseMode(RADIUS);  //le cercle est dessiné en fonction de la longueur de son rayon
     noFill();
     noStroke();
     ellipse(x, y, rayon, rayon);  //dessine le cercle invisible, celui qui n'apparait que lorsque la souris est par-dessus
  
  
  
  
  //////////////// OVALE + CERCLE CENTRAL ///////////////////
  
  ellipseMode(CENTER);  //le cercle est dessiné en fonction de son centre
     stroke(255);
     ellipse(x, y, 30, 40);  //oval central, gros
     fill(255);  //remplit en blanc
     ellipse(x, y, 10, 10);  //cercle central, petit
  
    
  
  
  /////////////// ARC QUI TOURNE AUTOUR DU POINT BLANC /////////////////
  
  fill(random(255), random(255), random(255), random(255));  //couleur aléatoire
    if ( mousePressed ) {  //lorsque l'on clique sur la souris, l'arc qui tourne s'active
      pushMatrix();
      translate(x, y);  //translation de l'arc qui tourne au pt (35, 35)
      rotate(radians(frameCount * 3  % 360));  //avance de 3 à ch. frameCount, sur un angle de 360o
        arc(0, 0, 55, 55, 0, PI/2);  //paramètres de l'arc qui tourne
      popMatrix();
 
     } else {
      rotate(0);  //si on ne clique pas, l'arc ne tournera pas
  }

  }

    }
  /////////////// LIGNES VERTICALES //////////////////////
 
  for(int x=20; x < width; x+=60) {    //Position x et limite des lignes verticales
    for(int y=0; y < height/2; y+=50) {    //Position x et limite des lignes verticales
     float noiseVal = noise((mouseX+x)*noiseScale, 
                            mouseY*noiseScale);
     stroke(noiseVal*255);
     line(x, mouseY+noiseVal*20, x, height);
    
  }
  }
  
  //////////////// LIGNES HORIZONTALES /////////////////////
 
  for(int y=0; y < height; y+=100) {     //Position y et limite des lignes horizontales
    for(int x=0; x < width/2; x+=1) {     //Position y et limite des lignes horizontales
     float noiseVal = noise((mouseY+y)*noiseScale, 
                            mouseX*noiseScale);
     stroke(noiseVal*255);
     line(mouseX+noiseVal*20, y, width, y);
      
     
  }
  }
}

  /////////////// RANGE DE COULEURS POUR CERCLE COMPLET //////////////////
void newColor() {
   rrg = random(256);
   grg = random(256);
   brg = random(256);
}


/*
void mousePressed() {
        println("Clique: x "+mouseX+" y "+mouseY);
}
*/


