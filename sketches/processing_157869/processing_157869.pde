
int grow = 0;

void setup() {
  size (500,500);
  smooth();
  noStroke();
  fill(0,255,0); 
}


void draw(){
  background(255);
  
  
  if(frameCount  % 150 == 0) {
    grow = 0;
  }
  
  if(grow > 150) { 
    grow = -2;
  }
  
  if (grow < 0) {  
    grow = 0;
  }
  
  ellipse(width/2,height/2,grow,grow);
  
grow++;
 
}
