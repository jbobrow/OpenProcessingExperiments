
// Beatriz Bukvic - Assignment2 - 02/11/2014 - Creative Computing

void setup() {
  size(700, 700);
  background(255);
  smooth();
}

void draw() {
  rect(0, 0, 700, 700);

  stroke(105, 40, 198);
  strokeWeight(1);
  for (int i=0; i<710;i=i+20) {
    
    if(mousePressed) {
    line(i, 0, mouseX, mouseY);
    line(mouseX, mouseY, i, 700);
    
    }else{

    line(i, 0, mouseX, 350);
    line(mouseX, 350, i, 700);
  }
}
}



