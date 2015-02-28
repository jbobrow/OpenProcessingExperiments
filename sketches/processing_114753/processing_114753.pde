
void setup () { 
  size (400, 400);
  noStroke();
  
} 

void draw() {
  
  smooth(10);
  translate (200,200); 
  background(0);
  
  
  fill (255, 255, 0 );
  ellipse ( 0 , 0 , 40, 40 ); 
  
  fill (0,0,255);
  translate (120,120);
  rotate ( radians (second () *20));
  ellipse ( 0, 0, 20, 20); 
  
  rotate ( radians (second () *20));
  translate ( - 25 , - 25); 
  fill (200);
  ellipse ( 0, 0, 15, 15); 
  
  translate (-10, -10); 
  fill (0, 100, 200);
  ellipse ( 0, 0, 10, 10 );
  

}
