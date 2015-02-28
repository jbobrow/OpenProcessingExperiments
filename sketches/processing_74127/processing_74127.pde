
void setup() {
  size(400, 400, P2D);
  smooth(4);
  background(255);
}

void draw(){
  
 if(mousePressed){
  fill(0);
  } else {
    fill(20, 20);
  }
 
 noStroke();
 ellipse(mouseX, mouseY, 30, 30);
 
}
