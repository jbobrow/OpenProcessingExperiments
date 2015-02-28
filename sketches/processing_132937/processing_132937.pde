

float a = 0;
float x;
float y;

void setup() {
  size( 512, 512 );
}

void draw() {
  background( 255 );
  stroke(1);
  strokeWeight( 10 );
  
  x = sin( a/10 );
  y = cos( a/10 );
  a++;
  
  translate( width/2+50*sin(a/50), 50+height/2+50*cos(a/50) );

  
  // EARS
  fill( 255, 153, 102);
  ellipse( -100, 0, 50, 50 );
  ellipse( 100, 0, 50, 50 );
  
  
  // HEAD
  ellipse( 0, 0, 200, 200 );
  
  // TONGUE
  noStroke();
  fill( 204, 51, 51 );
  rect( 0, 70+x*10, 50, 50, 0, 0, 50, 50);
  
  // MOUTH
  stroke( 10 );
  fill( 255, 153, 102);
  arc(0, 20, 100, 100, radians(45), radians(135));
  noStroke();
  rect(0, 40, 50, 20 );
  
  // EYES
  stroke( 10 );
  fill( 255 );
  ellipse( -40, -20, 50, 50 );
  ellipse( 40, -20, 50, 50 );
  ellipse( -40+x*5, -20+y*5, 10, 10 );
  ellipse( 40-y*5, -20-x*5, 10, 10 );
  
  // HAT
  fill( 51 );
  rectMode( CENTER );
  rect( 0, -150, 150, 150, 100, 100, 0, 0);
  rect( 0, -75, 200, 50, 25, 25, 25, 25);
 
  // BACKEN
  noStroke();
  fill( 204, 51, 51 );
  ellipse( -65, 25, 25 , 25 );
  ellipse( 65, 25, 25, 25 );
  
  println(x);
}





