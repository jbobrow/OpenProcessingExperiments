
/**
Assignment 4
Susan Anderson
swanderson@brynmawr.edu
CS 110 - 001
10/24/12

In this program a hillbilly plays a banjo.  The hillbilly and the background
(grass, sky, and sun) are static.  When the user presses the mouse, a musical 
note appears and floats off into the distance.
**/

int maxObjects = 3;
int indexNotes = 0;

Note [] myNote = new Note[maxObjects];

int [] xpos = new int [maxObjects];
int [] ypos = new int [maxObjects];

void setup() {
  size(500, 500);
  smooth();
}

void draw () {
  background(0, 160, 255);
  fill(0, 255, 160);
  rect(0, 400, width, 200);
  fill(255, 234, 0);
  ellipse(width, 0, 200, 200);
  
  for (int i = 0; i < myNote.length; i++) {
    if (myNote[i] != null) {

      myNote[i].display(); 
      myNote[i].move();
    }
    else {
    }
  }
  //drawing of hillbilly
  noStroke();
  fill(0, 0, 255);
  //overalls, body, right upper arm
  rect(230, 350, 40, 100);
  fill(255, 174, 142);
  rect(235, 350, 30, 30);
  rect(230, 350, 2, 30);
  rect(268, 350, 2, 30);
  stroke(255, 174, 142);
  strokeWeight(5);
  line(270, 370, 300, 375);
  //head
  ellipse(250, 340, 60, 60);
  //eyes
  strokeWeight(0);
  stroke(0);
  fill(255);
  ellipse(237, 330, 20, 20);
  ellipse(263, 330, 20, 20);
  fill(0);
  ellipse(237, 330, 10, 10);
  ellipse(263, 330, 10, 10);
  //mouth
  arc(250, 345, 40, 40, 0, 3.142);
  fill(255);
  rect(240, 345, 5, 5);
  //shoes
  fill(52, 34, 23);
  arc(230, 450, 20, 10, 3.142, 6.283);
  arc(270, 450, 20, 10, 3.142, 6.283);
  //hair
  stroke(50, 30, 20);
  strokeWeight(2);
  line(250, 309, 250, 300);
  line(260, 310, 265, 302);
  line(240, 310, 235, 302);
  //pants line
  strokeWeight(1);
  stroke(0);
  line(250, 400, 250, 449);
  //banjo
  fill(255);
  ellipse(240, 400, 40, 40);
  strokeWeight(10);
  stroke(131, 86, 50);
  line(240, 400, 300, 360);
  strokeWeight(1);
  stroke(0);
  line(240, 398, 300, 358);
  line(240, 402, 300, 362);
  //lower right arm part, left arm, hands
  stroke(255, 174, 142);
  strokeWeight(5);
  line(300, 375, 265, 387);
  noStroke();
  fill(255, 174, 142);
  ellipse(265, 387, 8, 8);
  ellipse(220, 390, 8, 8);
  stroke(255, 174, 142);
  line(228, 370, 200, 375);
  line(200, 375, 220, 390);

  strokeWeight(1);
  stroke(0);
  fill(255);
}

/**
Displays a musical note that moves up and to the right
**/
class Note {
  int x;
  int y;

  Note(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
/** 
Displays the circle and rectangle that make up the musical note.
**/
  void display() {
    fill(0);
    ellipse(x, y, 10, 10);
    rect(x+3, y-17, 2, 14);
  }
/** 
Updates the values of x and y so the note moves up and to the right
**/
  void move() {
    x = x+1;
    y = y-1;
  }
}

void mousePressed() {
  /**
  Stores the coordinates of the mouse in arrays and uses those arrays
  to signify the x and y positions of the musical notes.
  **/
  for (int i=0; i < 3; i++) {
    xpos[i] = mouseX;
    ypos[i] = mouseY;
    myNote[i] = new Note(xpos[i], ypos[i]);
    indexNotes = (indexNotes+1) % maxObjects;
  }
}




