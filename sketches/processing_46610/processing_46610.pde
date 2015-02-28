
void setup() {
  size(500, 450);    
  background(1, 12, 220);   
  smooth();
  mouseX=width/4;
  mouseY=height/2;
  frameRate=25;
  
}
  
void draw() {
  stroke(40, 15);     
  strokeWeight(1);
 
               

  line(width/2, height/2, mouseX, mouseY);
  line(width/5, height/3, mouseX, mouseY);
  line(width/1, height/1, mouseX, mouseY);
  line(width/1, height/1, mouseX, mouseY);
   
    
   
    
}
  
void mousePressed() {
  background(120, 20, 130);
    
}
                                                
