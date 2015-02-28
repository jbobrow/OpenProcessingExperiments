
int colourMode = 1;

void draw() {
    
  if (colourMode == 1) {
    fill(255,0,0);
  } else {
    fill(0,255,0);
  }
    
  rect(10,10,10,10);
  
}

void mousePressed() {
  if (colourMode == 1) {
    colourMode =0;
  } else {
    colourMode = 1;
  }

}
