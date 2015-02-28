
     float r; 
     float g; 
     float b; 
     float a; 
     float diam; 
     float x; 
     float y; 
     float margin;
   
   void setup()  {  
        size (800,600); 
        background(0); 
        smooth(); 
    }   
    
   void draw()  {  
        // Fill all variables with random values 
        r = random(255); 
        g = random(255); 
        b = random(10); 
        a = random(255); 
        diam = random(300); 
        x = random(width); 
        y = random(height); 
        margin = (100);
        
        // Use values to draw an ellipse 
        noStroke(); 
        fill(r,0,b,a); 
        ellipse(x,y,diam,diam); 
                    
         rectMode(CORNERS); 
             fill(255);
             noStroke ();
                 rect (width/2-margin,height/2-margin,width/2+margin+5,height/2+margin+5);
                 
             noFill();
             strokeWeight (10);
             stroke (0);
                 rect (width/2-margin,height/2-margin,width/2+margin,height/2+margin);
        
            noFill();
            strokeWeight(5);
            stroke (0);
                  line (width/2-30, height/2+30,width/2-20,height/2+50);
                  line (width/2-20, height/2+50,width/2-10,height/2+30);   
                  line (width/2+30, height/2+30,width/2+20,height/2+50);
                  line (width/2+20, height/2+50,width/2+10,height/2+30);     
            
            if (mousePressed == true) {
            fill (0);
            noStroke();
            ellipse (width/2-40, height/2-20,30,30);
            ellipse (width/2+40, height/2-20,30,30);
          } else {
            float e = random (30);
            fill (0);
            noStroke();
            ellipse (width/2-40, height/2-20,30,e);
            ellipse (width/2+40, height/2-20,30,e);
          }
        }    
        
  void mousePressed() {
       background();
       }
     



