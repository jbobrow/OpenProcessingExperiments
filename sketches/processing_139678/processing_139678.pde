
//People in a Crowd:
//This project simulates motion in a crowd.  The people objects move up the screen, like they are walking.  Theoretically, the path of the humans would 
//make sense from a biological standpoint, but at the moment, due to the complexities of avoiding intersection, the people do not look like they are walking on a predetermined path.
//Also, the obstacle of a trashcan is introduced, and the people should avoid it as it appears (not working yet).
//Most of the code written by Sonia Martin, with help from these people, resources, and books:
//Copied code from book sources are noted in the code.
//References:
//Ms. Freed
//Classmates
//-http://www.mehdimoussaid.com/archives/58
//-Youtube video: http://www.youtube.com/watch?v=ifimWFs5-hc
//(Crowds begin at 2:00, and object avoidance begins at 3:00.)
//-The Nature of Code book by Daniel Shiffman
//Generative Design book by Hartmut Bohnacker, Benedikt Gross, Julia Laub, and Claudius Lazzeroni
//Processing references, both online and in a print source

//This is the number of unique Humans that appear and continue to run through the program
int numberOfHumans = 20;
//These declare variables for the background color:
int enviro1=1;
int enviro2=1;
int enviro3=1;
//Declares Human and Obstacle objects
Human[] people= new Human[numberOfHumans];
Obstacle trashcan;
boolean intersection;

void setup() {
  //These determine the random background color:
  enviro1= int(random(400));
  enviro2= int(random(300));
  enviro3 = int(random(200, 400));
  colorMode(HSB, 360);
  size(400, 400);
  rectMode(CENTER);
  //Delcares new Obstacle, the trashcan, at the location of the mouse (at the moment):
  trashcan = new Obstacle(mouseX, mouseY, 40, 40, false);
  for (int i=0; i<numberOfHumans; i++) {
    //creates a unique location and velocity for each human
    people[i] = new Human((width/(numberOfHumans+2))*(i+2), height, (-i-2.0)/10.0, -(i+2.0)/5.0, 30);
  }
}
void draw() {
  //First, set the the background color at the beginning of each frame to avoid leaving a trail of objects.
  background(enviro1, enviro2, enviro3);
  //Almost everything else in the draw loop goes under a for loop so that the code can check each Human object in the people array.
  for (int i=0; i<numberOfHumans; i++) {
    //First, show the people:
    people[i].show();
    //This part is adapted from the Nature of Code book; it bounces the humans off the wall:
    if ((people[i].location.x+(people[i].radius/2) > width) || (people[i].location.x-(people[i].radius/2) < 0)) {
      //The x velocity is multiplied by -1, or, in other words, changes its direction from left ot right or vice versa.
      people[i].velocity.x = people[i].velocity.x * -1;
      // println("bounce");
    }
    people[i].move();
    //This nested for loop is to check for intersections: it checks all other people against the person selected in the first for loop. 
    for (int j=0; j<numberOfHumans; j++) {
      //Adapted code from my previous project, which is from the Generative Design Book
      //        boolean intersection = false;
      //        float d = dist(people[i].location.x, people[i].location.y, people[j].location.x, people[j].location.y);
      //        println("dist: "+d);
      //        if (d<(2*people[i].radius)) {
      //          intersection = true;
      //          // break;
      //        }
      // if (people[j].isTouching(people[i])<((people[i].radius/2)+(people[j].radius/2))) {

      //This asks if one person is touching any other object (see code in Human class below):
      if (people[j].isTouching(people[i])) {
        //        people[j].velocity=people[j].velocity.fromAngle(1/(people[j].velocity.heading()));
        //        people[i].velocity=people[i].velocity.fromAngle(1/(people[i].velocity.heading()));

        //This doesn't actually work, but in theory these few lines of code below and the if and else statements would make the people turn away from the other people it is touching.
        people[j].velocity.y = 1/people[j].velocity.y;
        people[i].velocity.y = 1/people[i].velocity.y;

        if (people[i].location.x>=people[j].location.x) {
          people[j].velocity.x = -1/people[j].velocity.x;
          people[i].velocity.x = 1/people[i].velocity.x;
          //   println(people[1].velocity.x);
        }
        else {
          people[j].velocity.x = 1/people[j].velocity.x;
          people[i].velocity.x = -1/people[i].velocity.x;
        }
      }
    }
    //Here, if any one person goes off the screen (they are all traveling upward), it wraps around and returns to the bottom of the screen.
    if (people[i].location.y<0) {
      people[i].location.y = height;
    }

    //people[i].move();
  }
  //people[i].show();
  //for (int i=0; i<numberOfHumans; i++) {
  //  people[i].move();
  //}
  // println("velocity1.x: "+ people[1].velocity.x+"x: "+people[1].location.x+"; y: "+people[1].location.y);
  //println("velocity0.x: "+ people[0].velocity.x+"x: "+people[0].location.x+"; y: "+people[0].location.y);

  //When the mouse is pressed, the trashcan appears where your cursor is:
  if (mousePressed) {
    trashcan.x=mouseX;
    trashcan.y=mouseY;
    trashcan.show = true;
  }
  trashcan.show();
  //  for (int i=0; i<numberOfHumans; i++) {
  //    if (people[i].isTouching(trashcan));
  //    people[i].velocity.x=people[i].velocity.x*-1;
  //    people[i].velocity.y=people[i].velocity.y*-1;
  //  }
}

