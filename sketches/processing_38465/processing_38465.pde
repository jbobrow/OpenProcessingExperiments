
void setup () {
  size (500, 500);
}


void draw() {
} 

void mousePressed() {
  background(219, 11, 211);
  float sp = random(5, 15);
  int margin = (50);
  
  // addresses controlled and random spacing of lines
  for (int a = margin; a <= width-margin; a+=sp) { 
    float sw =random(1, 5);
    
    // addresses stroke color
    if (sw > 4) {
      stroke(0, 0, 255);
    }
    else {
      stroke(0);
    }
    
    //addresses random stroke width
    strokeWeight(sw);
    line(0, a, width, a); //Area
  }
}


