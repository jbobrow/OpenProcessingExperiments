
class Branche{
  //================================================
  //Déclaration des variables globales de la classe
  //================================================
  PImage fleur;
 
  int nbCircle=0;
  int increment;
  
  float p0x, p1x, p2x, p3x;
  float p0y, p1y, p2y, p3y;
  float pos0x, pos1x,  pos2x, pos3x;
  float pos0y, pos1y,  pos2y, pos3y;
  float rayon = 20.0;
  float rayon2 = rayon;
  float res  = 100.0;
  float next = 1.0/res;
  float nbAleatDiminution, nbAleatSize, nbAleatSize2, aleatCircle;
  float perlx;
  float perly;
  float positionX, positionY;
  
  boolean dessin=false;
  boolean fin=false;
  
  //========================================================
  // Constructeur de la classe Branche
  //========================================================
  Branche(float posX, float posY,int nbFleur){
    nbAleatDiminution= random(0.2, 0.5);
    fleur=loadImage("data/fleur_"+nbFleur+".png");
    aleatCircle=int(random(7,20));
    positionX = posX;
    positionY = posY;
    
  }
  //========================================================
  // ***Cette fonction a été pris de BezierNecklace_1***
  // Génére la courbe, dessine les cercles sur la courbe et 
  // fait apparaître la fleur au bout
  //========================================================
   void creationCourbe(){
    
    creationPoint();
    recursiveTest( 0.0, next );
    drawCurve();
    
  }
//========================================================
// ***Cette fonction a été pris de BezierNecklace_1***
// Elle permet de calculer la distanc entre deux points et de 
// dessiner les cercle sur la courbes
//========================================================
void recursiveTest(float t1, float t2) {
  
  if( t2 < 1.0 ) {
    // J'ai changé la condition pour rapproché les cercles
    if( distance(t1,(t2-(rayon/2))) >= rayon ) {
      drawCircle(t2);
      nbCircle++;
      
      t1 = t2;
    }
    recursiveTest( t1, t2+next);
  }
}
//========================================================
// Elle permet de calculer la distanc entre deux points et de 
// dessiner les cercle sur la courbes. Cette fonction est 
// utiliser pour les tige des plantes
//========================================================
void recursiveTestTige(float t1, float t2) {
  
  if( t2 < 1.0 ) {
    // J'ai changé la condition pour rapproché les cercles
    if( distance(t1,(t2-(rayon2/2))) >= rayon2 ) {
      drawCircleTige(t2);
      nbCircle++;
      
      t1 = t2;
    }
    recursiveTestTige( t1, t2+next);
  }
}
//===================================================
// ***Cette fonction a été pris de BezierNecklace_1***
// Dessine une courbe selonn des points prédéterminer
//===================================================
void drawCurve(){
  noFill();
  bezier( p0x,p0y, p1x,p1y, p2x,p2y, p3x,p3y );
}

//===============================================================
// Dessine les cercles le long de la courbes de la fleur principal
//===============================================================
void drawCircle( float here ) {
  noStroke();
  fill(7,100,8);
  perlx = BezierPos( p0x,p1x,p2x,p3x, here );
  perly = BezierPos( p0y,p1y,p2y,p3y, here );
  
  //Quand le rayon est rendu trop petit, il dessine la fleur 
  //et arrête de dessiner
  if(rayon<=5){
    //Si la fleur est dessiner ne fait plus rien
    if(dessin){
    
    }else{
      nbAleatSize= random(60,120);
      dessineImagefleur(perlx, perly, nbAleatSize, dessin);
    }
    
  }
  // 
  else{
    //Lorsqu'il arrive au nombre de cercle déterminer par aleatCircle et il crée un tige où poussera
    // une nouvelle fleur
    if(nbCircle==aleatCircle){
      
    pos1x = posPoint();
    pos2x = posPoint();
    pos3x = posPoint()+10;
   
    pos1y = posPoint();
    pos2y = posPoint();
    pos3y = posPoint()+10;
    
    recursiveTestTige( 0.0, next );
    noFill();
    bezier(perlx,perly, pos1x, pos1y, pos2x, pos2y, pos3x, pos3y );
    
    }
   
    increment=int(random(-1.5,1.5));// Fait varier la position, pour créer un effet de torsion
    ellipse( (perlx+increment),perly, rayon, rayon );
    rayon = rayon-nbAleatDiminution;
    rayon2= rayon;
  }
  
}
//================================================================
// Dessine les cercles le long de la courbes des tiges
//================================================================
void drawCircleTige(float here){
   noStroke();
  fill(7,100,8);
  float cerclex = BezierPos( perlx,pos1x,pos2x,pos3x, here );
  float cercley = BezierPos( perly,pos1y,pos2y,pos3y, here );
  if(rayon2<=5){
    if(fin==true){
    
    }else{
      fill(255);
      nbAleatSize2=random(40,60);
      image(fleur, cerclex,cercley, nbAleatSize2, nbAleatSize2);
      fin=true;
    }
     
  }else{
    ellipse( cerclex ,cercley, rayon2, rayon2 );
     rayon2 = rayon2-1;
  }
 
}
/* =============================================================
// ***Cette fonction a été pris de BezierNecklace_1***
// Mesure la distance entre deux locations, soit deux cercles
// ============================================================ */
  float distance(float t1, float t2) {
    
    float x1 = BezierPos( p0x,p1x,p2x,p3x, t1 );
    float y1 = BezierPos( p0y,p1y,p2y,p3y, t1 );
    float x2 = BezierPos( p0x,p1x,p2x,p3x, t2 );
    float y2 = BezierPos( p0y,p1y,p2y,p3y, t2 );
  
    return dist(x1,y1, x2,y2);
  }
  //===============================================
  // Crée les points de la courbe de bézier
  //===============================================
  void creationPoint(){
    p0x = (width/2)+positionX; // La position initiale est choisis aléatoirement dans le cadre du mot 
    p1x = posPoint();
    p2x = posPoint();
    p3x = posPoint()+10;
    p0y = (height/2)+positionY;// La position initiale est choisis aléatoirement dans le cadre du mot 
    p1y = posPoint();
    p2y = posPoint();
    p3y = posPoint()+10;
  }
  float posPoint() {
    return random( (width/50), width-(width/50) );
  }
// ============================================================
// BEZIER FORMULA : On détermine quatre position et une variation
// ============================================================
  float BezierPos( float P0, float P1, float P2, float P3, float T ) {
    return P0*(pow((1-T),3)) + P1*3*T*pow((1-T),2) + P2*3*T*T*(1-T) + P3*pow(T,3);
  }

// ============================================================
//  Dessine la fleur au bout de la courbe
// ============================================================ 
  
  void dessineImagefleur(float posX, float posY, float grosseur, boolean dessiner){
    imageMode(CENTER);
    image(fleur,posX, posY, grosseur, grosseur);
    dessin=true;
  }
}

