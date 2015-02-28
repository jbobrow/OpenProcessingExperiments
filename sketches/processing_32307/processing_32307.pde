
int hello = 10;
int ball = 10;
float x, y;
  
   
void setup(){
  size(500, 1000);
  ellipseMode(CENTER);
  stroke(255);
 noFill();
  smooth();
  background(0);
}
   
void draw(){

 //background(0);
  for(int y = 0;y <= height;y = y + hello){
        
    ball=ball*2;
    
    
   
    for(int x = 0; x <= width; x = x + hello){
     ellipse(x, y, ball,ball);
     rotate(PI/50);
     
     
     
    }
  }
}


