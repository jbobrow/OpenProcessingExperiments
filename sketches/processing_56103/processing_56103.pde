
//Belinda Yuqi Ding
//drawing of a robot using variables
//adding interactive functions
//such as mouse and key functions

//main settings
void setup () {
  size(400, 500);
  background(200);
  smooth();
}

void draw () {
  //variables
  int xL = 100; // x-coordinate of centre of left eye
  int yL = 80; // y-coordinate of centre of left eye
  int xR = 280; // x-coordinate of centre of right eye
  int yR = 150; // y-coordinate of centre of right eye

  int dL = 70; // diameter of left eye
  int dR = 100; // diameter of right eye
  int rL = dL / 2; // radius of left eye
  int rR = dR / 2; // radius of right eye

  int eyeW = 25; // width of eye white
  int eyeHL = 200; //distance between left eye and head
  int eyeHR = eyeHL - (yR - yL); //distance between right eye and head

  int x = (xR - xL) / 2 + xL; // x-coordinate of head
  int y = xL + eyeHL; // y-coordinate of head
  int headW = 150; // half the width of the head
  int headH = 40; // half the height of the head

  int neckH = 40; // height of the neck
  int bodyH = 50; // height of the body
  int bodyW = 250; // width of the body
  int wheelD = 50; // diameter of the wheel
  
  strokeWeight(3);
  //change thickness of lines when mouse buttons pressed
  if (mousePressed) {
    if (mouseButton == LEFT) {
      strokeWeight(1);
    } else if (mouseButton == RIGHT) {
      strokeWeight(5);
    }
  }

  //move eyes, up and down, left and right, with arrows keys
  if (keyPressed && (key == CODED)) {
    if (keyCode == LEFT) {
      xL -= 5;
      xR -= 5;
    }
    if (keyCode == RIGHT) {
      xL += 5;
      xR += 5;
    }
    if (keyCode == UP) {
      yL -= 5;
      yR -= 5;
    }
    if (keyCode == DOWN) {
      yL += 5;
      yR += 5;
    }
  }
  background(200);

  //eye left
  
  fill(255);
  ellipse (xL, yL, dL, dL);
  
  fill(0);
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(#009900);
    }
  }
  ellipse (xL, yL, dL-eyeW, dL-eyeW);

  //eye right
  
  fill(255);
  ellipse(xR, yR, dR, dR);
  
  fill(0);
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(#009900);
    }
  }
  ellipse(xR, yR, dR-eyeW, dR-eyeW);

  //from left eye to head
  line(xL-5, yL+rL, xL+15, yL+rL+eyeHL); //line on the left
  line(xL+5, yL+rL, xL+20, yL+rL+eyeHL); //line on the right

  //from right eye to head
  line(xR-5, yR+rR, xR-20, yR+rR+eyeHR); //line on the left
  line(xR+5, yR+rR, xR-15, yR+rR+eyeHR); //line on the right

  //head
  
  fill(150);
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(#33CC99);
    }
  }
  ellipse(x, y, headW*2, headH*2);
  
  fill(255);
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(#FF3366);
    }
  }
  ellipse(x-headW, y+10, 50, 20); //cheek left
  ellipse(x+headW, y+10, 50, 20); //cheek right

  //neck
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(#FFFF66);
    }
  }
  triangle(x, y+headH, x+30, y+headH+neckH, x-30, y+headH+neckH);

  //wheels
  fill(180);
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(50);
    }
  }

  int count = 0;
  int distance = bodyW / 2;
  int finish = x + (bodyW / 2) - wheelD;

  while (count < finish){
    ellipse(x-distance, y+headH+neckH+bodyH, wheelD, wheelD);
    distance -= wheelD;
    count += wheelD;
  }

  //body
  fill(150);
  //change colour with key press
  if (keyPressed) {
    if ((key == 'c') || (key == 'C')) {
      fill(#33CC66);
    }
  }
  rect(x-(bodyW/2), y+headH+neckH, bodyW, bodyH);

  //ground
  int groundX = 15;
  int groundY = y + headH + neckH + bodyH + (wheelD / 2) + 5;

  line(groundX, groundY, 281, groundY);
  line(groundX+103, groundY+7, 381, groundY+7);
  line(groundX+65, groundY+14, 259, groundY+14);
  line(groundX+87, groundY+21, 234, groundY+21);
  line(groundX+100, groundY+28, 212, groundY+28);
  line(groundX+146, groundY+35, 193, groundY+35);
  
  //following the mouse
  float weight = dist (mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(weight);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

