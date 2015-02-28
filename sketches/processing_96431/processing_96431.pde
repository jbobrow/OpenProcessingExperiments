
//Rosa Han
//April 14, 2013
//clock


void setup(){
  size(600,600);
}
  
void draw() {
  background(250,129,129);
  noStroke(); 
    
  float sc= map(second(), 0, 70,0,width);
  fill(255);
  ellipse(300,300,sc,sc);
  float min= map(minute(), 0, 70,0,width);
  fill(200,0,0,150);
  ellipse(300,300,min,min);
  float hr= map(hour(), 0, 40,0,width);
  fill(100,200,250,80);
  ellipse(500,500,hr,hr);
  fill(255);
   
    
  
    
    
    
}
