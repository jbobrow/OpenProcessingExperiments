
void setup () { 
  size (600, 600);
  noStroke();
  smooth(5);
} 

void draw() {
  
  background(0);
  translate (300,300); 
  
  fill (255, 255, 0 );
  ellipse ( 0 , 0 , 50, 50 ); 
  
  fill (0,0,255);
 
  rotate ( radians (second () *50));
  translate (100,100);
  ellipse ( 0, 0, 20, 20); 
  rotate ( - radians (second () *50)); 
  
  rotate ( radians (second () *50));
  translate ( - 20, - 20); 
  fill (255);
  ellipse ( 0, 0, 15, 15); 
  
  translate (-5, -5); 
  fill (0, 150, 255);
  ellipse ( 0, 0,10 , 10 );
  

}
