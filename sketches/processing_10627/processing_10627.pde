
/* zeichne eine monsterrrrr mit den befehlen: */
   
class MyMonster
{
    float xp, yp;
    float w, h;
    
    boolean isOver;
    boolean isPressed;
  
    void init ()
    {
      noStroke();
      smooth();

        xp = 30;
        yp = 30;
        
        w = 250;
        h = 250;
    }
    
    void drawMe ()
    {
      pushMatrix();
      translate( xp, yp );
      fill(255);
      beginShape();
        vertex(30,150);
        bezierVertex(  50, -20,  230, -70,  270, 150);
        vertex(270, 250);
        vertex(30,250);
      endShape();
     
      fill(200);
      ellipse(90, 120, 20, 20);
      ellipse (200, 120, 20, 20);
      ellipse(150, 200, 100, 30);
     
      fill(255);
      rect(80, 97, 160, 20);
      triangle(170,183,180,200,190,183);
       
      for (int i=0; i<width; i++)
      {
        float x = map( mouseX,    0, width,    85, 95 );
        float x2 = map( mouseX,    0, width,    195, 205 );
        
        fill(0);
        ellipse(x, 122, 10, 10);
        ellipse(x2, 122, 10, 10);   
      }
      popMatrix();

    }
    
    
    void testMouseOver (float mx, float my)
    {
      isOver = (mx > xp) && (mx < xp+w) && (my > yp) && (my < yp+h);
    }
  
    void testMousePressed ( float mx, float my )
    {
      testMouseOver( mx, my);
      isPressed = isOver;
    }
    
    void moveIfPressed ( float xd, float yd )
    {
      if ( isPressed )
      {
        xp += xd;
        yp += yd;
      }
    }
  
    void released ()
    {
      isPressed = false;
    }
}
   

MyMonster mm;   
  
 
void setup()
{
  size( 300, 300 );
  
  mm = new MyMonster();
  mm.init();
}
 
void draw ()
{
  background( 100 );
   mm.drawMe();  
}


void mouseMoved ()
{
    mm.testMouseOver( mouseX, mouseY );
}

void mousePressed ()
{
    mm.testMousePressed( mouseX, mouseY );   
}

void mouseDragged ()
{
    mm.moveIfPressed( mouseX-pmouseX, mouseY-pmouseY );
}

void mouseReleased ()
{
    mm.released();
}


