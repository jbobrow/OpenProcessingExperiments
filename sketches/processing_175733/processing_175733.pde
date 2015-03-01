


void setup() {  //setup function called initially, only once
    size(1000, 1000);
  smooth ();
}

void draw() {  //draw function loops 
  if(mousePressed){
  fill (0);
  }else{
  fill(225)
} 
    ellipse(mouseX, mouseY, 40, 40);
  }

