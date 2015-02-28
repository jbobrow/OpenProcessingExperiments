
/*
Made by SumWon from 11/14/09 - 11/15/09


Instructions:

Left click on a ball to raise it's height
and release to drop it or right click and
drag a ball to raise it's height accordingly.

You can also drag while left clicking to effect
many balls.

Lastly, press the space key to reset the balls
and completely calm the waves.

*/


PImage a;
float[][] heightMap;
float[][] velMap;
float gravity=0.1;
int[] sel=null;

void setup() {
  size(480, 480,P3D);
  heightMap = new float[20][20];
  velMap = new float[20][20];
  
  noStroke();
  sphereDetail(6);
}

void draw() {
  
  //
  // Determining the change in velocity for each ball.
  //
  
  int y, x;
  for (y=0;y<20;y++) {
    for (x=0;x<20;x++) {
      if (sel != null && sel[0] == x && sel[1] == y) continue;
      float h = heightMap[x][y];
      float v = velMap[x][y];
      int x1=0;
      int y1=0;

      float f=0;
      for (y1=-1;y1<2;y1++) {
        for (x1=-1;x1<2;x1++) {
          if (x+x1 > 0 && x+x1 < 19 && y+y1 > 0 && y+y1 < 19 && (x1 != 0 || y1 != 0)) {
            f += heightMap[x+x1][y+y1];
          }
        }
      }
      f/=8;
      f = (f-h)/10;

      velMap[x][y] -= f;
      velMap[x][y] *=0.95;

      heightMap[x][y]-=velMap[x][y];
    }
  }

  //
  // Set up screen for drawing.
  //
  
  background(0);
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 0, -1); 

  translate(width/2,height/2,0);
  rotateY((mouseX*0.5+width*0.25)/float(width) * PI + PI*0.5);
  rotateX((mouseY*0.5+height*0.25)/float(height) * PI + PI*0.5);

  shininess(1.0);
  translate(200,-200,0);
  
  //
  // Draws all of the balls to the screen in the with
  // the appropriate color and position.
  //
  
  for (y=0;y<20;y++) {
    translate(-400,20,0);
    for (x=0;x<20;x++) {
      translate(20,0,heightMap[x][y]);
      int[] ball = screen2Ball(mouseX,mouseY);
      if ((ball.length==2 && ball[0] == x && ball[1] == y && sel == null) || (sel != null && sel[0] == x && sel[1] == y))
        specular(255,0,0);
      else specular(0,0,255);
      sphere(6);
      translate(0,0,-heightMap[x][y]);
    }
  }
  
  //
  // Check if the mouse is pressed, and if so, check
  // which button is pressed and what ball it is
  // pressed over.
  //
  
  if (mousePressed) {
    if (mouseButton == LEFT) {
      int[] ball = screen2Ball(mouseX,mouseY);
      if (ball.length==2) {
        velMap[ball[0]][ball[1]] = 0;
        heightMap[ball[0]][ball[1]] = 100;
      }
    }
    else if (mouseButton == RIGHT) {
      if (sel == null) {
        int[] ball = screen2Ball(mouseX,mouseY);
        if (ball.length==2) {
          sel = ball;
        }

      }
      else {
        heightMap[sel[0]][sel[1]] += (pmouseY-mouseY);
        velMap[sel[0]][sel[1]] = 0;
      }
    }
  }
}
void keyPressed() {
  if (key == ' ') {
    heightMap = new float[20][20];
    velMap = new float[20][20];
  }
}
void mouseReleased() {
  if (mouseButton == RIGHT) sel = null;
}

int[] screen2Ball(int x, int y) {
  //
  // Some really crappy math do pick which ball the 2d
  // coordinates are over.
  //
  float mX = ((float)x/(float)width)*400.0;
  float mY = ((float)y/(float)height)*400.0;
  int x2 = 19-round((mX-(mX%20))/20);
  int y2 = 19-round((mY-(mY%20))/20);
  float rotX = (y*0.5+height*0.25)/float(height) * PI + PI*0.5;
  float rotY = (x*0.5+width*0.25)/float(width) * PI + PI*0.5;
  y2+=round((rotX-PI)*-4);
  x2+=round((rotY-PI)*-4);
  if (x2 < 20 && x2 >=0 && y2 < 20 && y2 >= 0)
  return new int[]{
    x2,y2  };
  else return new int[]{
    -1  };
}



