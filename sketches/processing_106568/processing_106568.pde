
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);

}

void draw() {  //draw function loops 

  ellipse (20,20,20,20);
  
  if (mousePressed){
  fill (255,0,0);
  }
  else {
  fill (0,255,0);
  }
  
  if (keyPressed){
  fill (0,0,255);
  
  if (key == 'd'){
  fill (255,255,0);
  }
  }
}
