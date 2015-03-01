
PImage[] buttons;
int selButton = 0;

int rx = 45;
int rxx = 54;
int ry = 20;

int ex = 48;
int exx = 109;

int r = 15;
int a = 20;

int drawCir = 213;

/* @pjs preload="deco1.png"; */
/* @pjs preload="deco2.png"; */
/* @pjs preload="deco3.png"; */
/* @pjs preload="deco4.png"; */
/* @pjs preload="c1.png"; */
/* @pjs preload="c2.png"; */
/* @pjs preload="c3.png"; */
/* @pjs preload="c4.png"; */
/* @pjs preload="c5.png"; */
/* @pjs preload="c6.png"; */
/* @pjs preload="c7.png"; */
/* @pjs preload="c8.png"; */

void setup() {
  size (600, 730); 
  smooth();
  ellipseMode(RADIUS);
  noStroke();
  background(30);

  buttons = new PImage[12];  
  buttons[0] = loadImage("deco1.png");
  buttons[1] = loadImage("deco2.png");
  buttons[2] = loadImage("deco3.png");
  buttons[3] = loadImage("deco4.png");

  buttons[4] = loadImage("c1.png");
  buttons[5] = loadImage("c2.png");
  buttons[6] = loadImage("c3.png");
  buttons[7] = loadImage("c4.png");
  buttons[8] = loadImage("c5.png");
  buttons[9] = loadImage("c6.png");
  buttons[10] = loadImage("c7.png");
  buttons[11] = loadImage("c8.png");

  //drawing board
  noStroke();
  fill(90);
  ellipse(300, 300, 225, 225);
  fill(255);
  ellipse(300, 300, drawCir, drawCir);
  ellipse(300, 34, 8, 8);
}

void draw() {


  if (87 < mouseX && mouseX < 87+rx && 550 < mouseY && mouseY < 550+ry) {
    fill(255); ellipse(300, 34, 10, 10);
  }
  if (87+rxx < mouseX && mouseX < 87+rxx+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(139, 214, 175); ellipse(300, 34, 10, 10);
  }
  if (87+rxx*2 < mouseX && mouseX < 87+rxx*2+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(255, 244, 113); ellipse(300, 34, 10, 10);
  }
  if (87+rxx*3 < mouseX && mouseX < 87+rxx*3+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(242, 153, 122); ellipse(300, 34, 10, 10);
  }
  if (87+rxx*4 < mouseX && mouseX < 87+rxx*4+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(117, 81, 51); ellipse(300, 34, 10, 10);
  }
  if (87+rxx*5 < mouseX && mouseX < 87+rxx*5+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(249, 178, 170); ellipse(300, 34, 10, 10);
  }
  if (87+rxx*6 < mouseX && mouseX < 87+rxx*6+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(253, 230, 198); ellipse(300, 34, 10, 10);
  }
  if (87+rxx*7 < mouseX && mouseX < 87+rxx*7+rx && 550 < mouseY && mouseY < 550+ry) {   
    fill(229, 100, 82); ellipse(300, 34, 10, 10);
  }
  if (290 < mouseX && mouseX < 310 && 25 <mouseY && mouseY < 45) {   
    noStroke();    fill(255);
    ellipse(300, 300, drawCir, drawCir);
  }


  //buttons2
  float d = dist(mouseX, mouseY, 300, 300);


  if (mousePressed) { 

    if (mouseY > 500) {

      if (87 < mouseX && mouseX < 87+ex*2 && 602 < mouseY && mouseY < 698) selButton = 0;
      else if (87+exx < mouseX && mouseX <87+exx+ex*2 && 602 < mouseY && mouseY < 698) selButton = 1;
      else if (87+exx*2 < mouseX && mouseX < 87+exx*2+ex*2 && 602 < mouseY && mouseY < 698) selButton = 2;
      else if (87+exx*3 < mouseX && mouseX < 87+exx*3+ex*2 && 602 < mouseY && mouseY < 698) selButton = 3;

      else if (87 < mouseX && mouseX < 87+rx && 550 < mouseY && mouseY < 550+ry) selButton = 4;
      else if (87+rxx < mouseX && mouseX < 87+rxx+rx && 550 < mouseY && mouseY < 550+ry) selButton = 5;
      else if (87+rxx*2 < mouseX && mouseX < 87+rxx*2+rx && 550 < mouseY && mouseY < 550+ry) selButton = 6;
      else if (87+rxx*3 < mouseX && mouseX < 87+rxx*3+rx && 550 < mouseY && mouseY < 550+ry) selButton = 7;
      else if (87+rxx*4 < mouseX && mouseX < 87+rxx*4+rx && 550 < mouseY && mouseY < 550+ry) selButton = 8;
      else if (87+rxx*5 < mouseX && mouseX < 87+rxx*5+rx && 550 < mouseY && mouseY < 550+ry) selButton = 9;
      else if (87+rxx*6 < mouseX && mouseX < 87+rxx*6+rx && 550 < mouseY && mouseY < 550+ry) selButton = 10;
      else if (87+rxx*7 < mouseX && mouseX < 87+rxx*7+rx && 550 < mouseY && mouseY < 550+ry) selButton = 11;
    } else {
      // ...inside drawing area, draws selected button. The -50 value is to center the stamp at
      // the mouse location:
      if (d < drawCir) {
        image(buttons[selButton], mouseX-20, mouseY-20);
      }
    }
  }

  noStroke(); 
  fill(30); 
  rect(0, 550, 600, 730);
  image(buttons[0], 103, 615);
  image(buttons[1], 103+exx, 617);
  image(buttons[2], 103+exx*2, 617);  
  image(buttons[3], 103+exx*3, 618);

  //buttons
  fill(255);
  rect(87, 550, rx, ry, 2);
  fill(139, 214, 175);
  rect(87+rxx, 550, rx, ry, 2);
  fill(255, 244, 113);
  rect(87+rxx*2, 550, rx, ry, 2);
  fill(242, 153, 122);
  rect(87+rxx*3, 550, rx, ry, 2);
  fill(117, 81, 51);
  rect(87+rxx*4, 550, rx, ry, 2);
  fill(249, 178, 170);
  rect(87+rxx*5, 550, rx, ry, 2);
  fill(253, 230, 198);
  rect(87+rxx*6, 550, rx, ry, 2);
  fill(229, 100, 82);
  rect(87+rxx*7, 550, rx, ry, 2);


  noFill();
  stroke(80);
  strokeWeight(1);
  if (selButton == 0) ellipse(135, 650, ex, ex);
  else if (selButton == 1) ellipse(135+exx, 650, ex, ex);
  else if (selButton == 2) ellipse(135+exx*2, 650, ex, ex);
  else if (selButton == 3) ellipse(135+exx*3, 650, ex, ex);

 // println(mouseX, mouseY);
}



