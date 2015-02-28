
float colorValue;

void setup(){
  size(600,600);
  colorValue = 0;
  smooth();
   
}
 
 
void draw(){
  background(colorValue);
   colorValue = map(mouseX,0,width,0,255);
 
  
  fill(45,120,140);
  translate(width/2, height/2);
  for(int i = 0; i < 10; i++){
 
      rotate(radians(36));
       
     pushMatrix();
      ellipse(50,50,50,50);
      for(int a = 500; a < 100; a += 20) {
     
      }
      for(int b = 0; b < 100; b += 20) {
        
      ellipse(100,100,100,100);
     
      }
     popMatrix();
 
  
   
}
}

