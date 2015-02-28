

PShape s; 

//where the game starts
int x = 50; 


int y = 450; 


   void setup() { 


     size(500, 600); 


     textSize(30); 


     textAlign(CENTER); 


       


      } 


   


   void draw() {  


     fill(90, 200, 220,15); 


     rect(0, 0, width, height); 


     fill(255); 


     text("play with arrow and mouse", 250, 250); 


    if (keyPressed && (key == CODED)) {  // If it’s a coded key 


    if (keyCode == LEFT) { 


      x--; 


    } else if (keyCode == RIGHT) { 


      x++; 


    } else if (keyCode == UP) { 


      y--; 


    } else if (keyCode == DOWN) { 


      y++; 


}  


} 


  





//robot below 



noStroke();
fill(RGB);
//ellipse(x-17.5, y-65, 35, 35); // Left eye dome
ellipse(x-17.5, y+65, 35, 35); // Right eye dome

fill(255);
ellipse(x-14, y-65, 8, 8); // Left eye
ellipse(x+14, y-65, 8, 8); // Right eye




  beginShape();
fill(255);


vertex(mouseX-50, mouseY-85); 
bezierVertex(mouseX-50, mouseY-90, -10, -95, -50, -60); 
vertex(x-50, y-85); 
bezierVertex(x-50, y-90, -90, -95, -50, -60); 
endShape();
   






  






  




  




  







} 



