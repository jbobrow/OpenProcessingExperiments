
float weight = 1;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  strokeWeight(weight);
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == '0'){
    stroke(240,34,56);
  }
  
  if (key == '1'){
    stroke(240,240,240);
  }
  if (key == 's'){
    save("image.png");
  }  
  if (key == '+') {
    weight = weight + 1;
  }
  if (key == '-') {
    if (weight > 1) {
      weight = weight - 1;
    }
  }
}
