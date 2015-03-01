
int counter;

void setup() {  
  size(500, 400);
  background(5);  //set background white
}

void draw() {  //draw function loops 
  
  stroke(255)
  fill(random(255),50,50,50);
  
  if(mousePressed == true) { //add some interaction
    rect(-250, mouseY, mouseX, 25, 100);
  }
  else {
    rect(250, mouseY, mouseX, 25, 100);
  }
}
