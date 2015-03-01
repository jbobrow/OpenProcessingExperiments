
void setup () {
  
  size(255,255); 
    
}

void draw () {
    
for (int i=0; i<height; i = i + 20) { 
    stroke(0,0,0); 
    line(0, i, width, i); 

 } 
 for (int v = 0; v<width; v = v + 20) {
    stroke(0,0,0); 
    line(v, 0, v, height); 
   
}
}


