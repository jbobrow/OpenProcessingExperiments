
Boolean drawing;

void setup() {
  size(300, 300);
  drawing = false;
}

void draw() {
  background (32, 126, 224);
  //flag post
  strokeWeight(5);
  stroke(0);
  line(50, 75, 50, 225);
  //flag
  fill(206, 19, 31);
  noStroke();
  triangle(50, 75, 50, 95, 75, 85);
  //ground in section
  fill(77, 47, 17);
  noStroke();
  rect(0, 220, width, 220);
  //grass in section
  stroke(16, 106, 36);
  strokeWeight(10);
  line(0, 220, width, 220);
  //sun
  fill(246, 255, 3);
  noStroke();
  ellipse(175, 50, 50, 50);
  //horizontally rolling golf ball
  if (drawing) {
    fill(255, 255, 255);
    noStroke();
    ellipse(mouseX, 210, 10, 10);
  }
}

//golf ball drops in hole with the click of mouse at flagpost
void mousePressed() {
  if (drawing) {
    drawing=false;
  }
  else {
    drawing=true;
  }
}  