class Human {
  //will create a different hair color for each person:
  int hairColor1;
  int hairColor2;
  int hairColor3;
  //both the location and velocity of each person is different and they are both PVectors.
  PVector location;
  PVector velocity;
  int radius;
  //Constructor: creates hair color, location, radius, and velocity for each human.
  Human(int tempX, int tempY, float tempVX, float tempVY, int tempRadius) {
    hairColor1 = int(random(39, 60));
    hairColor2 = int(random(39, 230));
    hairColor3 = int(random(39, 230));
    location = new PVector(tempX, tempY);
    velocity = new PVector (tempVX, tempVY);
    radius = tempRadius;
  }
  //Will test it any given person is touching any other person.
  boolean isTouching(Human other) {
    //distance between two people:
    float d = dist(other.location.x, other.location.y, location.x, location.y);
    //If the distance is less than the sum of both of the peoples' radii...
    if (d<((other.radius/2)+(radius/2))) {
      // println("touching");
      //If one person is being compared to itself, the distance is 0 and is messes up the code, so this line of code prevents it from thinking that it is intersecting with itself:
      if (this==other) {
        return false;
      }
      return true;
    }
    else {
      return false;
    }
  }

  //Does not work at the moment, but this code is very similar to the boolean above, except that is is comparing the distance between the trashcan and a particular person.
  boolean isTouching(Obstacle other) {
    //Parts of distance code adapted from Generative Designs book:
    float d = dist(other.x, other.y, location.x, location.y);
    if (d<((other.width1)+(radius/2))) {
      println("touching-trashcan");
      //      if (this==other) {
      //        return false;
      //      }
      return true;
    }
    else {
      return false;
    }
  }
  //This chunk of commented code returns the distance between the two circles.
  //  float isTouching1(Human other) {
  //    //if (this = other){
  //
  //    float d = dist(other.location.x, other.location.y, location.x, location.y);
  //    //d<((other.radius/2)+(radius/2))); 
  //    println(d);
  //    return d;
  //  }

  //Shows the human by drawing an ellipse with a fill and stroke of the previously determined hair color:
  void show() {
    stroke(hairColor1, hairColor2, hairColor3);
    fill(hairColor1, hairColor2, hairColor3);
    ellipse(location.x, location.y, radius, radius);
  }
  //Adds the location and velocity vectors to ultimately change the location of a person:
  void move() {
    location.add(velocity);
  }
}

class Obstacle {
  //Variables are x value, y value (in its center), width, height, and the boolean to show it.
  int x;
  int y;
  int width1;
  int height1;
  boolean show;
  //Constructor sets variable values, and uses the boolean show so that aftar the creation of the Obstacle, if the show function is called, it doesn't necessarily have to appear.  
  //This enables the trashcan to exist but not appear until the mouse is pressed, even though the draw loop mayu be running.
  Obstacle(int tempX, int tempY, int tempWidth, int tempHeight, boolean tempShow) {
    x= tempX;
    y= tempY;
    width1 = tempWidth;
    height1 = tempHeight;
    show = tempShow;
  }
  //Shows trashcan:
  void show() {
    if (show==true) {
      //From processing tutorials: use translate before rotate in rectMode(CENTER):
      //translate(width/2, height/2);
      //  rotate(PI/4);
      stroke(0, 0, 0);
      fill(0, 0, 0);
      rect(x, y, width1, height1);
    }
  }
}

