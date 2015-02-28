
void setup(){
 size(640,480);
smooth(); 
  
}


void draw(){
  background(255);
  
  noFill();
  
  rect(0,0,100,100);
  
  fill(255,0,0);
  
  ellipse (mouseX,mouseY,15,15);
  
  float mx = map (mouseX,0,100,0,width);
  float my = map (mouseY,0,100,0,height);
  
  
  fill(0,255,0);
  ellipse(mx,my,30,30);
  
  
}
                
                
