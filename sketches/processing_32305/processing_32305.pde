
int circle = 75;
float z=80;
  
   
void setup(){
  size(500,1000);
  ellipseMode(CENTER);
  stroke(255);
  noFill();
  smooth();
  background(0);
  strokeWeight(1);
 
 
}
   
void draw(){
noLoop();
  
  for(int y = 0;y <= height;y = y + circle){
        
      
   
    for(int x = 0; x <= width; x = x + circle){
     ellipse(x, y, 125,125);
     
    
     ellipse(y,x,z,z);
     ellipse(x,y,z,z);
     ellipse(x,y,z,z);
     
     
     
   
     
    }
  }
}


