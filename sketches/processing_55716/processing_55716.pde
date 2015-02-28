

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(0);  //set background white
}

void draw() {  //draw function loops 
  if(mousePressed == true) { 
      background(255);
  }
  else {
     background(0);
  }
}
