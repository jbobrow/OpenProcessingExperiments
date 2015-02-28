
/* Natalia Monroy 
 Intro to Digital Design G (8196)
  University of Canberra

 */

MyCircle g; // declaring two objects one called g the other h 
MyCircle h;


void setup() {  //runs once at the beginning 
  size (500, 500); //size of screen in pixels
  smooth(); // will make drawing edges smoother 
  background(255, 100, 1); //sets background colour, I placed it here so it will run once allowing the  rest of the frames to be visible
  g = new MyCircle(width/2, height/2, 20, 10); //initialising objects g & h declared above. here I'm  assigning values for x & y (centre point), diameter and speed.
  h = new MyCircle(width/2, height/2, 10, 15);
}

void draw() { //runs non stop util stop is pressed 
  fill(255,100);// fills object g with the given colour and a transparency
  stroke(0,  100, 40);// sets the colour of the stroke for object g
  g.move();// calling methods (move and diplay)  for g object
  g.display();
  g.stop();
  fill(0,  100, 40, 100); //fills object h with given colour
  stroke(255);// set the colour of the stroke for h
  h.move();// calling methods (move and diplay) in for h object
  h.display();
  h.stop();
}


class MyCircle {  //class name in this case MyCircle with data variables 
  float x;
  float y;
  float diameter;
  float speed;


  MyCircle (float initialX, float initialY, float initialDiameter, float initialSpeed) {  //the constructor, what draws the objects
    x = initialX; //the x values for the objects. 250, because it is using the intial x value which is stated above to be width/2.
    y = initialY;// same as above but for the y value
    diameter = initialDiameter;// set above to be 20 & 10
    speed = initialSpeed;// set above to 15 & 30

  }

  void move() {// method move, this adds the movement functionality to the objects 
    x += random(-speed, speed); //a variable for movement in the x axis between (-10, 10) & (-15,15) 
    y += random(-speed,speed);// a variable for movement in the y axis between (-10, 10) & (-15,15)
  }

  void display() {//method display, how objects will be displayed
    ellipse(x, y, diameter, diameter);
  }
  /*
  I wanted to code a certain set of values to make the looping stop
  after a few errors this  bit of code from class did the trick
  */
  void stop() { //method stop, how drawing will stop
  if (x < 0 || x > width) // if x is less than 0 or greater than width run the code
  {
  noLoop(); //stop drawing
}
if (y < 0 || y > height) //if y is less than 0 or greater than height run the code
{
  noLoop();
}
  }
}



