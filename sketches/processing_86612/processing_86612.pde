
/* homework 3 sijiaw

      copyright shirley wang 2013 */
      

float x, y, wd, ht;
int counter = 1;

void setup ( )
{
    size ( 400, 400 );
    x  = width;
    y  = height;
    wd = width  * .5;
    ht = height * .5;
    
    background ( 139, 126, 124 );
    
    
}

void draw ( )
{
  
  
   float line1 = map( mouseX, 0, height, 0, 400);
   float line2 = map( mouseY, 0,  width, 0, 400);
   float line3 = map( mouseX, 0, height, 400, 0);
   float line4 = map( mouseY, 0,  width, 400, 0);
   
   fill ( 139, 126, 124, 40 );
   strokeWeight ( 8 );
   ellipse ( line1, line2, width * .1, height * .1);
   ellipse ( line2, line1, width * .1, height * .1);
   strokeWeight ( 4 );
   ellipse ( line3, line4, width * .1, height * .1);
   ellipse ( line4, line3, width * .1, height * .1);
   
   float distX = mouseX - x;
   float distY = mouseY - y;
   
   x = x + distX;
   y = y + distY;
   
   if (counter == 1) {
   stroke ( mouseY, 237, 204 );
   noFill (  );
   }
   
   else if (counter == 2) {
   stroke ( mouseY, 204, 203 );
   noFill (  );
   
   }
   
   if (mousePressed == true) {
   ellipse ( x, y, wd * .1, ht * .1);   
   }

}

void mouseReleased ( ) {
  counter++;
  if (counter == 3) {
      counter = 1;
  }
}



