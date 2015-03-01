
/*
 MONSTER-GUY
*/

void setup() {
  size(840, 560); 
  noStroke(); }
  
void draw() {
  background(0);
  text(mouseX + " , " + mouseY, 20, 20);
  
    fill(#464848);
    arc(160, 160, 200, 200, PI, TWO_PI);
  
    fill(#464848);
    arc(360, 160, 200, 200, PI, TWO_PI);
  
    fill(#1AFFE2);
    ellipse(152, 144, 72, 72);
  
    fill(#1AFFE2);
    ellipse(352, 144, 72, 72);
  
    fill(#0A0A0A);
    ellipse(152, 144, 50, 50);
  
    fill(#0A0A0A);
    ellipse(352, 144, 50, 50);
  
    fill(#F5F5F5);
    ellipse(152, 144, 30, 30);
    
    fill(#F5F5F5);
    ellipse(352, 144, 30, 30);
    
    fill(#464848);
    arc(279, 250, 280, 280, 0,PI);
   
    fill(#8B5A5C);
    arc(280, 250, 260, 280, 0,PI);
    
    fill(#FF1519);
    arc(280, 360, 160, 180, PI, TWO_PI);
    
    fill(#FF1519);
    arc(280, 350, 160, 100, 0, PI);
    
    fill(#B43E3E);
    triangle(280, 390, 280, 310, 288, 360); 
    
    fill(#529088);
    quad(216, 161, 216, 60, 116, 60, 44, 60);
    
    fill(#529088);
    quad(303, 161, 304, 60, 116, 60, 470, 60);
    
    fill(#FFFFFF);
    rect(166, 251, 40, 40);
    fill(#FFFFFF);
    rect(251, 251, 40, 40);
    fill(#FFFFFF);
    rect(339, 251, 40, 40);
    
    fill(#57F0CB);
    quad(216, 161, 200, 100, 120, 80, 50, 50) ;
    quad(303, 161, 304, 60, 320, 100, 460, 50);
    
    triangle(260, 130, 210, 230, 188, 260); 
    
}





