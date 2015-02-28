
float weight = 0.1;
int mx = mouseX/2;
int my = mouseY/2;
int mz = (mouseX+mouseY)/4;

void setup () {
  size(500, 500, P2D);
  background(255);
  smooth();

  fill(220);
  textSize(50);
  text(">QWE ASD ZXC", 40, 250); 
  text(">press and drag", 40, 300); 
  text(">click to clear", 40, 350);
  text(">H for help", 40, 400);
  text(">enjoy", 40, 450);
}

void draw() {

  mx = mouseX/2;
  my = mouseY/2;
  mz = (mouseX+mouseY)/4;

  strokeWeight(weight);

  if (keyPressed) {
    if (key =='z' || key =='x' || key =='c' || key =='a' || key =='s' || key =='d' || key =='q'
      || key =='w' || key =='e' || key =='h') {

      line(pmouseX, pmouseY, mouseX, mouseY);
      weight = weight+0.05;
    }

    if (key =='z') {
      stroke(mx, my, mz);
    }
    if (key =='x') {
      stroke(mx, mz, my);
    }
    if (key =='c') {
      stroke(mz, mx, my);
    }
    if (key =='a') {
      stroke(255, my, mz);
    }
    if (key =='s') {
      stroke(mx, 255, my);
    }
    if (key =='d') {
      stroke(mz, mx, 255);
    }
    if (key =='q') {
      stroke(0, my, mz);
    }
    if (key =='w') {
      stroke(mx, 0, my);
    }
    if (key =='e') {
      stroke(mz, mx, 0);
    }
    if (key =='h') {
      fill(220);
      textSize(50);
      text(">QWE ASD ZXC", 40, 250); 
      text(">press and drag", 40, 300); 
      text(">click to clear", 40, 350);
      text(">H for help", 40, 400);
      text(">enjoy", 40, 450);
    }
  }
  else weight=0.1;

  if (mousePressed) {
    fill(255);
    rect(0, 0, width, height);
  }
}
