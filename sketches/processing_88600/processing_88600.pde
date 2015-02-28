
float x;
float y;
float px;
float py;
float easing=0.04;

void setup(){
  smooth();
  stroke(0, 102);
  fill(0, 102);
  size(700,500);
  textSize(22);
   fill(0,0,0);
   textAlign(CENTER);
   text("Right/Left Click For Color Change", 350, 250);
}

void draw() {
  background(100,267,39);
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  float targetX = mouseX;
  x += (targetX - x) * easing;
  ellipse(x, 40, 12, 12);
  println(targetX + " : " + x);
  strokeWeight(weight);
  ellipse(mouseX, mouseY, pmouseX, pmouseY);
    rect(350, 275, 150, 350);
  if (mousePressed) {
    if (mouseButton == LEFT) {
      stroke(255);
    } else {
      stroke(0);
    }
    line(0, height, width, 0);
  }
   textSize(22);
   fill(0,0,0);
   textAlign(CENTER);
   text("Right Click and Left Click to Change Colors", 350, 250);
  }



