
void setup() {
 size(500,400);
 
}

void draw() {
  
  int m = millis();
  
  background(0);
  if(mousePressed){
    if(mouseX < width/2){
      fill(m % 255,0,0);
      rect(0,0,width/2,height);
    }
    if(mouseX > width/2){
      fill(0,0,m % 255);
      rect(width/2,0,width/2,height);
    }
  }
  
}


