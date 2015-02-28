
boolean clicked1 = false;
boolean clicked2 = false;
boolean clicked3 = false;
boolean clicked4 = false;
boolean button7 = true;
boolean button8 = true;
boolean button9 = false;
boolean button10 = false;

void setup() {
  size(1000, 100);
}

//Arrow 1
void draw() {
  background(255);
  noStroke();
  if (mouseX > 0 && mouseX < 100 && (mousePressed == true)) {
    fill(0);
    rect(0, 0, 100, 100);
    fill(255);
    triangle(50, 10, 30, 50, 70, 50);
    triangle(50, 90, 30, 50, 70, 50);
  }
  else {
    fill(225);
    rect(0, 0, 100, 100);
    fill(0);
    triangle(50, 10, 30, 50, 70, 50);
    triangle(50, 90, 30, 50, 70, 50);
  };
  //Arrow 2
  if (mouseX > 100 && mouseX < 200 && (mousePressed == true)) {
    fill(225);
    rect(100, 0, 100, 100);
    fill(0);
    triangle(150, 10, 130, 50, 170, 50);
    triangle(150, 90, 130, 50, 170, 50);
  }
  else {
    fill(0);
    rect(100, 0, 100, 100);
    fill(255);
    triangle(150, 10, 130, 50, 170, 50);
    triangle(150, 90, 130, 50, 170, 50);
  };
  //Arrow 3
  if (mouseX > 200 && mouseX < 300 && (mousePressed == true)) {
    clicked1 = true;
  };

  if (clicked1 == true) {
    fill(0);
    rect(200, 0, 100, 100);
    fill(255);
    arrowUp(200, 0);
  }
  else {
    fill(225);
    rect(200, 0, 100, 100);
    fill(0);
    arrowUp(200, 0);
  };

  //Arrow 4
  if (mouseX > 300 && mouseX < 400 && (mousePressed == true)) {
    clicked2 = true;
  };

  if (clicked2 == true) {
    fill(255);
    rect(300, 0, 100, 100);
    fill(0);
    arrowUp(300, 0);
  }
  else {
    fill(0);
    rect(300, 0, 100, 100);
    fill(255);
    arrowUp(300, 0);
  };

  //Arrow 5
  if (mouseX > 400 && mouseX < 500 && (mousePressed == true)) {
    clicked3 = true;
  };

  if (clicked3 == true) {
    fill(0);
    rect(400, 0, 100, 100);
    fill(255);
    arrowDown(400, 0);
  }
  else {
    fill(225);
    rect(400, 0, 100, 100);
    fill(0);
    arrowDown(400, 0);
  };

  //Arrow 6
  if (mouseX > 500 && mouseX < 600 && (mousePressed == true)) {
    clicked4 = true;
  };

  if (clicked4 == true) {
    fill(255);
    rect(500, 0, 100, 100);
    fill(0);
    arrowDown(500, 0);
  }
  else {
    fill(0);
    rect(500, 0, 100, 100);
    fill(255);
    arrowDown(500, 0);
  };

  //Arrow 7 
  int color7 = int(button7)*255;
  fill(color7);
  rect(600, 0, 100, 100);
  fill(255-color7);
  arrowUp(580, 0);
  arrowUp(620, 0);

  //Arrow 8
  int color8 = int(button8)*255;
  fill(color8);
  rect(700, 0, 100, 100);
  fill(255-color8);
  arrowDown(680, 0);
  arrowDown(720, 0);

  //Arrow 9 
  int color9 = int(button9)*255;
  fill(color9);
  rect(800, 0, 100, 100);
  fill(255-color9);
  arrowUp(780, 0);
  arrowUp(820, 0);

  //Arrow 10 
  int color10 = int(button10)*255;
  fill(color10);
  rect(900, 0, 100, 100);
  fill(255-color10);
  arrowDown(880, 0);
  arrowDown(920, 0);
}

void arrowUp (int x, int y) {
  triangle(x+50, y+10, x+30, y+50, x+70, y+50);
  rect(x+40, y+50, 20, 40);
}

void arrowDown (int x, int y) {
  triangle(x+50, y+90, x+30, y+50, x+70, y+50);
  rect(x+40, y+10, 20, 40);
}

void mousePressed() {
  //7
  if ((mouseX>600) && (mouseX<700)) {
    button7 =! button7;
  }
  //8
  if ((mouseX>700) && (mouseX<800)) {
    button8 =! button8;
  }
}
void mouseReleased() {
  //9
  if ((mouseX>800) && (mouseX<900)) {
    button9 =! button9;
  }

  //10
  if ((mouseX>900) && (mouseX<1000)) {
    button10 =! button10;
  }
}
