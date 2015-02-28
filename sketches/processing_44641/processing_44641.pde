
void setup () {

  size (400, 600);

  background (255, 255, 255);
  
  noStroke();

}

 

void draw () {

  frameRate (40);
  
  int x = 100;
  int y = 100;

  if (mousePressed) {

    fill(0);

  
  
      if (keyPressed) {
        
        
        
        if (key == '1' || key == '!') {

          fill (255, 0, 0);

        }

     

        if (key == '2' || key == '"') {

          fill (0, 255, 0);

        }

       

        if (key == '3' || key == '§') {

          fill (0, 0, 255);

        }

       
       if (key >= '4' && key <= '6') {
         
         noStroke ();
         
         fill (random (255), random (255), random (255));
         
       }
       
       if (key >= '7' && key <= '9') {
         
         stroke (0);
         
         fill(random (255), random (255), random (255));
         
       }
       
       
       if (key == '0') {
         
         stroke (random (255), random (255), random (255));
         
         fill(random (255), random (255), random (255));
         
       }


        if (key == 'a' || key == 'A') {

          noStroke();

          fill(random (255), random (255), random (255));

          ellipse(mouseX + random(-20, 20), mouseY + random(-20, 20), 2, 2);

        }
        
        
         if (key == 'w' || key == 'W') {
          
          stroke (random (255), random (255), random (255));
          
          arc (mouseX, mouseY, mouseX-0, mouseY+0, 0, 3.141);
          
        }
        
        
        if (key == 's' || key == 'S') {
          
          stroke (random (255), random (255), random (255));
          
          arc (mouseX, mouseY, mouseX-0, mouseY+0, 3, 3.141);
          
        }

 

        if (key == 'y' || key == 'Y') {

          fill(0, 230, 220);

          triangle(mouseX, mouseY, 10, 10, 3, 7);

        }
        
        
       if (key == 'd') {
         
         triangle(mouseX,mouseY,mouseX+10,mouseY+10,mouseX+10,mouseY-10);

      }
      
      
        if (key == 'q') {
          
          rect (mouseX, mouseY, 10,10);
          
        }
        

  }     
  
  if (mouseX >= x ) {

  ellipse(mouseX, mouseY, 10, 10);
  
  }else{
    
  ellipse(mouseX + random(-20, 20), mouseY + random(-20, 20), 2, 2);
  
}
  }

}

