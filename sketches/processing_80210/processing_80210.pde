
PImage bg;
int a;


 
 
void setup () {
  size (700, 465);
  smooth ();
   bg = loadImage("car.jpg");
   background(bg);
    



  
}
void draw () {
   
  if (mousePressed) {
  stroke (0);
  float r = random (12, 30);
  strokeWeight (r);
  line (pmouseX, pmouseY, mouseX, mouseY);
  filter(BLUR,.9);
   



 
   
   
 }
 
    if (keyPressed) {
      if (key == '1') {
        background(bg);



      }    
     }
     
     if (key == '2') {
 
       fill (300,20);
       ellipse (399, 200, 50, 50);
        fill (244);
       ellipse (400, 123, 70, 70);
        fill (30);
       ellipse (375, 144, 40, 40);
        fill (300);
       ellipse (500, 200, 10, 10);
        fill (390);
       ellipse (510, 210, 10, 10);
       fill (300);
       ellipse (700, 325, 20, 20);
       fill (29);
       ellipse (600, 300, 30, 30);
       fill (30);
       ellipse (400, 111, 10, 10);
       fill (100);
       ellipse (300, 222, 10, 10);
       fill (4);
       ellipse (10, 20, 300, 300);
       fill (230);
       ellipse (100, 50, 200, 200);
       fill (140);
       ellipse (20, 100, 50, 50);
       
 
        
     }
      
      if (key == '3') {
 
        noStroke ();
       fill (200,20);
       ellipse (600, 200, 50, 50);
        fill (200,20);
       ellipse (100, 23, 70, 70);
        fill (200,20);
       ellipse (675, 44, 40, 40);
        fill (200,20);
       ellipse (50, 250, 10, 10);
        fill (100);
       ellipse (310, 110, 10, 10);
       fill (100);
       ellipse (200, 225, 20, 20);
       fill (100);
       ellipse (700, 50, 30, 30);
       fill (100);
       ellipse (500, 151, 10, 10);
       fill (100);
       ellipse (300, 100, 10, 10);
       fill (100);
       ellipse (300, 120, 150, 150);
       fill (100);
       ellipse (700, 150, 200, 200);
       fill (100);
       ellipse (200, 20, 50, 50);
 
 
      }
        
       if (keyPressed) {
         if (key == '4') {
              float r = random (20, 30);
              strokeWeight (32);
         stroke (255);
  line (pmouseX, pmouseY, mouseX, mouseY);
  filter(BLUR,.9);
         }



        
     }
      
            if (keyPressed) {
         if (key == '5') {
              float r = random (20, 30);
              strokeWeight (32);
         stroke (0);
  line (pmouseX, pmouseY, mouseX, mouseY);
  filter(BLUR,.9);
 
         }
               
     }
      
     }


