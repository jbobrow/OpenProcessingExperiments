
ArrayList <Fish> fishes = new ArrayList<Fish>(); //creates a new ArrayList of class Fish
int currentFish = 0; //initializes variable
int centerX = width/2; //initializes variable (x coordinate)
int centerY = height/2; //initializes varialbe (y coordinate)
//Getting Started with Processing; Chapter 10 (Arrays); Casey Reas
//Anthony Sinclair
  /*This code uses objects, arrays, and functions to create the 
  apperance of tadpoles or strokes of ink.  The only part of this 
  code which was sourced off of the Book by Casey Reas is the "display"
  portion at the  bottom (minus the decrease in color).  My code was
  inspired by the "flocking" program for LeapMotion.
  */
  


void setup() {
  size (700, 700);
  smooth();
  noStroke();
  background(255);
}
void mousePressed() //called when mouse is clicked
{
  createFish(); //calls function
}
void draw() {
  background(255); //can be commented out for a freaky effect
  for (int i=0;i<fishes.size(); i++) //allows the reference of each fish through i
  {
    fishes.get(i).move(); //calls the function move() for each object individually
    fishes.get(i).display(); //calls the function display() for each object individually
  }
}
void createFish() //function
{
  fishes.add(new Fish()); //adds a new object to the ArrayList
}
void centerupdate()
{
  int averageX = 0;
  int averageY = 0;
  for (int i=0;i<fishes.size(); i++) //allows the reference of each fish through i
  {
    averageX+=fishes.get(i).loc.x; //adds the x locations of each fish
    averageY+=fishes.get(i).loc.x; //adds the y locations of each fish
  }
  centerX = averageX/fishes.size(); //averages the x variables
  centerY = averageY/fishes.size(); //averages the y varialbes
}
class Fish
{
  PVector loc;
  PVector vel;
  int times = 0;
  int timeRecorded = 0;
  int timeDesired;
  int num = 30;
  int x[] = new int [num];
  int y[] = new int [num];
  int scale[] = new int[num];
  Fish()
  {
    loc = new PVector(mouseX, mouseY); //sets the initial location of the new fish
    vel = new PVector(int(random(-15, 15)), int(random(-15, 15))); //sets the new velocity (random) of the new fish
  }
  void move()
  {
    centerupdate(); //calls the function centerupdate()
    float velocity;
    int distanceBetween;
    int yes_or_no;
    yes_or_no = int(random(100)); //randomizes the value of yes_or_no
    //times makes the fish go away from the center for a certain amoun of time
    if ((yes_or_no <= 90) && (times < 1))
    {
      velocity = map(dist(loc.x, loc.y, centerX, centerY), 0, (sqrt(sq(width)+sq(height))), 5, 20); //maps the distance between the center variables and the fish between 5 and 20
      vel.x = int(centerX - loc.x)/(3*int(velocity)); //sets the new velocity of the fish by using the difference between the location and cetner over the velocity varible
      vel.y = int(centerY - loc.y)/(3*int(velocity)); //sets the new velocity of the fish by using the difference between the location and cetner over the velocity varible
      times = 0; // resets times
    }
    if ((yes_or_no > 90) || (times>=1))
    {
      if (times < 1)
      {
        times += 1; //adds 1 to the variable times
        timeDesired = int(random(10, 50)); //resets the variable time desired
        vel.x = int(random(-5,5)); //randomizes the x vector
        vel.y = int(random(-5,5)); //randomizes the y vector
      }
      if (0<times && times<timeDesired)
      { 
        vel.x = vel.x + int(random(-1,1)); //minorly changes the values velocities
        vel.y = vel.y + int(random(-1,1)); //minorly changes the values velocities
        times +=1; //adds 1 to the variable times
        if (((loc.y > (height-15)) || (loc.y < 15))) //determines if the fish is off the screen (y axis)
        {
          vel.y = vel.y * -1; //reverses the vertical velocity of the fish
        }
        if (((loc.x > (width-15)) || (loc.x < 15)))  //determines if the fish is off the screen (x axis)
        {
          vel.x = vel.x * -1; //reverses the horizontal velocity of the fish
        }
      }
      if (times>=timeDesired) // if times is greater than or equal to times desired
      {
        times = 0; //resets times
      }
    }
    loc.add(vel); //adds the velocity to the location
    //println(times); //prints to show the value of times (usually commented out)
  }
  void display()
  {
    
    for (int i = x.length-1; i>0; i--) //uses the array x to call up past locations of ellipses
    {
      x[i] = x[i-1]; //reduces the size of each circle
      y[i] = y[i-1]; //" "
    }
    x[0] = int(loc.x); //sets the location of the new circle
    y[0] = int(loc.y); //sets the location of the new circle
    int b = num; //initiates b, determines the size of each circle
    for (int i = 0; i<x.length; i++)  //uses the array x to call up past locations of ellipses
    {
      fill (i*9); //determines the hue of the circle
      ellipse(x[i], y[i], b, b); //draws the circle
      b--; //reduces the darkness of the circle so next circle is lighter
    }
  }
}



