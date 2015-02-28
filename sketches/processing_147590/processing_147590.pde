
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
}

void draw() {  //draw function loops 
line(mouseX,mouseY,pmouseX,pmouseY);
}
