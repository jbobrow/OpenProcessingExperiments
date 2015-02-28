
/* I create an octopus class. When there is another object near it, it will spray ink.
 Within the void display, I used scale to change the size of the octopus easily; I used translate to make it easy to 
 draw the octopus and its legs; I used pushMatrix and popMatrix to remember the defult origin.
 Within the void move, I used a boolean to set defult situation as false and if there is an object near it will be true;
 I used a for loop to go over each object on the screen and within the for loop is an if statement; 
 the if statement is to test if there is an object near my octopus. When the if statement is true, 
 it will spray ink and cover the nearby object. */

/* draw the class of my octopus and name it XHuangObj */
class XHuangObj extends AnimatedObject { 

  /*fields, define variables for location, speed and a radius*/
  float x, y, Size, vx, vy, d;

  /** Constructor, give values to variables */
  XHuangObj(float size) {

    //let my object oppear randomly in the middle area of the screen
    x=random (300, 500);
    y=random (300, 400);

    //set the size range. the original size is too big so I set all of them smaller than 1. 
    Size= random (0.3, 0.8);

    //set the speed.
    vx=random (-3, 3);
    vy=random (-2, 2);

    //set the radius of the octopus inner eyes
    d=30;
  }

  //draw my object octopus
  void display() {

    //remember the defult origin.
    pushMatrix();

    //set the center of the octopus head as origin
    translate (x, y);

    //change the size of the octopus
    scale (Size);

    //make the stroke color black
    stroke (0);

    //set the normal stroke weight
    strokeWeight (1);

    //draw the pink head
    fill (255, 105, 180);
    ellipse (0.0, 0.0, 5*d, 5*d);

    //draw the outer white eyes
    fill (255, 255, 255);
    ellipse (-d, -d/2, 2*d, 2*d);
    ellipse (d, -d/2, 2*d, 2*d);

    //draw the inner blue eyes
    fill (0, 0, 255);
    ellipse (-d/1.5, -d/2, d, d);
    ellipse (d/1.5, -d/2, d, d);

    //draw the outter pink mouth
    fill (255, 105, 180);
    ellipse (0, d+10, 2*d, 2*d);

    //draw six pink legs
    bezier (-5, 76, 9, 200, 55, 137, 34, 61);
    bezier (5, 76, -9, 200, -55, 137, -34, 61);
    bezier (24, 65, 56, 161, 103, 118, 55, 50);
    bezier (-24, 65, -56, 161, -103, 118, -55, 50);
    bezier (38, 60, 102, 121, 155, 79, 65, 34);
    bezier (-38, 60, -102, 121, -155, 79, -65, 34);

    //draw the inner dark pink mouth
    fill (255, 20, 147);
    ellipse (0, d+10, 1.3*d, 1.3*d);

    //return to the defult origin
    popMatrix ();
  }


  //set up a move function for my octopus so that it will move around the screen and 
  // spray ink when there is another object near it.

  void move(PVector[] allObjectsLocations) {

    //set defult situation as false
    boolean sprayNow=false;

    //set up a for loop to go ever every other object on the screen
    for (int i=0; i<allObjectsLocations.length; i++) {

      // set up the distance between other objects and my octopus as distance.
      float distance= dist (x, y, allObjectsLocations[i].x, allObjectsLocations[i].y);

      //set up an if statement to see if there is another object near my octopus, not including my octopus itself.
      //if yes, boolean sprayNow equals true. 
      if (distance<5*d && distance>=1) {
        sprayNow=true;
      }
      else {
        sprayNow=false;
      }
    }
    
    //set up an if statement to spray ink. if the boolean sprayNow is ture, a black circle will cover the nearby object.
    if (sprayNow) {
      fill (0);
      ellipse (x, y, 7*d, 7*d);
    }

    
    //let my octopus move around the screen. 
    x+= vx;
    y+= vy;

    //let the octpus always move within the screen
    if (x<=2.5*d && vx<0 || x>= 800-2.5*d && vx>0) {
      vx=-vx;
    }
    if (y<=2.5*d && vy<0 || y>=500-2.5*d && vy>0) {
      vy=-vy;
    }
  }


  //return position x
  int getX() { 
    return int (x);
  }

  //return position y
  int getY() { 
    return int (y);
  }
}


void drawTankBackground() {
}


