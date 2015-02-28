
import java.awt.Robot;
import java.awt.AWTException;
import java.awt.event.KeyEvent;
import com.sun.awt.AWTUtilities;
import java.awt.GraphicsDevice.*;
import java.awt.*;
import java.awt.geom.*;
import javax.swing.*;
  
Robot robot;
PFont font;
Boxgrid b;
int x, y, row, col;
int i=0, j=20, px, py, r=5;
  
/*------------------------------------*/
int[][] letter = {
  {
    65, 66, 67, 68, 69, 70, 71, 72, 73, 74,
  }
  , {
    75, 76, 77, 32, 32, 78, 79, 80, 81, 82
  }
  , {
    83, 84, 85, 86, 87, 88, 89, 90, 8, 8
  }
};
  
/*------------------------------------*/
void setup()
{
  size (501, 171);
  smooth(); 
  frame.removeNotify();
  frame.setAlwaysOnTop(true);
  frame.setUndecorated(true);
  frame.setFocusableWindowState(false);
  frame.setFocusable(false);
  frame.enableInputMethods(false);
  try {
    robot = new Robot();
  }
  catch(AWTException a) {
    println(a);
    a.printStackTrace();
  }
  font = createFont("HelveticaNeueLight", 48);
  textFont(font);
  px = i;
  py = j;
}
/*------------------------------------*/
void draw() {
  
  background(0);
  fill(255);
  noStroke();
  rect(width-21, 1, 19, 19, r, r, r, r);
  fill(150);
  textSize(18);
  text("X", width-17, 17);
  fill(255);
  text("Click Here & Drag to Move ", 10, 17);
  /*-----------------------------------------------------*/
  if  (mousePressed &&  width-21< mouseX && mouseY<20 )
  {
    exit();
  }
  b = new Boxgrid(px, py);
  b.display();
  /*-----------------------------------------------------*/
  for ( y= 20; y< height; y += 50) {
    for ( x= 0; x< width; x += 50) {
      if (mouseX >= x && mouseX <= x+50 &&
        mouseY >= y && mouseY <= y+50) {
        fill(0, 50);
        noStroke();
        if ( x > 350  && y==120)
        {
          if (x==400) {
            rect(x, y, 100, 50, r, r, r, r);
          }else if (x==450){
             rect(x-50, y, 100, 50, r, r, r, r);
          }
        }
        else if ( (x== 150 || x ==200 ) && y==70)
        {
          if (x==150) {
            rect(x, y, 100, 50, r, r, r, r);
          }else if (x==200){
             rect(x-50, y, 100, 50, r, r, r, r);
          }
        }
        else {
          rect(x, y, 50, 50, r, r, r, r);
        }
      }
    }
  }
}
  
int mX;
int mY;
  
void mousePressed()
{
  mX = mouseX;
  mY = mouseY;
  if (mouseY > 20) {
    for ( y= 20; y< height-20; y += 50) {
      for ( x= 0; x< width; x += 50) {
        if (mouseX >= x && mouseX <= x+50 &&
          mouseY >= y && mouseY <= y+50) {
          row = (y-20)/50;
          col = x/50;
          println(row  + " " + col);
          robot.keyPress(letter[row][col]);
          robot.keyRelease(letter[row][col]);
        }
      }
    }
  }
}
void mouseDragged()
{
  java.awt.Point p = java.awt.MouseInfo.getPointerInfo().getLocation();
  frame.setLocation(p.x - mX, p.y - mY);
}
  
class  Boxgrid {
  int bx, by;
  int lx, ly;
  int r=5;
  String[] words = {
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", " ", " ", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", " ", " "
  };
  Boxgrid(int _x, int _y)
  {
    bx = _x;
    by = _y;
  }
  void display()
  {
    for (int j=0; j<3; j++) {
      for (int i=0; i<10; i++) {
        lx = i*50+bx;
        ly = j*50+by;
        fill(255, 176, 3);
        stroke(0);
        strokeWeight(1);
        if ( i == 3 && j == 1  ) {
          fill(#009BFF);
          rect(lx, ly, 100, 50, r, r, r, r);
          fill(255);
          textSize(25);
          text("SPACE", lx+7, ly+35);
          i = 4;
        }
        else if ( i == 8 && j == 2  ) {
          fill(#009BFF);
          rect(lx, ly, 100, 50, r, r, r, r);
          fill(255);
          textSize(25);
          text("DEL", lx+30, ly+35);
          i= 9;
        }
        else
        {
          rect(lx, ly, 50, 50, r, r, r, r);
        }
        fill(255);
        textSize(30);
        if (j==0) {
          text(words[i], lx+15, ly+35);
        }
        if (j==1) {
          if (i==4)
          {
            text(words[i+10], lx-35, ly+35);
          }
          else {
            text(words[i+10], lx+15, ly+35);
          }
        }
        if (j==2) {
          text(words[i+20], lx+15, ly+35);
        }
      }
    }
  }
}

