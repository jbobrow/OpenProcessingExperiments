
int counter;

void setup() {  //setup function called initially, only once
  size(500, 400);
  background(0,200,225);
  fill(255);
}
 
void draw() {  //draw function loops
  
  noStroke();
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
     
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
