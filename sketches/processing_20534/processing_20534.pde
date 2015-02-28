
int size = 50;

void setup(){
 size (400, 400);
 smooth();
}

void draw(){
  for (int h = 0; h < width; h += size) {
  for (int v = 0; v < height; v += size) { 
    
    if ((h+v) % 20 ==0) {  
    fill(150, 0, 0); 
  }
  
  else { 
    fill(0, 0, 0); } 
   
   
   
   
    rect (h, v, size, size);
   }
  }
}

