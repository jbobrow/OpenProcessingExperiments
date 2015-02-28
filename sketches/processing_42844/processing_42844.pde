
//  Code by Daniel McBride, Gil Brooks and James Rodgers
//  Inspired by logic taken from proxDemo and termite


int[][] angles = { { 0, 1 }, { 1, 1 }, { 1, 0 }, { 1,-1 },      //Array that generates all of the possible angle movements from one point.
                   { 0,-1 }, {-1,-1 }, {-1, 0 }, {-1, 1 } };
                   
int numAngles = angles.length;                                  //Matching the array to the length of the sketch.
PImage img;
int num =50;                                                    //Number of things that are being drawn.
Thing [] Things = new Thing[num];                               //
int dir = 0;                                                    //Direction of the things being drawn.
int destX=400;                                                  //X destination of the things being drawn.
int destY=200;                                                  //Y destination of the things being drawn.



void setup() {
  size(600, 400);
  smooth();
  img = loadImage("hurricane1.jpg");                            //Loading and image of a hurricane.
  background(0);
  img.loadPixels();


  for (int i=0; i<num; i++) {                                   //"For" loop that places the things in the sketch.
    int x = int(random(width));
    int y = int(random(height));
    Things [i] =new Thing(x, y);
  }
}


void draw() {
  for (int i=0; i<num; i++) {                                  //"For" loop that draws the function from the class.
    Things[i].prox(Things, i);
    Things [i].update();
    Things [i].display();
  }
}

class Thing {                                                  //Class sets up the "things"
  float x, y, newX, newY;                                      //x position, y position, new x position, and new y position of the "things"
  boolean check;                                               /*Boolean that checks if the distance between the original x,y and the destination                                                             is less than the distance between the new x,y and the destination.*/
  int v;                                                       //velocity
  boolean close1;                                              //these create true/false statements for the proximity check
  boolean close2;
  boolean close3;
  float r = 10;                                                //sets the first level of proximity
  float s = 5;                                                 //sets the second level of proximity
  float t = 2;                                                 //sets the third (closest) level of proximity
  float dotsize;                                               //sets the size of the points

  Thing(float x_, float y_) {
    x=x_;
    y=y_;
  }

  void update() {                                              //Updating and moving the "things."

    for (int i=0; i<num; i++) {                                //"For" loop that generates the movement.                            
      int rand = int(random(1, 2));                            //
      dir = (dir + rand + numAngles) % numAngles;              //Direction of the "things" according to the 
      if (img.get(int(x), int(y)) == color(0)) {               //If the "things" move over a white pixel in the image the velocity increases.
        v= -3;
      }
      else {
        v = 0;
      }
      newX = (newX + angles[dir][0] + width) % width;          //Generating the newX according to the angle that is given from the array
      newY = (newY + angles[dir][1] + height) % height;        //Generating the newY according to the angle that is given from the array
      if ((dist(x, y, destX, destY))<(dist(newX, newY, destX, destY))) {       //Checking the distance between the x,y positions and the destination.
        check = true;                                                          
        x=(newX+=v);                                                           //Adding the velocity to the newX and newY
        y=(newY+=v);
        break;                                                                 //Stopping the "for" loop 
      }
      else {
        x=newX;                                                                
        y=newY;
      }
    }
  }

  void prox(Thing[] a, int num) {                              //Changes the "Things" depending on their proximity to one another

    for (int i=0; i<a.length; i++) {                           
      if (i != num) {
        if (dist(x, y, a[i].x, a[i].y) < r) {                  //Checks to see if the distance between two particles is less than 10 pixels
          close1 = true;
          break;
        }
        else {
          close1 = false;
        }
      }
    }

    for (int i=0; i<a.length; i++) {
      if (i != num) {
        if (dist(x, y, a[i].x, a[i].y) < s) {                   //Checks to see if the distance between two particles is less than 5 pixels
          close2 = true;
          break;
        }
        else {
          close2 = false;
        }
      }
    }

    for (int i=0; i<a.length; i++) {
      if (i != num) {
        if (dist(x, y, a[i].x, a[i].y) < t) {                   //Checks to see if the distance between two particles is less than 2 pixels
          close3 = true;
          break;
        }
        else {
          close3 = false;
        }
      }
    }
  }

  void display() {                                               //Displaying the sketch
    if (check==true) {                                           //"Things" are drawn if the check is true.
      if (close1 == true) {                                      //If the particles are less than 10 pixels apart, they are rendered with these qualities
        stroke(20, 20, 235);
        dotsize = 1.5;
      }
      else {
        stroke(40, 40, 225);                                     //If the particles are more than 10 pixels apart, they are rendered with these qualities
        dotsize = 1;
      }

      if (close2 == true) {                                      //If the particles are less than 5 pixels apart, they are rendered with these qualities
        stroke(100, 255, 100);
        dotsize = 1.75;
      }

      if (close3 == true) {                                      //If the particles are less than 2 pixels apart, they are rendered with these qualities
        stroke(255, 150, 0);
        dotsize = 2;
      }

      strokeWeight(dotsize);
      point(newX, newY);                                                       //Drawing the "things" as points.
    }
  }
}


