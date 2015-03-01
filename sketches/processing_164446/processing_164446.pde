
void setup() {
size(500, 500);

background(0);
}
void draw() {
  for (float i = 0; i < 3; i+=1) {
    if (mousePressed == true) {
      stroke(250,130,125, 8);
      line(mouseX, mouseY, -i*222, i*322);
    } else {
      noStroke();
      fill(240,180,105, 26);
      ellipse(mouseX + i*i, mouseY, i, i*14);
  }
}
}


