

float startTime, currTime;
float hitTime;

void setup(){
  size(500,500);
  frameRate(60);
}

float x,y;




void draw() {
 
fill(x,y,x+y);
   ellipse(x,y,50,50);
  
    x = x- (-mouseX + x) / 60;
    y = y - (-mouseY + y) / 60;
  }
   
    
 
  
  



