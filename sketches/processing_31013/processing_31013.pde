
void setup(){
  size(500,500);
  background(color(255,255,255));
}


void draw(){
  text("Hi Caroline!");
} 
 
void mouseDragged(){
  fill(0,0,0);
  frameRate(10000);
  ellipse(mouseX,mouseY,10,10);
}

