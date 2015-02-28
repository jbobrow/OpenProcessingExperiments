
int abstand = 20;
float x,y;

 
void setup(){
  size(600, 600);
  rectMode(CENTER);
  noStroke();
}
 
void draw(){
fill(0,mouseY/2.4);
  background(255);
  for(int y = 0; y <= height; y = y + abstand){
      
    
 
    for(int x = 0; x <= width; x = x + abstand){
     rect(x, y, mouseY/30, mouseY/30);
    }
  }
}

