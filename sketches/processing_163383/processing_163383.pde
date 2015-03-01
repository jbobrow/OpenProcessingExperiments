
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
}

void draw() {  //draw function loops 
  if(keyPressed == true) { 
    ellipse(100, 100, 100, 100);
} else {
  rect(100, 100, 50, 50);
  }
}
