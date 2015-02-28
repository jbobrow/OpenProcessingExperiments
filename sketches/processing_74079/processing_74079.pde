
PImage bomb;  //  Setup for image
int [] position = {  //  Start of position array
  0, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550
}; // end of position array
int pos1 = position[(int)random(12)];  //  Start of position Generation. Creates 15 posible locations in total.( 15 x , 15 y )
int pos2 = position[(int)random(12)];
int pos3 = position[(int)random(12)];
int pos4 = position[(int)random(12)];
int pos5 = position[(int)random(12)];
int pos6 = position[(int)random(12)];
int pos7 = position[(int)random(12)];
int pos8 = position[(int)random(12)];
int pos9 = position[(int)random(12)];
int pos10 = position[(int)random(12)];
int pos11 = position[(int)random(12)];
int pos12 = position[(int)random(12)];
int pos13 = position[(int)random(12)];
int pos14 = position[(int)random(12)];
int pos15 = position[(int)random(12)];
int pos16 = position[(int)random(12)];
int pos17 = position[(int)random(12)];
int pos18 = position[(int)random(12)];
int pos19 = position[(int)random(12)];
int pos20 = position[(int)random(12)];
int pos21 = position[(int)random(12)];
int pos22 = position[(int)random(12)];
int pos23 = position[(int)random(12)];
int pos24 = position[(int)random(12)];
int pos25 = position[(int)random(12)];
int pos26 = position[(int)random(12)];
int pos27 = position[(int)random(12)];
int pos28 = position[(int)random(12)];
int pos29 = position[(int)random(12)];
int pos30 = position[(int)random(12)];  //  End of position generation

void setup() {  //  Start of void setup
  size(600, 600);
  background (0);
  bomb = loadImage("mine.jpg");  //  loads in image
}  //  end of void setup

void draw() {  //  start of void draw

    createGrid();  //  creates squares.
  createStart();  //  Creates start square.
  createFinish();  //  Creates end square.

  if (mousePressed) {
    bomb(pos1, pos2);  //  Sets bomb position using array generated position X and Y.
    bomb(pos3, pos4);
    bomb(pos5, pos6);
    bomb(pos7, pos8);
    bomb(pos9, pos10);
    bomb(pos11, pos12);
    bomb(pos13, pos14);
    bomb(pos15, pos16);
    bomb(pos17, pos18);
    bomb(pos19, pos20);
    bomb(pos21, pos22);
    bomb(pos23, pos24);
    bomb(pos25, pos26);
    bomb(pos27, pos28);
    bomb(pos29, pos30);
  }
  else {
    fill(255);
    rect(50, 50, 500, 500);
    fill(0);
    textSize(50);
    text("RULES", 150, 200);
    textSize(20);
    text("Move your mouse into the green\n zone, click and hold mouse button.\nThen make your way to the red zone.\n Move square by square,taking a second \nto 'rest' in it. Use any route you like, \nbut not diagonally.\nDont step on a mine!!", 100, 300);
  }
}  //  end of void draw

void createGrid() {  //  start of void draw
  for (int x=0; x<width; x+=50) {
    for (int y=0;y<height; y+=50) {

      fill(255);
      rect (x, y, 50, 50);
    }
  }
}  //  end of void draw

void createStart() {  //  Start of void createStart
  fill(0, 255, 0);
  rect(0, 0, 50, 50);
}  //  End of void createStart

void createFinish() {  //  Start of void createFinish
  fill(255, 0, 0);
  rect(550, 550, 50, 50);
}  //  End of void createFinish

void bomb(int a, int b) {  // start of void bomb
  if (a!=0 && b!=0 || a!=550 && b!=550) {  //  Checks no bomb is located in the start or finish position
    if (mousePressed == true) {
      if (mouseX > a && mouseX < (a+50) && mouseY > b && mouseY < (b+50)) {  //  Checks if mouse is located on a bomb position
        image(bomb, a, b);
        fill(random(255), random(255), random(255));
        textSize(100);
        text("BOOM!!", 150, height/2);
        textSize(50);
        text("You Have Died", 150, 450);
      }
      else {  //  If bomb is not located, creates a position marker.
        fill (0);
        ellipse (mouseX, mouseY, 25, 25);
      }
    }
  }
}  //  end of void bomb


