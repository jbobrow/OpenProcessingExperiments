
int circle = 80;
float x, y;
  
   
void setup(){
  size(500, 1000);
  ellipseMode(CENTER);
  stroke(0);
  fill(0,0,0,15);
  smooth();
  background(255);
  strokeWeight(1);
}
   
void draw(){

  noLoop();
  for(int y = 0;y <= height;y = y + circle){
        
      
   
    for(int x = 0; x <= width; x = x +circle){
     ellipse(x, y, 500,500);
     ellipse(x,y,800,800);
     ellipse(x,y,400,400);
     rotate(PI-80);
     
    }
  }
}


