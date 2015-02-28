
void setup(){
  size(400,300);
  background(0);
  noStroke();
  smooth();
  frameRate(100);
}
  
int x = 20;                     
int y = 20;                      
  
void draw(){
  noFill();
    
  pushMatrix();
    translate(width/4,height/4);     
    rotate(radians(x));            
    translate(width/4,height/4);         
    rotate(radians(y));    
    fill(255,random(300),random(300), 20);
    rect(100,100,random(50), random(50)); //rect dimensions
  
  popMatrix();
    
    
  y+=10;
  x++;
  
}


