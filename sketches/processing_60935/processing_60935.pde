
void setup () {
 size(800,600) ;
 smooth();
background (255);  
  
}




int stil=1;
int groesse=30; 



void draw () {  

  
  
  if (mousePressed) {  
      if (stil == 3 ) { 
        
        float distanz = dist(mouseX,mouseY,pmouseY,pmouseY) ; 
        fill(0); 
        stroke(0); 
        
        

        ellipse(mouseX,mouseY,distanz/5,distanz/5) ;       
        }
          
          
      
      if (stil == 2 ) {
     
        noStroke();
        fill(36,132,random(100,255),50); 
        ellipse(mouseX+random(groesse*-1,groesse+50),mouseY+random(groesse*-1,groesse+50),groesse,groesse);   
      }
  
       
      if (stil ==1) { 
        
        line(pmouseX+random(groesse*-1,groesse),pmouseY+random(groesse*-1,groesse),mouseX,mouseY); 
        
      }
      
      
      if (stil ==4) { 
        
        line(pmouseX+300,pmouseY+300,mouseX,mouseY); 
        
      }
 
 
  }
  
  
}




void keyPressed () {
      
       if (key == '1') { 
         stil = 1 ; 
       }
       
       if (key == '2') { 
         stil = 2 ; 
       } 
       
       if (key == '3') { 
         stil = 3 ; 
       }
       
       
         if (key == '4') { 
         stil = 4 ; 
       }
       
       
        if (key == ' ') { 
         background(255) ; 
         groesse = 30 ; 
       }
        
        
  
       if (key == '+') {
        groesse = groesse + 5;
        }
        
        if (key == '-') {
        groesse = groesse - 5;
        }
        
    }

