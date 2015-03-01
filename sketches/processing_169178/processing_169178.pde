
void setup () {
   background (0);   
  size(255,255); 
    
}

void draw () {
    
for (int i=0; i<height; i = i + 10) { 
    stroke(255,i,i); 
    line(0, 0, width, i); 

 } 
}


