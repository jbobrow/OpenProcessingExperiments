
void setup (){ 
  size (400,400); 
} 
 
 
float pin = 0.0; 
void draw()  
{ 
  background(255,0,0); 
  pin = pin + .02; 
  float n = noise(pin) * 300;           

 
  fill(0);  
  noStroke ();  
  fill (0);  
  ellipse(10+n,5+n,10,10);  
  noStroke();  
  fill(0);  
  ellipse(20+n,5+n,10,10);  
  noStroke();  
  fill(0);  
  triangle(15+n,18+n,26+n,5+n,5+n,5+n);  
} 
 


