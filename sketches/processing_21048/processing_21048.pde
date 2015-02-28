
void setup() {
size(600, 600);
smooth();
}

void draw() {
  int s = second();  
  int m = minute();
  int h = hour();    
  
  
  //center
  translate(95,50);
  noFill();
  
  
  stroke(0);
  background(0);
  
   //seconds
  fill(52, 70, 205, 100);
  ellipse(260, 185, s*5, s*5);
  
   //minutes
  fill(52, 242, 0,100);
  ellipse(200, 350, m*6, m*6);
  
  
   //hours
  fill(52, 231, 227, 100);
  ellipse(100, 190, h*8, h*8); 
 
}


