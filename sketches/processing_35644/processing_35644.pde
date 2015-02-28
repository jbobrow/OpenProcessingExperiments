
void setup() {
  size(300, 300);
}

void draw() {

  int x = 50;

  background(x, mouseX, x);

  rectMode(CENTER);
  fill(mouseY, X, mouseX);
  rect(width/2, height/2, -mouseX-mouseY, mouseY-mouseX);

  fill(mouseX, X, mouseY);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, mouseX, mouseX);
  
  fill(mouseX, mouseY, x);
  rectMode(CENTER);
  rect(width-25, height-25, mouseX/10, mouseY/10);
  rect(width-275, height-275, mouseX/10, mouseY/10);
  rect(width-25, height-275, mouseX/10, mouseY/10); 
  rect(width-275, height-25, mouseX/10, mouseY/10);
 
}


  
  

