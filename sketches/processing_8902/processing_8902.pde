
/**
 *    aufgabe
 *
 *    http://www.rmx.cz/monsters/
 *
 *    fjenett 20080327
 */


void setup () {
        size( 200, 200 );
        
        smooth();
        colorMode(HSB);
    }

    void draw() {
        
        int rr = mouseY/20;
        int rx = mouseX/40;
        background(255);
        
        //strokeWeight (mouseX/10); //feinere Kontrolle /10
        
  fill(0);        

  if (mousePressed)
  
    {
      fill(random(0, 255), 255, 255);  
    }
    
  noStroke();
  ellipse( width/2+random(rr), height/2+random(rr), 100, 100);
  
  fill( 255);
  ellipse (width/2-15+random(rr), height/2-15, 15, 15);
  ellipse (width/2+15+random(rr), height/2-15, 15, 15);

  fill (0);
  ellipse (width/2-15, height/2-15, 5, 5);  
  ellipse (width/2+15, height/2-15, 5, 5);
  
  stroke(255);
  line (width/2-5, height/2-3, width/2-5, height/2+3);
  line (width/2+5, height/2-3, width/2+5, width/2+3);

  if (mousePressed) 
    {
        noFill();
        stroke(255);
        ellipse ( width/2+random(rr), height/2+20+random(rx), random (10,50), 10);
    }
  
    }
  
  

