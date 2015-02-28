
int weight1 = 2;
int weight2 = 4;
int weight3 = 6;

void setup() {
  size(400, 400);
  fill(200);
  rect(0, 0, 399, 399);
  fill(60);
  textSize(20);
  text("- K = heavy black", 40, 50);
  text("- W = heavy white", 40, 100);
  text("- R = heavy red", 40, 150);
  text("- G = heavy green", 40, 200);
  text("- B = heavy blue", 40, 250);
  text("- press and drag", 40, 300);
  text("- right click to clear", 40, 350);

}

void draw() {
  //ellipse(mouseX, mouseY, 20, 20)

  if (mousePressed && (mouseButton == LEFT)) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    fill(200);
    rect(0, 0, 399, 399);
  }
  if (keyPressed == true) {
    if (key =='k' && mousePressed) {
      strokeWeight(4);
      stroke(0);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else {
      strokeWeight(1);
    }
    if (key =='w' && mousePressed) {
      strokeWeight(4);
      stroke(255);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else {
      strokeWeight(1);
    }
    if (key =='r' && mousePressed) {
      strokeWeight(4);
      stroke(255, 0, 0);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else {
      strokeWeight(1);
    }
    if (key =='g' && mousePressed) {
      strokeWeight(4);
      stroke(0, 255, 0);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else {
      strokeWeight(1);
    }
    if (key =='b' && mousePressed) {
      strokeWeight(4);
      stroke(0, 0, 255);
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else {
      strokeWeight(1);
    }
  }
}
