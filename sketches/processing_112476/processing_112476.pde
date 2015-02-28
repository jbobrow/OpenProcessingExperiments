
void setup(){
size(600, 600);
background(0);
}

void draw() {
  if (mousePressed && (mouseButton == LEFT)) {
    strokeWeight(5);
    stroke(mouseY,mouseX-mouseY,mouseX,180);
   
  } else if (mousePressed && (mouseButton == RIGHT)) {
    background(0);
    strokeWeight(10);
    stroke(0);
  } else {
    noStroke();
  }
  
   point(width-mouseX,mouseY);
 point(mouseX,mouseY);
 point(mouseX,width-mouseY);
 point(width-mouseX,width-mouseY);
 
 point(mouseY,width-mouseX);
 point(mouseY,mouseX);
 point(width-mouseY,mouseX);
 point(width-mouseY,width-mouseX);
   
}




