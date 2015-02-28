
void setup(){
size(400,400);
smooth();
background(235,248,252);
}


void draw(){
  noStroke();
  
  if (mousePressed && (mouseButton == LEFT)){
      stroke(180);
      strokeWeight (2);
  }
  if (mousePressed && (mouseButton == RIGHT)){
      stroke(235,248,252);
      strokeWeight (20);
  }
  
  line(mouseX, mouseY, pmouseX, pmouseY);
}
