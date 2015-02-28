
/**
 *    aufgabe
 *
 *    http://www.rmx.cz/monsters/
 *
 *    fjenett 20080327
 */

/* zeichne eine monsterrrrr mit den befehlen:
   
   point()
   line()
   triangle()
   quad()
   
   rect()
   ellipse()
   
   curve()
   bezier()
   
   fill() / noFill()
   stroke() / noStroke()
   
   smooth() / noSmooth()

*/


    void setup () {

      size (300,300);
      background (255);
      fill (0);
      stroke(255);
      smooth();
    }

// float x = map( i,    0, width,    25, 75 );

    void draw () {
      int m = mouseY;
     
      float x1 = map(m,300,0,20,280);   // körper bewegung
      float x2 = map(m,300,0,270,150);
      
      //augen
      float y1 = map(m,300,0,270,170);
      float y2 = map(m,300,0,269,130);
      // mund
      float z1 = map(m,300,0,275,230);
      float z2 = map(m,300,0,2,70);
      
      float z3 = map(m,300,0,30,100);
      // farbe
      float c1 = map(m,300,0,0,220);
      float c2 = map(m,300,0,255,0);
    
    
       
      background(255);
      noStroke();
  
    
      fill (0);     
      ellipse (150,x2,280,x1);
      
      stroke(c1,0,c2);
      fill (c1,0,c2);
      
      triangle(50,y1,50,y2,80,y1);
      triangle(250,y1,250,y2,220,y1);
      ellipse (150,z1,random(30,z3),random(2,z2));

      
    }

