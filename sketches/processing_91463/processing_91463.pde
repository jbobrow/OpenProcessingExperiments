
/*alexandra merski amerski@andrew.cmu.edu
copyright alexandra merski 2013 pittsburgh*/


float cx, cy, cd, cxSpeed;
float rx, ry, rd, rxSpeed;

void setup(  )
{
   size( 400, 400 ); 
   smooth( );
   background( 250, 246, 242);
   frameRate (30);
   cx= 10;
   cy=15;
   cxSpeed= .3;
   ry= 200;
   rx=10;
   rxSpeed= 5;
}

void draw( )
{
  prepWindow();
  moveCarrot( );
 
  drawCarrot( cx, cy, cd);
  cx= cx+2;
  cy=cy+1;
  
  drawRaddish (rx, ry, rd);
  moveRaddish ( );
}
void prepWindow( )
{
  fill( 255);
  rect( 0, 0, width, height );
}

void drawCarrot( float x, float y, float d )  // defining the carrot
{
  noStroke ( ); 
    fill( 247, 142, 12 );
    
    
    triangle(x, y, (x+50), (y), (x+25), (y+90)); //body
    ellipse((x+25), (y+20), 20, 20);
    
    fill (255);
    ellipse((x+13), (y+10), 6,6);//whites
    ellipse((x+35), (y+10), 6,6);
    
    fill (52, 33, 4);
    ellipse((x+13), (y+10), 2,2);//pupils
    ellipse((x+35), (y+10), 2,2);
    
    fill (165, 87, 23);
    ellipse((x+25), (y+21), 14, 14);
    
  
    fill( 247, 142, 12 );//negative of mouth
    ellipse((x+25), (y+20), 12, 13);
    rect   ((x+15), (y+13), 25, 10);
    
    fill (143, 224, 149);

beginShape ( );//green leaves
  vertex ((x+18), (y   ));
  vertex ((x+ 2), (y-20));
  vertex ((x+15), (y-17));
  vertex ((x+24), (y-40));
  vertex ((x+27), (y-13));
  vertex ((x+38), (y-19));
  vertex ((x+34), (y   ));
endShape   ( );
    
    if (mousePressed == true) {
    background( 250, 246, 242);
}
}
void drawRaddish (float rx, float ry, float d)
{
  fill (227, 14, 32);
  ellipse (rx, ry, 77, 70);
   
    fill (255);
    ellipse((rx-7), (ry-6), 6,6);//whites
    ellipse((rx+12), (ry-6), 6,6);
    
    fill (78, 134, 98);
    ellipse((rx-7), (ry-6), 2,2);//pupils
    ellipse((rx+12), (ry-6), 2,2);

    beginShape ( );//leaves
      vertex ((rx-12), (ry-30));
      vertex ((rx-19), (ry-40));
      vertex ((rx-6), (ry-36));
      vertex ((rx+3), (ry-43));
      vertex ((rx+6), (ry-36));
      vertex ((rx+16), (ry-40));
      vertex ((rx+12), (ry-30));
    endShape   ( );
 
    fill (139, 7, 25);
    ellipse((rx), (ry+9), 18, 18);
    
    fill(227, 14, 32 );//negative of mouth
    ellipse((rx), (ry+9), 16, 17);
    rect   ((rx-9), (ry), 29, 8);
    
    
    if (mousePressed == true) {
    background( 250, 246, 242);

    }
  
  
}

void moveRaddish ( )
{
   rx = rx + rxSpeed; 
   if ( rx > width )
   {
     rxSpeed = -rxSpeed;  // move left
   }
   else if( rx < 0 ) 
   {
     rxSpeed = -rxSpeed;  // move right
   } 
}

void moveCarrot( )
{
  cx = cx  + cxSpeed;
  if( cx > width + cd*.50 ) 
  {
    cx = 0;
    cy = 0;
  }
}






