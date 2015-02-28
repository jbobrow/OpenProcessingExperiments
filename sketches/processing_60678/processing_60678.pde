
void setup () {
  size (500,500);
}

void draw () {
  background(255);
  
  smooth();
  noStroke();
  fill(160);
  rect( 250,250,100,100);

    if (mouseX > 250 && mouseX< 350 && mouseY > 250 && mouseY < 350) {
      fill(0);
      rect( 250,250,100,100);
  } 
}


