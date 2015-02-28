
void setup() {  //setup function called initially, only once
  size(500, 500);

}

void draw() {  //draw function loops 
 ellipse(20+mouseX,20+mouseY,100,100);
  
  if (mousePressed){
      fill(0,255,0);
  }
  else {
    fill(255,255,0);
  }
}
