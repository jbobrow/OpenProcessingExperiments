
void setup(){
  size(200,200);
  
}

void draw(){
  background(255);
  stroke(0);
  line(100,0,100,200);
  fill(0);
  if(mouseX < width/2 && mousePressed == true){
    rectMode(CORNERS);
    rect(100,0,200,200);
  }
}

