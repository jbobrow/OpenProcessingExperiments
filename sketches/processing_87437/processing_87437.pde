
/*alexandra merski amerski@andrew.cmu.edu
copyright alexandra merski 2013 pittsburgh*/

float veggies; 
void setup(  )
{
   size( 400, 400 ); 
   smooth( );
   background( 250, 246, 242);
   
   veggies = 100;
}

void draw( )
{
   drawCarrot( 100, 150 );
  
}

void drawCarrot( float x, float y )  // defining the carrot
{
  noStroke ( ); 
    fill( 247, 142, 12 );
    
    frameRate (3.2);
    triangle(mouseX, mouseY, (mouseX+50), (mouseY), (mouseX+25), (mouseY+90)); //body
    ellipse((mouseX+25), (mouseY+20), 20, 20);
    
    fill (255);
    ellipse((mouseX+13), (mouseY+10), 6,6);//whites
    ellipse((mouseX+35), (mouseY+10), 6,6);
    
    fill (52, 33, 4);
    ellipse((mouseX+13), (mouseY+10), 2,2);//pupils
    ellipse((mouseX+35), (mouseY+10), 2,2);
    
    fill (165, 87, 23);
    ellipse((mouseX+25), (mouseY+21), 14, 14);
    
  
    fill( 247, 142, 12 );//negative of mouth
    ellipse((mouseX+25), (mouseY+20), 12, 13);
    rect   ((mouseX+15), (mouseY+13), 25, 10);
    
    fill (143, 224, 149);

beginShape ( );//green leaves
  vertex ((mouseX+18), (mouseY   ));
  vertex ((mouseX+ 2), (mouseY-20));
  vertex ((mouseX+15), (mouseY-17));
  vertex ((mouseX+24), (mouseY-40));
  vertex ((mouseX+27), (mouseY-13));
  vertex ((mouseX+38), (mouseY-19));
  vertex ((mouseX+34), (mouseY   ));
endShape   ( );
    
    if (mousePressed == true) {
    background( 250, 246, 242);
}
}






