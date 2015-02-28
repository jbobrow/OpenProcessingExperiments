
float y = 0.0;
float x= 0.0;
void setup() {
  size(250, 250);
  background(#000000);
  
  noFill();
}
void draw(){
  frameRate(80);
  stroke(#FF00E6);
  rect(x, y, 20, y);  
  stroke(#F6FF00);
  rect(x, 25, 30, y);
  stroke(#9800FF);
  rect(x, 50, 40, y);
  
   if(mousePressed){ 
   background(0);
    x = 0.0;
    y = 0.0;
  }

}

void mouseMoved() {
  y = y + 1; 
  x= x + 2;
}



