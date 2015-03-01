
void setup() {
  background(255, 0, 0);
  size(500, 500);
  //fill(255, 0, 0);
  //rect(0,0,500,500);
}

void draw() {
  smooth();
  background(255, 0, 0);
  fill(255, 255, 255);
  stroke(0,0,0);
  ellipse((mouseX - 30), mouseY, 50, 50);
  ellipse((mouseX + 30), mouseY, 50, 50);
  fill(0,0,0);
  noStroke();
  ellipse(((mouseX + 10) + (mouseX/12)), ((mouseY - 18) + (mouseY/15)), 10, 10);
  ellipse(((mouseX - 50) + (mouseX/12)), ((mouseY - 18) + (mouseY/15)), 10, 10);
  //ellipse(((mouseX - 10) - (mouseX/12)), (mouseY), 10, 10);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fill(255,0,0);
      ellipse((mouseX - 30), mouseY, 50, 50);
      ellipse((mouseX + 30), mouseY, 50, 50);      
    } else {
        smooth();
        fill(255, 255, 255);
        stroke(0,0,0);
        ellipse((mouseX - 30), mouseY, 50, 50);
        ellipse((mouseX + 30), mouseY, 50, 50);
        fill(0,0,0);
        noStroke();
        ellipse(((mouseX + 10) + (mouseX/12)), ((mouseY - 18) + (mouseY/15)), 10, 10);
        ellipse(((mouseX - 50) + (mouseX/12)), ((mouseY - 18) + (mouseY/15)), 10, 10);
        //ellipse(((mouseX - 10) - (mouseX/12)), (mouseY), 10, 10);
    }
  }
  
}


