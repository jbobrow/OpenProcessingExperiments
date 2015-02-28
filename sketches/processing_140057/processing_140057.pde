
int x, y;
int ellipse_diameter = 550;
 
 
void setup(){
 
  size(500, 500);
  smooth();
}
  
 
void draw(){
  background(0);
    
  noStroke();  
   
  fill(200);// augen hg
 
  ellipse(mouseX+120, 185, 60, 60);
  ellipse(mouseX+120, 185, 60, 60);  
  noStroke();   
     
      
  x = mouseX;
  y = mouseY;
  
 if ( x > 250 && y < 250) {
     
  fill(0);// pupile
  ellipse(mouseX+120, 175, 15, 10);
  ellipse(mouseX, 175, 15, 10);
  fill(255); // mund
  curve(mouseX+160, mouseY/4, 150, 325, 350, 325, 500, 200);  
 }
   
  if ( x > 260 && y > 260) {   
  fill(0);// pupile
  ellipse(mouseX+120, 195, 10, 15);
  ellipse(mouseX+120, 195, 10, 15);
  fill(255); //mund
  curve(mouseX+40, mouseY+100, 150, 325, 350, 325, 500, 200);
    
 }
   
  if ( x < 250 && y > 250) {
     
  fill(0);// pupile
  ellipse(mouseX+120, 195, 15, 10);
  ellipse(mouseX, 195, 15, 10);
  fill(255); // mund
  curve(mouseX, mouseY, 150, 325, 350, 325, 500, -200);
    
 }
  
  if ( x < 250 && y < 250) {
     
    fill(0);// pupile
    ellipse(mouseX+120, 175, 10, 10);
    ellipse(mouseX, 175, 10, 10);
     fill(255); // mund
    curve(mouseX, mouseY, 150, 325, 350, 325, 500, -200);
 
    
}
  
  if ( x < 250 && y < 250) {
     
    fill(0);// pupile
    ellipse(mouseX+120, 175, 10, 10);
    ellipse(mouseX+80, 175, 10, 10);
     fill(255); //mund
    curve(mouseX+60, mouseY=100, 200, 325, 350, 325, 500, -200);   
}
     
 {
     
  }
 
  fill(0);
  
   triangle(300, 525, 410, 425, 300, 340);
}



