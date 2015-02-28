
void setup() {
  size(300, 300);
  colorMode(RGB);
}
//This is for the daytime background
void draw() {
  background(110, 141, 252);
  if (mouseX<=height/2) {
    noStroke();
    fill(mouseY, 150, 150);
    rect(mouseX*2, mouseY/2, 50, 100);
    rect(mouseX, mouseY, 40, 80);
  }
  //This is for night background
  else {
    background(17, 31, 77);
    if (mouseX<=width/2);
    rectMode(CENTER);
    fill(mouseX, 150, 150);
    rect(mouseX/2, mouseY*2, 40, 40);
    rect(mouseX, mouseY, 40, 80);
  }
  //This is for the Vehicle details such as the headlights and breaklights
  fill(137, 200, 255);
  rect(mouseX, mouseY+30, 35, 20);
  fill(137, 200, 255);
  rect(mouseX, mouseY-30, 35, 16);
  fill(253, 255, 137);
  rect(mouseX+15, mouseY-40, 5, 5);
  fill(253, 255, 137);
  rect(mouseX-15, mouseY-40, 5, 5);
  fill(255, 72, 5);
  rect(mouseX-15, mouseY+40, 6, 4);
  fill(255, 72, 5);
  rect(mouseX+15, mouseY+40, 6, 4);
  fill(253, 255, 137);
  rect(mouseX+15, mouseY-40, 5, 5);
  fill(253, 255, 137);
  rect(mouseX-15, mouseY-40, 5, 5);
  fill(253, 255, 137);
  rect(mouseX*2-15, mouseY/2+40, 7, 4);
  rect(mouseX*2+15, mouseY/2+40, 7, 4);

  //this is for the car tires
  fill(0, 0, 0);
  rect(mouseX+22, mouseY+30, 3, 15);
  rect(mouseX-22, mouseY+30, 3, 15);
  rect(mouseX+22, mouseY-30, 3, 15);
  rect(mouseX-22, mouseY-30, 3, 15);
  rect(mouseX*2-26, mouseY/2-30, 3, 15);
  rect(mouseX*2+26, mouseY/2-30, 3, 15);
  rect(mouseX*2+26, mouseY/2+30, 3, 15);
  rect(mouseX*2-26, mouseY/2+30, 3, 15);
}


