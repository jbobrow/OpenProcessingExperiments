

void setup(){ 
  size(500,500); 
   colorMode(RGB, 250,234,43);  
  background(0); 
  noStroke(); 
  smooth();
   
} 
void draw (){ 
 
 float x= random (width); 
float y= random(width); 
 
fill(x,y,10,10); 
  ellipse(x, y, millis(), second()); 
fill(x,y,25,25);
  ellipse(x,y,second(), millis());
fill(x,y,5,5);
color(0);
 rect(x,y,second(), second());

} 


