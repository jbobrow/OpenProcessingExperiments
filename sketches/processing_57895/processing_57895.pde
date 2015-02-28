
//import processing.opengl.*;

int x = 150;
int y = 150;
float easing = 0.1;
//float inc = 0;

void setup() {
  smooth();
  stroke(157);
  //size(600, 600, OPENGL);
  size(600, 600);
}

void draw() {
  //float c = map(mouseX, mouseY, 200, 0, 255);
  //stroke(c);
  //lights();
  background(255);
  //inc += 0.05;
  //pushMatrix();

  //rotateX(inc);
  //rotateY(inc);

  //if (keyPressed) {
  //  if (key == 'a') {
  //    int targetX = mouseX;
  //    x += (targetX - x) * easing;

  //    int targetY = mouseY;
  //    y += (targetY - y) * easing;
  //  }

    if(mousePressed){
    int targetX = mouseX;
     x += (targetX - x) * easing;
     
     int targetY = mouseY;
     y += (targetY - y) * easing;
    }
  //}

 // else {
 // }

  strokeWeight(2);
  fill(255);
  ellipse(x+150, y+250, 60, 150);

  fill(255);
  ellipse(x+150, y+150, 200, 180);

  strokeWeight(1.5);
  fill(255, 0, 0, 500);
  ellipse(x+115, y+115, 50, 60);
  fill(255, 0, 0, 500);
  ellipse(x+190, y+115, 50, 60);

  strokeWeight(2);
  fill(255);
  ellipse(x+100, y+255, 70, 25);
  ellipse(x+200, y+255, 70, 25);
  //popMatrix();
}


