
/* 
 Daniel C. Young
 Paint Program
 10/13/2011
 */

int tool;
float x,y,px,py;
float r;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB, 255);
  rectMode(CENTER);
  background(30);
}

void draw() {  
  noStroke();
  if (mousePressed && mouseButton == LEFT) {
    translate(mouseX, mouseY);

    switch(tool) {

    case 1:
      fill(random(255), 255, 255, random(255));
      r=random(100);
      x = random(-50,50);
      y = random(-50,50);
      ellipse(x, y, r, r);
      stroke(255,128);
      line(x,y,px,py);
      x = px;
      y = py;
      break;
      
    case 2:
      fill(random(255), 255, 255, random(255));
      r=random(80);
      rotate(frameCount/10.0);
      rect(random(-50,50), random(-50,50), r, r);
      break;

    case 3:
      //strokeWeight(random(10));
      stroke(255, random(255));
      line(random(-10, 10), random(-10, 10), random(-100, 100), random(-100, 100));
      break;

    case 4:
      strokeWeight(1);
      stroke(random(255), 255, 255, random(255));
      line(random(-10, 10), random(-10, 10), random(-width, width), random(-height, height));
      break;
    }
  }
  
  // reset canvas on right mouse click
  else if (mousePressed && mouseButton == RIGHT) {
    background(30);
  }
}

void keyPressed() {
  println(keyCode);
  if (keyCode==49) {
    tool = 1;
  }
  if (keyCode==50) {
    tool = 2;
  }
  if (keyCode==51) {
    tool = 3;
  }
  if (keyCode==52) {
    tool = 4;
  }
  if (keyCode==83) {
    saveFrame("paint-##.tif");
  }
}


