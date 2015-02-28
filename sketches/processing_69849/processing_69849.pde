
/*****************************************
 * Assignment #1
     // a.k.a. Wide Awake
 * Name:         Chloe Patton
 * E-mail:       cfpatton@brynmawr.edu  
 * Course:       CS 110 - Section 001
 * Submitted:    09-12-2012
 * 
 * Staring eyeballs with color-changing irises within decorative borders.
***********************************************/

void setup ( )
{  
size (500, 500) ;
stroke (0) ;

fill (0) ;
noStroke( ) ;
rect ( 0, 50, 500, 400) ;

fill(255, 0, 0) ;
rect(0, 50, 500, 62) ;
rect(0, 388, 500, 62) ;

fill (255) ;
stroke (255, 0, 0) ;
noSmooth ( ) ;
strokeWeight (3) ;
strokeCap (ROUND) ;
ellipseMode (CENTER) ;
  ellipse (125, 250, 175, 175) ;
ellipseMode (CENTER) ;
  ellipse (375, 250, 175, 175) ;

}

void draw( )
{
frameRate(30) ;
fill( random(255), random(255), random(255) ) ;
stroke(0) ;
  smooth( ) ;
  strokeWeight(1) ;
ellipseMode (CENTER) ;
  ellipse(125, 250, 100, 100) ;
ellipseMode(CENTER) ;
  ellipse(375, 250, 100, 100) ;
  
fill(0) ;  
ellipseMode(CENTER) ;
  ellipse(125, 250, 30, 30) ;
ellipseMode(CENTER) ;
  ellipse(375, 250, 30, 30) ;

fill(255) ;
stroke(random(255), random(255), random(255) ) ;
  noSmooth( ) ;
  strokeWeight(2) ;
ellipseMode(CENTER) ;
  ellipse(126, 245, 5, 5) ;
  ellipse(377, 245, 5, 5) ;


fill( random(255), random(255), random(255) ) ;
stroke (255) ;
smooth( ) ;
strokeWeight(5) ;
  line(0, 50, 50, 50) ;
  line(450, 50, 500, 50) ;
  beginShape(TRIANGLE_STRIP);  
  vertex(0, 50); 
  vertex(0, 0); 
  vertex(50, 50);  
  vertex(100, 0);  
  vertex(150, 50);  
  vertex(200, 0);  
  vertex(250, 50);  
  vertex(300, 0);  
  vertex(350, 50) ;
  vertex(400, 0) ;
  vertex(450, 50) ;
  vertex(500, 0) ;
  vertex(500, 50) ;
  endShape( ); 
line(0, 450, 50, 450) ;
line(450, 450, 500, 450) ;
  beginShape (TRIANGLE_STRIP) ;
  vertex(0, 450) ;
  vertex(0, 500) ;
  vertex(50, 450) ;
  vertex(100, 500) ;
  vertex(150, 450) ;
  vertex(200, 500) ;
  vertex(250, 450) ;
  vertex(300, 500) ;
  vertex(350, 450) ;
  vertex(400, 500) ;
  vertex(450, 450) ;
  vertex(500, 500) ;
  vertex(500, 450) ;
  endShape( ) ;


  
}

