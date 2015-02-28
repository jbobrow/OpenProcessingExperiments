

void setup() {
  size(400,450);
  smooth();
}

void draw() {
  if(mousePressed) {
    fill(#B22222);
  } else {
    fill(#FF4500);
  }

  rect(mouseX, mouseY, 50,50);
 line(mouseX, mouseY, 30, 30);
 ellipse(mouseX, mouseY, 80,80);
}
                
                
