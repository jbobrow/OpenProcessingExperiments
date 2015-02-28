
int x = 100;
int y = 100;
 
void setup() {
  size(500,500);
  smooth();  
}
 
void draw() {
  stroke(255);
  strokeWeight(4);
  background(0);
  x = x + 5;
  y = y + 5;
   
  fill(30,x,x);
  ellipse(200,200,x,y);
      
}
    
void mousePressed() {
  
  x=0;
  y=0;
 
}

