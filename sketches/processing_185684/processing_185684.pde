
void setup(){
  
  size (300, 300);
  background (100, 250, 250);
  noLoop();
}

void draw(){
  
  fill(#C76312); 
  quad(50, 150, 250, 150, 225, 200, 75, 200);
  
  fill(#FFFFFF); 
  rect(147, 50, 6, 100);
  
  fill(#FFFB00); 
    
  triangle(153, 50, 153, 100, 215, 75);
  
}

// I hope it's ok that I used hexidecimal for coloring my boat
