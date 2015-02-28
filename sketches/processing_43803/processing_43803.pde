
void setup(){
  size(450, 450);
  background(255);
  smooth();
  fill(0);
  noStroke();
  rect(145, 0, 10, height);
  rect(295, 0, 10, height);
  rect(0, 145, width, 10);
  rect(0, 295, width, 10);
}

void draw(){
  if(mousePressed && (mouseButton == LEFT)){
    fill(0);
    stroke(255, 0, 0);
    strokeWeight(4);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if(mousePressed && (mouseButton == RIGHT)){
    stroke(0, 0, 255);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

