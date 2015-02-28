
float base, top; 
 
void setup(){ 
  base = 20; 
  top = 25; 
  size(500, 500); 
  smooth(); 
  stroke(0); 
} 
 
 
void draw(){ 
  background(0); 
  for(float y =base; y <= height-base; y += top){ 
    for(float x = base; x <= width-base; x += top){ 
      float d;  
      d = sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y)); 
      fill(255); 
     triangle(x,y,d,base, d,top); 
      
      
    } 
  } 
} 
 
 
 

