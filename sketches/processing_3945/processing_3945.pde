

void setup(){ 
  size(800,800); 
  smooth(); 
  background (170, 161, 161) ;
} 
void draw(){ 
  stroke(0,0,0); 
  line(random (int(800)),random (int (500)),mouseX,mouseY); 
} 
void mouseDragged(){ 
stroke(255,255,255); 
  line(random(int(500)), random(int(500)), mouseX,mouseY); 
}  
 


