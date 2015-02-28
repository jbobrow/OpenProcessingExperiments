
// Screen setup 
     void setup() {
       size(601, 601);
       stroke(255,0,0);
       background(0);
     } 

// Line drawing
     void draw() {
       fill(random(0),0,0,23);
       rect(mouseX,mouseY,random(0,width-mouseX),random(0,height-mouseY)); 
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


