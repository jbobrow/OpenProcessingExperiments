
void setup() {
  size(500, 500);     
  background(250);    
  smooth();
  mouseX=width/2;
  mouseY=height/2;
  frameRate=30;
 
}
 
void draw() {
  stroke (0, 120, 80);      
  strokeWeight(1);

              
  line(width/1, height/1, mouseX, mouseY); // línea que va desde el centro hasta donde  posicione el mouse
  line(width/2, height/2, mouseX, mouseY);
  line(width/3, height/3, mouseX, mouseY);
  line(width/1, height/1, mouseX, mouseY);
  line(width/1, height/1, mouseX, mouseY);
  
   
  
   
}
 
void mousePressed() {
  background(100, 200, 0);
   
}
                
