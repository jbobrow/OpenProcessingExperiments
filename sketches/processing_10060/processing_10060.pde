
void setup(){ 
size( 500, 500 );
background(255); 
 
smooth();
noStroke();
 


}

void draw(){

  boolean flipflop = false;

  int step = 10;
  
  float z = 0;

  for ( int r = width; r >= 0; r-=step )
{
 
  
    // flip fill color
    if ( flipflop )
        fill ( 0 );
    else
        fill( 255 );
     
    flipflop = !flipflop;
    
  
    ellipse(width/2,height/2 - z * 4, r,r );
    
    z++;
}}





