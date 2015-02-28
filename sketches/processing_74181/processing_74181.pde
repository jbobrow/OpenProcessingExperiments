
void setup() {
  size(500, 500,P2D);
  background(0);
  smooth(4);
}

void draw() {
 background(255);
  
  if(mousePressed){
    fill(255);
    background(0);
  }else{
    fill(0);
    
  }

 ellipse(mouseX, mouseY, 80, 80);
 
 ellipse(mouseX-15, mouseY-15, 10, 10);
 ellipseMode(CENTER);
 ellipse(mouseX-15, mouseY-15, 2, 2);
 
 ellipseMode(CENTER);
 ellipse(mouseX+20, mouseY-5, 10, 10);
 ellipse(mouseX+20, mouseY-5, 2, 2);


 ellipse(mouseX, mouseY+20, 25, 15);
  
 
 
 
}
