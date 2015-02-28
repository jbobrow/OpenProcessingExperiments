
//Sungji Choi 4 sections

void setup() {
  size(400, 400);
}

void draw() {
  background(255, 255, 102);
  fill(255, 53, 103);
  rect(0, 0, 200, 200);
  rect(200, 200, 200, 200);
  fill (255, 53, 103);
  noStroke();
  ellipse(100, 300, 100, 100);
  ellipse(300, 100, 100, 100);
  fill (255, 255, 0);
  ellipse(100, 300, 50, 50);
  ellipse(300, 100, 50, 50);

  if ((mouseY < height/2) && (mouseX < width/2)) {
    fill (255, 255, 102);
    noStroke();
    ellipse(100, 100, 100, 100);
    fill (255, 051, 153);
    ellipse(100, 100, 50, 50);
  }    

  if ((mouseY < height/2) && (mouseX > width/2)) {
    fill (255, 255, 102);
    noStroke();
    rect(200, 0, 200, 200);
  }    

  if ((mouseY > height/2) && (mouseX < width/2)) {
    fill (255, 255, 102);
    noStroke();
    rect(0, 200, 200, 200);
    
  }    

  if ((mouseY > height/2) && (mouseX > width/2)) {
    fill (255, 255, 102);
    noStroke();
    ellipse(300, 300, 100, 100); 
    fill (255, 051, 153);
    ellipse(300, 300, 50, 50);
  }
}
