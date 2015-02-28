
int counter;

void setup() {  //setup function called initially, only once
  size(500, 400);
}

void draw() {  //draw function loops 

  fill(random(20),20,20,20);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
