
/**
 *    Verwandelt eines eurer Monster in ein Objekt!
 */
boolean doDrag = false;

float xp, yp;
float xs, ys;
    
Munster ohmy;

void setup ()
{
    size( 600, 600 );
    noStroke();
    smooth();
   
    ohmy = new Munster(50,30); // Munster (auge, mund);
}

void draw ()
{
    background( 255 );
    
    ohmy.moveMe();
    ohmy.drawMe();
}

void mouseDragged ()
{
  if ( doDrag )
    {
      xp += mouseX - pmouseX;
      yp += mouseY - pmouseY;
     }
    }
    
void mouseReleased ()
  {
    doDrag = false;
  }

void mousePressed ()
{
  if ( isOver(mouseX, mouseY) ) 
  {
    doDrag = true;
  }
}

boolean isOver ( float xx, float yy ) 
{   
   
    return    xx > xp-200
           && xx < xp+400
           && yy > yp-200
           && yy < yp+400; 
    }

