
/*****************************************
 *Assignment 4
 *Name: Graham Barrett
 *E-Mail: rbarrett@haverford.edu
 *Course: CS 110 - Section 01
 *Submitted:October 25th,2012
 *
 *In the following code a face is generated
 *whose face shifts from a frown to a smile over time.
 *The mouth consists of a curve whose control
 *points shift to enact the change from the frown
 *into the smile. Every time the mouse button is
 *clicked a face is generated randomly on the
 *screen and up to 5 faces can be drawn on the
 *screen at a given time.
 ***********************************************/

/* class Face represents a single Face that consists
of the Head, the Eye's, the Mouth, and the animation
for changing the Face's frown into a smile*/
class Face {

  // The Face's x-coordinate
  int x;

  //The Face's y coordinate
  int y;

  // 1st control point
  int cx1;

  // 2nd control point
  int cy;

  // 3rd Control point
  int cx2;

  /* The Face's Constructor Code*/

  Face(int x, int y) {
    this.x = x;
    this.y = y;
    cx1=(int)x - 30;
    cy = (int)y + 5;
    cx2=(int)x + 30;
  }

// Displays class Face's facial features 

  void display () {

    //Face
    strokeWeight(1);
    fill (200, 220, 0);
    ellipse (x, y, 90, 90);

    //Eye #1
    strokeWeight(4);
    line (x - 15, y - 25, x - 15, y - 5);

    //Eye #2
    strokeWeight (4);
    line(x + 15, y - 25, x + 15, y - 5);

    //Mouth
    strokeWeight (3);
    bezier(x - 30, y + 20, cx1, cy, cx2, cy, x + 30, y + 20);
  }

    /* This code allows for the mouth to switch
    from the frown and change into the frown. 
    This is done by increasing the y values of
    the bezier curve's (representng the mouth)
    control points until they reach the max coordinates
    of the bezier's control points that were 
    set for the smile */
    
  void move () {
    if (cy != (int) y + 35) {
      cy ++;
    }
  }
}

/*Below is the array that class Face belongs 
to as an object to be called everytime the
Mouse Button is pressed*/

/* Class Face's Max_Num_of_Objects in the 
array, equal to 5, the array's index, and
the code that draws a new face*/

int N= 5;
int idxfaces = 0;
Face[] faces = new Face[N];

// Setup for the entire image

void setup () {
  size (500, 500);
  background (0, 150, 150);
  smooth ();
}

/*The draw function for the Face which draws 
a new face up, displays class Face, and moves 
the mouth on the face until the Maximium Number of
Objects is reached and a new background is 
generated as well as removing the first generated
face in the array*/

void draw () {
  background (0, 150, 150);
    for (int i=0; i<faces.length; i++) {
    if (faces[i] != null) {
       faces[i].move();
      faces[i].display();
    }
  }
}

/*Everytime the Mouse Button is Pressed, a new
Face is drawn at the Current Position of the 
Mouse*/

void mousePressed () {
    faces[idxfaces] = new Face(mouseX, mouseY);
  idxfaces = (idxfaces+1) % N;
}
