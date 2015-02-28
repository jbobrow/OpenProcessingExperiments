
void setup(){
  size (400,400);
  background(0);
}

void draw(){
  pushMatrix();
  translate (width/2, height/2);
   rotate(frameCount * radians(45) * 0.05);
   
  noFill();
  rectMode(CENTER);
  
  for(int x=0; x<width; x++){
    for(int rectSize=400; rectSize>0; rectSize-=5){//creates the repeated squares
    stroke(255);
        rect(0,0,rectSize,rectSize);
     } 
  }
  
  popMatrix();
}

