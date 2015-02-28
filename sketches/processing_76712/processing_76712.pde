
/*****************************************
 * Assignment #4
 * Name:         Emily Chang
 * E-mail:       echang@brynmawr.edu
 * Course:       CS 110 - Section 001
 * Submitted:    10/24/2012
 * 
 * This sketch depicts leaves falling from two trees planted 
 * next to a grass lined path.
***********************************************/
/*****************************************
 * Represents one leaf falling from each tree at the same time.
 * 
 * @author Emily Chang (echang@brynmawr.edu)
 *
***********************************************/
class FallLeaves {
  int locx; 
  int locy;
  int yspeed;

  FallLeaves (int xlocation, int ylocation) {
    locx = xlocation;
    locy = ylocation;
  }

  void display () {
    stroke (175, 50, 0);
    fill(200, 100, 0);
    ellipse(locx, locy, 15, 30);
    fill(225, 75, 0);
    ellipse (locx + 50, locy + 50, 10, 25);
}

  void speed () {
    locy ++;
  }
}

// The maximum number of objects that can be displayed at once
int Max_objects = 10;

// An array of all the created objects
FallLeaves [] leaves = new FallLeaves[Max_objects];

//index of created objects
int idxleaves = 0;

void setup() {
    size(500,500);
    smooth ();
}

void draw() {
  background(0, 130, 160);
//draw grass
noStroke();
  fill (0, 75, 30);
  rect(0,350, width, 100);
//draw concrete path
  fill(150);
  rect(0, 450, width, 50);
//draw trees
  noStroke();
  fill(75, 25, 25);
  rect(0, 0, width/5, height);
  rect(400, height/2, width/8, height);
  fill(200, 100, 0);
  ellipse(0, 25, width, height/2);
  fill(225, 75, 0);
  ellipse(width-75, height/2, width/2, height/3);  
//draw leaves if fewer than maximum (Max_objects) are on screen  
  for (int i = 0; i < Max_objects; i++) {
      if (leaves[i] != null) {
        leaves[i].display();
        leaves[i].speed();
      }
    }
}

void mousePressed () {
  leaves[idxleaves] = new FallLeaves(mouseX, mouseY);
  idxleaves = (idxleaves+1) % Max_objects;
}
