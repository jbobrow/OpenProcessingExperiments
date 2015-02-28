

/*

cindy Ng
blue squares & ellipse
May 31, 2009
cindy.ng@cindysng.com
*/

float speed =0.01;

void setup() {  
  size(500, 500);  
  background(255); 
  smooth(); 
 }  
  
void draw() {  
  stroke(#123456);  
  if(mousePressed) {  
    ellipse(mouseY, mouseX, 5, 5);  
    rect(mouseX, mouseY, 10,10);  
    fill (0, 225, 400, 90);  
    smooth();  
  }  
}  
 


