

void setup(){
  size(500,150);
  background(255);
  stroke(255);
}

void draw(){
  strokeWeight(2); 
  
   fill(255,158,0);
   triangle(0,0,0,25,50,0);
   triangle(0,25,0,75,50,50);
   triangle(0,75,0,125,50,100);
   triangle(0,125,0,175,50,150);
  
fill(4,137,14);
triangle(50,0,    0,25,     50,50);

triangle(50,50,   0,75,     50,100);

triangle(50,100,  0,125,    50,150);
  
  
  
fill(255,243,0);
  triangle(50,0,     50,50,   mouseX,25);
  triangle(500,0,    500,50,  mouseX,25);
  
  triangle(50,50,    50,100,  mouseX,75);
  triangle(500,50,  500,100,  mouseX,75);
  
  triangle(50,100,   50,150,  mouseX,125);
  triangle(500,100,  500,150, mouseX,125);
  
        fill(255,158,0);
        
        quad(50,50,  mouseX,25,  mouseX,75, 500,50);
        quad(50,100, mouseX,75, mouseX,125, 500,100);
 
 line(50,25,500,25);
 line(50,75,500,75);
 line(50,125,500,125);
 }
 
