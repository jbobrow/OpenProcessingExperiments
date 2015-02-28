
void setup () { 
  size (600, 480);
}


void draw () {
  if (mousePressed) {
    fill(255,0,0);  
  }else{
   fill(0, 102, 255); 
  }
ellipse(mouseX, mouseY, 435, 321);
}
