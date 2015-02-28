
/*
* a simple sketch by Cym - http://cymspace.net/
* as part of the processing lessons, September 29, 2009
* 
* connect dots in any order to create a small house
*
* five dots, each dot changes on mouseover and can be clicked
* if a dot is clicked a line starts from there to the mouseposition
* if the next dot is clicked, a line is drawn from the first dot to
* to the second dot
* the second dot becomes the first dot for the next line
*
* goal of the game is to connect the dots in in such a way that a
* little house is drawn with a cross in the middle
* you cannot draw a line again which was already drawn
* you solve the game if you finish the house with 8 lines
*
* Examples -> Topics -> Advanced Data -> ArrayListClass
* was used as an example to help with the arrays and classes
*
* Examples -> Topics -> GUI -> Button
* was used as an example to help with the buttons and mouseovers
*/

color dotColor = color(192);
color dotColorOver = color(255);
color dotColorClicked = color(255,255,0);

// arrays are used to store the dots and to store the lines
Dot[] dots = new Dot[5];
Line[] lines = new Line[8];

// 99 is just a number to indicate that no dot is selected
// it cannot be zero, because the first element in the array is zero
int selectedDot=99, startDot = 99, endDot = 99;

// the puzzle should be solved with just 8 lines
// each time a dot is clicked counts as a line
int totalLines = 0;

// if a dot is selected draw a line from that dot to the mouse position
boolean drawing;
boolean solved;

void setup() {
  size(200, 200);
  frameRate(15);
  
  drawing=false;
  solved=false;

/* create each dot, the coordinates are fix */  
  dots[0] = new Dot(60,160);
  dots[1] = new Dot(60,80);
  dots[2] = new Dot(100,30);
  dots[3] = new Dot(140,80);
  dots[4] = new Dot(140,160);

/* set the color for each dot and draw the dot */
  for(int i=0; i<5; i++) {
    dots[i].c = dotColor;
    dots[i].display(dots[i].c);
  }

/*  there are only eight lines possible
 *  each line has two possible directions
 *  the coordinates for each line are taken from the dots
 */
  lines[0] = new Line(0,1);
  lines[1] = new Line(0,3);
  lines[2] = new Line(0,4);
  lines[3] = new Line(1,2);
  lines[4] = new Line(1,3);
  lines[5] = new Line(1,4);
  lines[6] = new Line(2,3);
  lines[7] = new Line(3,4);
}

void draw() {
  background(205);
  
  /* draw the dots */
  for(int i=0; i<5; i++) {
    dots[i].display(dots[i].c);
  }

  /* draw the lines */
  for(int i=0; i<8; i++) {
    if (lines[i].visible==true) { lines[i].display(); }
  }
  
  /* draw a line on mouse movement */
  if (drawing==true) {     
    line(dots[selectedDot].x,dots[selectedDot].y,mouseX,mouseY);
  }
}

void mousePressed() {
  // do nothing on mousePress
}

void mouseReleased() {
  if(solved==false) {
    // each click counts for the answer
    // the puzzle needs to be solved with just 9 clicks
    totalLines++;
    
    // reset the last selected dot
    if(selectedDot!=99) {
      dots[selectedDot].c=dotColor;
    }
    
    /* find out which dot was selected */
    drawing=false;  
    for(int i=0; i<5; i++) {
      if((dots[i].selected()==true) && (i!=startDot)) {
        drawing=true;
        dots[i].c=dotColorClicked;
        selectedDot=i;
        break;
      }
    }
    
    if (drawing==true) {
      if(startDot==99) {
        startDot=selectedDot;
      } else if (endDot==99) {
        endDot=selectedDot;
        drawLine(startDot,endDot);
        if(totalLines==9) {
         checkResult();
        }
      }
      startDot=selectedDot;
      endDot=99;
    } else {
      startDot=99;
      endDot=99;
    }
  }
}

void mouseMoved() {
  if(solved==false) {
    for(int i=0; i<5; i++) {
      if(selectedDot==i) {
        // do not change on mouseover if the dot is the selected dot
      } else
      if(dots[i].selected()==true) {
        dots[i].c=dotColorOver;
      } else {
        dots[i].c=dotColor;
      }
    }
  }
}

/* mouseDrag is the same as mouseMove */
void mouseDragged() {
  mouseMoved();
}

class Dot {
  int x; // dot x position
  int y; // dot y position
  int s; // dot size
  color c; // dot color
  boolean selected;
  
  Dot(int localX, int localY) {
    x = localX;
    y = localY;
    s = 20;
    c = color(192);
  }
  
  void display(int dotColor) {
    fill(dotColor);
    ellipse(x,y,s,s);
  }
  
  boolean selected() {
/* this code makes a square over the circle */
/*   if (mouseX >= x-(s/2) && mouseX <= x+(s/2) && 
         mouseY >= y-(s/2) && mouseY <= y+(s/2)) {   */

/* code for circle taken from Examples -> Topics -> GUI -> Button */

    float disX = x - mouseX;
    float disY = y - mouseY;
  
    if(sqrt(sq(disX) + sq(disY)) < s/2 ) {
      return true;
    } else {
      return false;
    }    
  }
}

class Line {
  int startX, startY;
  int endX, endY;
  boolean visible;
  
  Line(int startDot, int endDot) {
    startX=dots[startDot].x;
    startY=dots[startDot].y;
    endX=dots[endDot].x;
    endY=dots[endDot].y;
    visible=false;
  }
  
  void display() {
    line(startX,startY,endX,endY);
  }
}

void drawLine(int startDot,int endDot) {
  
  /* set a and b to something different than from 0 to 4 */
  int a = 9;
  int b = 9;
  
  /* change the order of the selected dots, so that the 
   * dot with the lowest number comes first
   * then check which line fits to the selected dot combination
   */
  if(startDot < endDot) {
    a = startDot;
    b = endDot;
  } else if(startDot > endDot) {
    a = endDot;
    b = startDot;
  } else {
    drawing=false;
  }
  
  if(drawing==true) {
    if((a==0)&&(b==1)) { lines[0].visible=true; }
    if((a==0)&&(b==3)) { lines[1].visible=true; }
    if((a==0)&&(b==4)) { lines[2].visible=true; }
    if((a==1)&&(b==2)) { lines[3].visible=true; }
    if((a==1)&&(b==3)) { lines[4].visible=true; }
    if((a==1)&&(b==4)) { lines[5].visible=true; }
    if((a==2)&&(b==3)) { lines[6].visible=true; }
    if((a==3)&&(b==4)) { lines[7].visible=true; }
  }
 	
}

void checkResult() {
  int countLines=0;
  for(int i=0; i<8; i++) {
    if (lines[i].visible==true) { 
      countLines++;
    }
  }
  if(countLines==8) {
    for(int i=0; i<5; i++) {
      dots[i].c=color(192,0,0);
    }
    drawing=false;
    solved=true;
  }
}

