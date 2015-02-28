
void setup(){
size(600, 600);
background(0);
}

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    strokeWeight(30);
    stroke(mouseY,mouseX-mouseY,mouseX,180);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    background(0);
    strokeWeight(10);
    stroke(0);
  } else {
    noStroke();
  }
  
  strokeWeight(10);
 point(width-mouseX,mouseY);
  point(mouseX,mouseY);
 
}




