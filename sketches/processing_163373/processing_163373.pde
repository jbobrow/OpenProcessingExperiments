
int counter;
int red = 0;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  background(255);
  rect(mouseX, 50, mouseY, 50);
  if (mousePressed) {
  ellipse(200, 200, 100, 100);
  }
}
  
void mousePressed() {
  if (mousePressed == true) {
    fill(red, 0, 0);
    red += 1
  }
}
