


class Munster
{
  
  /***************************************** zum spielen */
  
  float grrrrrFaktor = 8;          // Allgemeine Stärke von Allem
  float wolkengroesse = 12;           // Wolkengröße  
  int wolkenStaerke = 50;         // Transparenz bis 255
  float abklingenDerWolken = 13;   // Transparenz d. Hintergrunds
  float streuung = 2;                // Streuungsweite der Wolken
  float augenfaktor = 5;           // irgendso ein Faktor für die "Augen"
  float mundAufreissFaktor = 2;  // Groooaaarrrr
  
/***************************************** krimskrams */
float grr; float groar;
float angle;
float rndRadius;
int rndX1;  int rndY1;
float cloudsize; float cloudrange;
int nr = 1;
int wolkenfarbe;

float xPos;
float yPos;

float xSpeed;
float ySpeed;
  
  
  Munster()
  {
    xPos = random( width );
    yPos = random( height );
    
    xSpeed = random( -6, 6 );
    ySpeed = random( -6, 6 );
    
    wolkenfarbe = int( random( 255 ) );
  }  
  
  void moveMe ()
  {
    xPos += xSpeed;
    yPos += ySpeed;
    
    if ( xPos < 0 || xPos > width ) xSpeed *= -1;
    if ( yPos < 0 || yPos > height ) ySpeed *= -1;
    
    this.drawMe();
  }
    
  void drawMe ()
  {
    /***************************************** hintergrund */
//    pushStyle();
//      fill( 255, abklingenDerWolken );
//      rect( 0, 0, width, height );
//    popStyle();
  
    /***************************************** mausbewegung */
//    grr = sqrt( sq( mouseX-pmouseX) + sq( mouseY-pmouseY ) )*grrrrrFaktor;
    grr = sqrt( sq( xSpeed ) + sq( ySpeed ) )*grrrrrFaktor;
    groar = grr*mundAufreissFaktor;
    
    /***************************************** monster */
    pushMatrix();
      translate( xPos, yPos );       // position
  

      
      pushMatrix();
      scale(0.4);
      wolken();
      ei();
      mund();
      augen();
      popMatrix();
   
    popMatrix();
  }
  
  void wolken() {
    
        cloudsize = wolkengroesse * grr;
    cloudrange = streuung * grr;
    
      angle = random( 360 );                // der ganze zufalls klimbim
      rndRadius = random( cloudrange );
      rndX1 = int( 0+rndRadius*cos( angle ) );
      rndY1 = int( 0+rndRadius*sin( angle ) );    
    
    pushStyle();                          // wolken zeichnen
      colorMode( HSB );
      fill( wolkenfarbe, 255, 255, wolkenStaerke);
      ellipse( rndX1, rndY1, cloudsize, cloudsize );
    popStyle();   
  }
    
  void ei() {

    pushStyle();
      fill( 200 );
    beginShape();
      vertex( 100.0 , 0.0 );
      bezierVertex(  100.0, -200.0, -100.0, -200.0, -100.0,   0.0 );
      bezierVertex( -100.0,    0.0, -100.0,  100.0,    0.0, 100.0 );
      bezierVertex(    0.0,  100.0,   90.0,  100.0,  100.0,  -1.0 );
    endShape();
    popStyle();
  }

  void mund() {
  
    pushStyle();
      fill( 0 );
    beginShape();
      vertex( -50.0 , 50.0 );
      bezierVertex( -50.0 , 50.0 , 0.0 , 50.0 , 50.0 , 50.0 );
      bezierVertex( 50.0 , 50.0 , 0.0 , 50.0-groar+(ohmycount*6), -50.0 , 50.0 );
    endShape();
    popStyle();
  }

  void augen() {

    pushStyle();
      stroke( 0 );
      strokeWeight( 2 );
    for ( int i = 0; i < grr/9; i++) {
      line( -60, -5, -60-random( grr*augenfaktor ), -5-random( grr*augenfaktor ) );
      line(  60, -5,  60+random( grr*augenfaktor ), -5-random( grr*augenfaktor ) );
    }
    popStyle();
  }
}


