
// header
/******************************************
*  Processing Sketch Monster
*    
*  This is your first homework:
*  Make a monster like character
*  using simple shapes and color properties
*
*  Devon Hirth
******************************************/

// global variables


// setup
void setup()
{
  size(500, 500);
  smooth();
}

// draw
void draw()
{

  // Skin
  background( 45 , 32 , 25 );
 
  // Eye
  fill( 255 );
  noStroke();
  arc( 250,160 , 202,202 , 0.28 , 2.85 );
  
  // Lids
  fill( 89 , 74 , 65 );
  noStroke();
  arc( 250,205 , 200,200 , 3.3 , 6.1 );
  
  fill( 113 , 101 , 88 );
  noStroke();
  arc( 250,205 , 195,195 , 3.3 , 6.1 );
  
  fill( 154 , 132 , 120 );
  noStroke();
  arc( 250,205 , 185,185 , 3.3 , 6.1 );
  
  fill( 194 , 180 , 154 );
  noStroke();
  arc( 250,205 , 175,175 , 3.3 , 6.1 );
  
  // Eye White
  fill( 234 , 231 , 220 );
  noStroke();
  arc( 250,160 , 203,203 , 0.28 , 2.85 );
  
  fill( 234 , 231 , 220 );
  noStroke();
  arc( 250,205 , 160,160 , 3.3 , 6.1 );
  
  // Iris
  fill( 45 , 28 , 19 );
  noStroke();
  ellipse( 250,195 , 80 , 80 );
  
  fill( 0 );
  noStroke();
  ellipse( 250,195 , 50 , 50 );
  
  // Highlight
  fill( 255 );
  noStroke();
  ellipse( 235,175 , 20 , 20 );
  
  
  // Teeth
  fill( 234 , 231 , 220 );
  triangle( 0,500 , 50,395 , 100,500 );
  
  fill( 234 , 230 , 214 );
  triangle( 100,500 , 150,395 , 200,500 );
  
  fill( 234 , 231 , 220 );
  triangle( 200,500 , 250,395 , 300,500 );
  
  fill( 234 , 230 , 214 );
  triangle( 300,500 , 350,395 , 400,500 );
  
  fill( 234 , 231 , 220 );
  triangle( 400,500 , 450,395 , 500,500 );

}


