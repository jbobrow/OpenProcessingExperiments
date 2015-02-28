
/** 
 * "Disappearing Circles" by Evan Reeves 
 * 
 * Mostly an exercise in creating and manipulating arrays of variable sizes
 * using the ArrayList construct.
 *
 * A simple application that renders circle of a given radius
 * within the screen and randomly hides one circle everytime the mouse is clicked.
 *
 * Remember, Rome wasn't built in a day.
 *
 * Email: web@evanreeves.com
 * Website: www.evanreeves.com or github.com/JadedEvan
 */ 

float radius = 50;
ArrayList circles;

void setup()
{
  smooth();
  background(0);  
  size(600, 600);

  circles = new ArrayList();
  float diameter = 2*radius;
  int num_x = int(width/diameter);
  int num_y = int(height/diameter);
  int numAllowed = num_x*num_y;
  for(int x = 0; x < num_x; x++)
  {
    for(int y = 0; y < num_y; y++)
    {
      circles.add(new Circle( (x*diameter)+radius, (y*diameter)+radius, radius));
      Circle theCircle = (Circle) circles.get(circles.size()-1);
      theCircle.draw();
    } 
  }

}

void draw()
{
}

void mousePressed()
{
  background(0);
  // Do not render if beyond the limits of the ArrayList
  if(circles.isEmpty()) return;
  // Randomly pick a number among the circles that are left and hide it
  // Remove that entry from the visible ArrayList so we don't select it again
  //
  // You could optionally call circle.hide(); instead of 
  // deleting it from the list if you to extend functionality

  int randomSpot = int(random(0, circles.size()-1));
  circles.remove(randomSpot);
  
  for(int i = 0; i < circles.size(); i++) {
    // You'll need to use this VERY verbose selector with ArrayList
    Circle theCircle = (Circle) circles.get(i);
    theCircle.draw();
  }
}

class Circle
{
  float x;
  float y;
  float radius;
  boolean show = true;
  
  // Class constructor : creates a circle with a given center
  // and radius
  Circle(float x_, float y_, float radius_)
  {
    x = x_;
    y = y_;
    radius = radius_;  
    show = true;
  }
  
  void draw()
  {
    if(show == true) {
      stroke(255);
      ellipse(x,y, 2*radius, 2*radius);
    }
  }
  
  void hide()
  {
    // Maybe you'll want to do some fun stuff here
    show = false;
  }
}

