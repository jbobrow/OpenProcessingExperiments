
//gbk // play with circles, get surprised when pushing the cursor

int red = 255;

void setup() {
  size(600, 600);
  background(#e0fc05);
}

void draw() {
  if (mousePressed) {
    fill(#a85d05);
  rect(100, 294, 400, 100);
  arc(300, 300, 400, 400, PI, PI + PI);
  stroke(0);
  strokeWeight(6);
  //face
  fill(255);
  ellipse(300, 300, 300, 300);
  //mouth
  fill(255, 0, 0);
  ellipse(300, 360, 50, 50);
  line(280, 360, 320, 360);
  //Left Eye
  line(210, 250, 260, 300);
  line(260, 250, 210, 300);
  //Right Eye
  line(330, 250, 380, 300);
  line(380, 250, 330, 300);
}
  stroke(0);
  strokeWeight(6);
  fill(red,0,0);
  ellipse(mouseX, mouseY, 80, 80);
}
