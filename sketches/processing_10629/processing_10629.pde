
class Monster {

float xp, yp;
  boolean isOver;
  boolean isPressed;


Monster () {        // Constructor, Funktion die nichts zurückgibt und heißt wie die klasse, 
                    // ersetzt init, wir aufgerufen durch blabla = new Monster ()
  xp = random (width-300);
  yp = random (height-300);
}

void drawMe() {
  translate (xp,yp);
  pushMatrix();
      int m = mouseY;
      float h = 800;
     
      float x1 = map(m,h,0,20,280);   // körper bewegung
      float x2 = map(m,h,0,270,150);
      
      // augen
      float y1 = map(m,h,0,270,170);
      float y2 = map(m,h,0,269,130);
      // mund
      float z1 = map(m,h,0,275,230);
      float z2 = map(m,h,0,2,70);
      
      float z3 = map(m,h,0,30,100);
      // farbe
      float c1 = map(m,h,0,0,220);
      float c2 = map(m,h,0,255,0);
    
    
       
    
      fill (0);     
      ellipse (150,x2,280,x1);
      
      stroke(c1,0,c2);
      fill (c1,0,c2);
      
      triangle(50,y1,50,y2,80,y1);
      triangle(250,y1,250,y2,220,y1);
      ellipse (150,z1,random(30,z3),random(2,z2));
  
  popMatrix();
  
  
}  // Ende drawMe



  void testMouseOver (float mx, float my) {
     isOver = (mx > xp) && (mx < xp+280) && (my > yp) && (my < yp+280);  // gibt wahr oder falsch aus, ob maus über dem objekt (außerhalb der kanten der rechtecks)
  }
  
  void testMousePressed (float mx, float my) {
    testMouseOver ( mx, my);
    isPressed = isOver;
    
  }
  
  
  void moveIfPressed (float xd, float yd) {
    if (isPressed) {
      xp += xd;
      yp += yd;
    }
  }
   void released () {
  isPressed = false;
  }



} //Ende class Monster


Monster mr;


void setup () {
  
 size (800,800);
  mr = new Monster ();

  smooth();
  
  
}

void draw () {
  noStroke();
  background (255);
  mr.drawMe();
}


void mouseMoved ()  // alles darin passiert dann wenn sich die maus bewegt
{
  mr.testMouseOver(mouseX, mouseY);
}

void mousePressed () {
  mr.testMousePressed(mouseX, mouseY);
}

void mouseDragged ()
{
    mr.moveIfPressed( mouseX-pmouseX, mouseY-pmouseY );
}


void mouseReleased () {
  mr.released();
}



