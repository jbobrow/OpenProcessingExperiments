
int b = 40;

 
void setup() {
size(300, 300);
background(0);
smooth();


 
}
 
 
void draw() {
  
  fill(255);
  for(int y = 0; y <= height; y = y + 10){
    for(int x = 0; x <= width; x = x + 10){
     ellipse (x, y, b+y,b+x);
      
      
 
}
  }
}

