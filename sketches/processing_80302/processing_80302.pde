
void setup() {  //setup function called initially, only once
  size(1280, 800);
  background(255);  //set background white
  smooth();
}

void draw() {  //draw function loops 
 
  
  if(mousePressed == true) { //add some interaction
    fill(map(mouseX,0,800,0,255),map(mouseY,0,600,0,255),map(mouseX*mouseY,0,480000,0,255));
    ellipse(mouseX, mouseY, 40, 40);
  }
  }
