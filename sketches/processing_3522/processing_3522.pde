
// Screen setup 
     void setup() {
       size(601, 601);
       print("Use Arrow keys to switch colours, and click to clear screen");
       stroke(#FFF30A);
       background(0);
     } 

// Line drawing
     void draw() {
       line(300, 300, mouseX, mouseY);
     }
// Clear action
     void mousePressed() {
        background(0);
     }
// Colour Change          
     void keyPressed() {
        if (key == CODED) 
        if (keyCode == UP) 
        stroke(#03FFEC);
        else if (keyCode == DOWN) 
        stroke(#16FF03);
        else if (keyCode == LEFT) 
        stroke(#FFF30A);  
        else if(keyCode == RIGHT) 
        stroke(#FC17E6);
     }     
     
     

