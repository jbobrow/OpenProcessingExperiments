
int circle = 70;
float x, y;
  
   
void setup(){
  size(500, 1000);
  ellipseMode(CENTER);
  stroke(255);
  fill(73,70,70,40);
  smooth();
  background(255);
  strokeWeight(2);
}
   
void draw(){

  noLoop();
  for(int y = 0;y <= height;y = y + circle){
        
      
   
    for(int x = 0; x <= width; x = x +circle){
     ellipse(x, y, 500,500);
     rotate(PI/30);
    }
  }
}


