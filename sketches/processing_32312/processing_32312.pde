
int circle = 200;
float x, y;
  
   
void setup(){
  size(500, 1000);
  ellipseMode(CENTER);
  stroke(0,0,0,10);
  fill(0,0,0,60);
  smooth();
  background(0);
  strokeWeight(2);
}
   
void draw(){

  background(255);
  for(int y = 0;y <= height;y = y + circle){
        
      
   
    for(int x = 0; x <= width; x = x + circle){
     ellipse(x, y, 500,500);
     rotate(PI/80);
    }
  }
}


