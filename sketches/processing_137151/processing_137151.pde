
PImage img;
int a, b, c, d, e;

void setup() {
  size(400, 400);
  img = loadImage("guardar2.gif");
  background(255);
}
void draw() {


  strokeWeight(0);
  a = width-50;
  b = height-height/10;
  c = height/10;
  d = width-width/10;
  fill(#0000FF); 
  rect(width-50, 0, 50, 40);
  fill(#FF0000);
  rect(width-50, c, 50, 40);
  fill(#00FF00);
  rect(width-50, 2*c, 50, 40);
  fill(#FF00FF);
  rect(width-50, 3*c, 50, 40);
  fill(#FFFF00);
  rect(width-50, 4*c, 50, 40);
  fill(#00FFFF);
  rect(width-50, 5*c, 50, 40);
  fill(0);
  rect(width-50, 6*c, 50, 40);
  fill(255);
  rect(width-50, 7*c, 50, 40);
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(width-50, 8*c, 50, 40);
  fill(255);
  image(img, a, b);
  fill(0);
  if (mousePressed == true) {
    strokeWeight(2);
    line(pmouseX, pmouseY, mouseX, mouseY);
    if (mouseX>a && mouseX<width && mouseY>b && mouseY<2*b) {
      save("dibujo" + millis() + ".jpg");
    }
    if (mouseX>a && mouseX<width && mouseY>0 && mouseY<c) {
      stroke(#0000FF);
    }
    if (mouseX>a && mouseX<width && mouseY>c && mouseY<c*2) {
      stroke(#FF0000);
    }
    if (mouseX>a && mouseX<width && mouseY>c*2 && mouseY<c*3) {
      stroke(#00FF00);
    }
    if (mouseX>a && mouseX<width && mouseY>c*3 && mouseY<c*4) {
      stroke(#FF00FF);
    }
    if (mouseX>a && mouseX<width && mouseY>c*4 && mouseY<c*5) {
      stroke(#FFFF00);
    }
    if (mouseX>a && mouseX<width && mouseY>c*5 && mouseY<c*6) {
      stroke(#00FFFF);
    }
    if (mouseX>a && mouseX<width && mouseY>c*6 && mouseY<c*7) {
      stroke(0, 0, 0);
    }
    if (mouseX>a && mouseX<width && mouseY>c*7 && mouseY<c*8) {
      stroke(255, 255, 255);
    }
    if (mouseX>a && mouseX<width && mouseY>c*8 && mouseY<c*9) {
      stroke(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}



