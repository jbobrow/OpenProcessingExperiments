
int w = 10; 
int h = 10; 
 
void setup() { 
  size(400,400); 
  smooth(); 
} 
 
void draw() { 
  background (600); 
     
  for (int x = 0; x < width; x += 20) { 
     
    for (int y = 0; y < height; y += 20) {  
      stroke(5); 
      int c = int(random(75,251)); 
      fill(c); 
      rect(x,y,w,h); 
    } 
  } 
} 


