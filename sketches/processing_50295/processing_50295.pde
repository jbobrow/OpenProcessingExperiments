
void setup() {
  size(800,800);
  smooth();
  background(255);
  frameRate(5);
}

void draw() {
  stroke(1);
  fill(100,56,500,10);
  rect(0,0,800,800);
  fill(255,10);
  rect(0,0,800,800);
  fill(255,90);
  stroke(255);
  ellipse(mouseX,mouseY, 60,60);
  float a = random(0,4);
  if(a == 0 | a < 1) {
    fill(255,90);
    ellipse(random(mouseX+20,mouseX+60),random(mouseY-60,mouseY-20),30,30);
  }
  if(a == 1 | a < 2) {
    fill(255,90);
    ellipse(random(mouseX+20,mouseX+60),random(mouseY+20,mouseY+60),30,30);
  }
  if(a == 2 | a < 3) {
    fill(255,90);
    ellipse(random(mouseX-60,mouseX-20),random(mouseY+20,mouseY+60),30,30);
  }
  if(a == 3 | a <= 4) {
    fill(255,90);
    ellipse(random(mouseX-60,mouseX-20),random(mouseY-60,mouseY-20),30,30);
  }
}

