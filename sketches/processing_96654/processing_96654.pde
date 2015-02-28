
void setup () {
  size(240,120);
  smooth();
}

void draw() {
  background(204);
  line (20,20,220,100);
  if (keyPressed){
  line(220,20,20,100);
  }


// Click on the window to give it focus
// and press the 'B' key

    if (key == 'b' || key == 'B') {
      fill(0);
    
  } else {
    fill(255,200,200);
  }
  rect(40, 40, 50, 50);
}

