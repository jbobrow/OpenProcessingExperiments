
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/6424*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

int page = 1;
PImage maze1;
PImage maze2;
PImage maze3;
PImage mochi;
PImage finalpage;

int x = 15;
int y = 430;

float mochiwidth = 25; //width of mochi
float mochiheight = 40; //heig      ht of mochi

int a = 75;
int b = 8;

int c = 15;
int d = 435;

void setup() {
  size(640, 480);
  smooth();
  mochi = loadImage("littlemochi.png");
  maze1 = loadImage("maze_1.png");
  maze2 = loadImage("maze_2.png");
  maze3 = loadImage("maze_3.png");
  finalpage = loadImage("finalpage2.png");
}


void draw() {

  // Draw Maze
  background(255.0);
   if (page == 1) {
  image(maze1, 0, 0);

  // Controls
  checkPoint(x + 10, y + 20); // Offset to move toward the center

  // Draw Mochi
  image(mochi, x, y, mochiwidth, mochiheight);
   }
   
    if (page == 2) {
  image(maze2, 0, 0);

  // Controls
  checkPoint2(a+10, b+10); // Offset to move toward the center

  // Draw Mochi
  image(mochi, a, b, mochiwidth-10, mochiheight-15);
   }
   
       if (page == 3) {
  image(maze3, 0, 0);

  // Controls
  checkPoint3(c+10, d+10); // Offset to move toward the center

  // Draw Mochi
  image(mochi, c, d, mochiwidth-10, mochiheight-15);
   }
   
   if (page == 4) {
  image(finalpage, 0, 0);

  // Draw Mochi
  image(mochi, 350, 160, 100, 160);
   }
   
     if (page == 1) {
    if ((x > 500) && (x < 550) && (y < 40) && (y > 0)) {
      page = 2;
      } 
     }
     if (page == 2) {
         if ((a > 550) && (a < 600) && (b > 450) && (b < 480)) {
             page = 3;
             }
            }
     if (page == 3) {
         if ((c > 600) && (c < 640) && (d > 100) && (d < 130)) {
             page = 4;
             }
            }
            
     if (page == 4) {
         if (mousePressed == true) {
             page = 1;
             }
            }

}

void checkPoint(int cx, int cy) {

  if (keyCode==UP) {  // UP
    if (red(get(cx, cy-1)) == 255) {
      y--;
    }
  }
  else if (keyCode==DOWN) {  // DOWN
    if (red(get(cx, cy+1)) == 255) {
      y++;
    }
  }
  else if (keyCode==LEFT) {  // LEFT
    if (red(get(cx-1, cy)) == 255) {
      x--;
    }
  }
  else if (keyCode==RIGHT) {  // RIGHT
    if (red(get(cx+1, cy)) == 255) {
      x++;
    }
  }
}

void checkPoint2(int cx, int cy) {

  if (keyCode==UP) {  // UP
    if (red(get(cx, cy-1)) == 255) {
      b--;
    }
  }
  else if (keyCode==DOWN) {  // DOWN
    if (red(get(cx, cy+1)) == 255) {
      b++;
    }
  }
  else if (keyCode==LEFT) {  // LEFT
    if (red(get(cx-1, cy)) == 255) {
      a--;
    }
  }
  else if (keyCode==RIGHT) {  // RIGHT
    if (red(get(cx+1, cy)) == 255) {
      a++;
    }
  }
}

void checkPoint3(int cx, int cy) {

  if (keyCode==UP) {  // UP
    if (red(get(cx, cy-1)) == 255) {
      d--;
    }
  }
  else if (keyCode==DOWN) {  // DOWN
    if (red(get(cx, cy+1)) == 255) {
      d++;
    }
  }
  else if (keyCode==LEFT) {  // LEFT
    if (red(get(cx-1, cy)) == 255) {
      c--;
    }
  }
  else if (keyCode==RIGHT) {  // RIGHT
    if (red(get(cx+1, cy)) == 255) {
      c++;
    }
  }
}

boolean overButton(int x1, int x2, int y1, int y2) {
  if ((mouseX > x1) && (mouseX < x2) && (mouseY > y1) && (mouseY < y2)){
    return true;
  }
  else {
    return false;
  }
}



