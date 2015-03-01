
//CODE BY UCO
void setup() {
  size(800,800);
   background(0);
}

void draw() {  
     smooth();
    stroke(100,100,50);
    fill(mouseX/3.5,22,50);
    ellipse(mouseX,mouseY,mouseX/2,mouseX/2);
  if (mousePressed) {
  } else {
     smooth();
     fill(0);
    ellipse(mouseX,mouseY,mouseX/2,mouseX/2);
  }
}




