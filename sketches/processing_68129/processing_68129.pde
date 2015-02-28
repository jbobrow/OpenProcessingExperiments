
float color1;
float color2;
float color3;
void setup() {
  size(500, 500);
}

void draw () {
  background(127);
  // top left corner seizure
  if (mouseX<= width/2 && mouseY<=height/2) {
    background(255);
  }

  // top right green
  if (mouseX>=width/2 && mouseY<=height/2) {
    background(0, 255, 0);
  }

  //down left blue
  if (mouseX>=width/2 && mouseY>=height/2) {
    background(0, 0, 255);
  }

  //down right orange
  if (mouseX<=width/2 && mouseY>=height/2) {
    background(127, 255, 0);
  }
  if (keyPressed) {
    if (key=='a'||key=='A') {  
      rectMode(CENTER);
      strokeWeight(mouseX);
      fill(color1, 0, color3, 0);
      rect(width/2, height/2, mouseX, mouseY);
    }
  }
  else {
    ellipseMode(CENTER);
    ellipse(mouseX, mouseY, 50, 50);
  }

  strokeWeight(5);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);


  color1=random(1, 255);
  color2=random(0, 255);
  color3=random(0, 255);
}


