
void setup() {
  size (900, 900);
  noStroke();
}

//basic shape of main brush
void splatShape() {
  rect (0, 0, random(9, 10), random(9, 10));
}
//the shape of ciclebrush
void circleround() {
  fill(10, 10, 10, 50);
  ellipse (0, 0, 20, 20);
}
//for the small part of main brush
void smallSplat() {
  pushMatrix();
  translate(random(-20, 20), random(-20, 20));
  scale(random(0.1, 0.5));
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  splatShape();
  popMatrix();
}
//for the big part of main brush
void bigSplat() {
  pushMatrix();
  translate(random(-20, 20), random(-20, 20));
  scale(random(1, 1.5));
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
  smallSplat();
  smallSplat();
  smallSplat();
  smallSplat();
  splatShape();
  popMatrix();
}
//Setting of main brush
void drawBrush() {
  bigSplat();
  bigSplat();
  bigSplat();
  bigSplat();
}
//Setting of sub (circle) brush
void drawcircleBrush() {
  pushMatrix();
  circleround();
  circleround();
  circleround();
  circleround();
  circleround();
  circleround();
  circleround();
  popMatrix();
}

//let's draw
void draw() {

  //you can draw in main brush by pressing left mouse button
  if (mousePressed && (mouseButton == LEFT)) {
    translate(mouseX, mouseY);
    translate(random(-4, 4), random(-4, 4));
    drawBrush();
  } 
  else {
  }

  //if you press the 'c' key, whole screen will be clear with cyan
  if (keyPressed) {
    if (key == 'c'  || key == 'C') {
      background(90, 255, 255);
    }
    //if you press the 'r' key, whole screen will be clear with red
    if (key == 'r' || key == 'R') {
      background(200, 75, 75);
    }
    //if you press the 'w' key, whole screen will be clear with pure white
    if (key == 'w' || key == 'W') {
      background( 255, 255, 255, 255);
    } 
    //if you press the 'p' key, whole screen will be clear with purple
    if (key == 'p' || key == 'P') {
      background(165, 75, 200);
    }
    //if you press the 'o' key, whole screen will be clear with orange
    if (key == 'o' || key == 'O') {
      background(220, 150, 40);
    }
    //if you press the 'b' key, whole screen will be clear with blue
    if (key == 'b' || key == 'B') {
      background(75, 95, 200);
    }
    //if you press the 'y' key, whole screen will be clear with yellow
    if (key == 'y' || key == 'Y') {
      background(255, 250, 100);
    }
    //if you press the 'g' key, whole screen will be clear with green
    if (key == 'g' || key == 'G') {
      background(90, 250, 90);
    }
  }
  if (mousePressed && (mouseButton == RIGHT)) {
    translate(mouseX, mouseY);
    drawcircleBrush();
  }
}
