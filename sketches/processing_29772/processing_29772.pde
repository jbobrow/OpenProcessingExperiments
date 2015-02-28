


void setup(){
size(840,500);
background(0);
smooth();
 }
 
void draw(){
if (mousePressed) {
  stroke(255,255,255,30);
  line (width/2, 50, mouseX, mouseY);
  line(width/2, height-80, mouseX, mouseY);
  
}
else{
  noFill();
  stroke(255,255,255,20);
  strokeWeight(0.5);
  bezier(420,420,mouseX,mouseY,mouseX,mouseY,420,50);
}
}      
                
