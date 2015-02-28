
ArrayList<Firework> fw = new ArrayList<Firework>();
boolean once, die;
PImage bg;
int fireworkType;

void setup() {
  size(500, 328);
  smooth();
  bg = loadImage("GoldenGate.jpg");
  fireworkType = 0;
}

void mousePressed() {  //when mouse is clicked, create a new firework
  fireworkType+= random(2);
  //System.out.println(fireworkType+" int ");
  if (fireworkType % 2 == 0) { //even, create parabolic fireowkr
    fw.add(new ParabolicFirework());
  }
  else {//make a firework object //odd
    fw.add(new RegularFirework());
  }
}

void draw() {
  background(bg);
  for (int i = fw.size()-1; i >= 0; i--) { //iterate through the arraylist, looking for "dead" fireworks
    if (fw.get(i).die) {                   // removing backwards prevents skipping or removing incorrect fireworks
      fw.remove(i);
    }
  } 
  for (Firework f : fw) { // draw each firework in the list until it dies
    f.draw();
  }
  System.out.println(fw.size());  //test line to ensure fireworks are removed and added correctly
}

abstract class Firework {
  float newX, newY, origX, origY, xSpeed, targetX, targetY, time, dotSize, angle;
  int numDots, duration;
  boolean ignite, explode, die;
  color sparkColor = color(random(100)+50, random(100)+50, random(100)+50);

    
  Firework() {
    ignite = false;
    explode = false;
    launch();
  }

  void draw() {
    if ((ignite)&&(!explode)) { //when ignited, call draw repeatedly
      reachTarget();            // draw a star until it reaches the target clicked
      strokeWeight(2);          // credits to Anders Fisher for the concept of drawing a line and  
      stroke(sparkColor);        //the math and methods involved in stimulating a firework explosion
      line(newX, newY, origX, origY);
    }
    if ((!ignite)&&(explode)) {
      explosionTimer();  //explode until time is reached
      noStroke();
      strokeWeight(dotSize);
      stroke(sparkColor);
      for (int i = 0; i < numDots + 1; i++) {
        pushMatrix();
        translate(newX, newY);
        point(sin(radians(i*angle))*time, cos(radians(i*angle))*time); //the math formula to form a circular explosion
        popMatrix();
      }
    }
  }

  abstract void launch();    //abstract methods specified for each firework type
  abstract void reachTarget();

  void explode() {
    time = 0;
    ignite = false;
    explode = true;
  }
  void explosionTimer() { //increments the time until it reaches the duration
    if (time < duration) { //allows the for a "timed" explosion
      time+= 0.5;          // credits to Anders Fisher for the concept of having a timer to control 
    }                      // duration of the explosion
    else {
      die = true;      
    }
  }
}
class ParabolicFirework extends Firework {
  float  slope, sym;
  boolean isLeft;
  /*
  public ParabolicFirework() {
    super();
  }
  */

  void launch() {
    isLeft = true;
    targetX = mouseX;
    targetY = mouseY;
    sym = width/2;  //line if symetry
    slope = (0.66*targetY);
    slope /= ((targetX-sym)*(targetX-sym)); 

    if (targetX > sym) { //if firework is towards the right, subtract from line of sym 
      newX = sym - (float)Math.sqrt((height - 0.34*targetY)/slope);
      isLeft = false;
    }
    else {
      newX = sym + (float)Math.sqrt((height - 0.34*targetY)/slope);
    }

    newY = height; //initial state of Y is at the bottom of the grid

    xSpeed = (float)(1/(Math.pow(slope, 0.30))); //relation between slope and xspeed is inverse
    numDots = 35;
    dotSize = 3;
    duration = ceil((random(50)+10)+(random(50)+10));
    angle = 360/numDots; //to create an even circle
    ignite = true;
    explode = false;
  }

  void reachTarget() {
    origX = newX;
    origY = newY;
    //if (dist(newX, newY, targetX, targetY) > 5) { //to ensure the star reachest he target,
    //the target must be 6 units within
    if (isLeft) { // if firework is going towards the left, decrease x
      newX -= xSpeed;
    }
    else {
      newX+= xSpeed;
    }
    newY = slope*((newX-sym)*(newX-sym))+0.34*targetY; // plug newX into the math equation for the parabola
    if (isLeft) { //if the firework is going to the left, the newX will eventually be less than targetX
      if (newX <= targetX) {
        newX = targetX; //to match the x,y coordinate with target
        newY = targetY;
      }
    }
    else { //the firework is going to the right, newX will eventually be greater
      if (newX >= targetX) {
        newX = targetX; //to match the x,y coordinate with target
        newY = targetY;
      }
    }
    if (newY == targetY && newX == targetX) { // placed this condition at the end after all the coordinates have been checked
      explode();                              // if placed earlier, x,y coordinates will be changed resulting in accuracy slightly off
    }
  }
}


class RegularFirework extends Firework {
  float ySpeed;
  int levels;
/*
  public RegularFirework(int levels) {
    super();
   this.levels = levels;
  }

  public RegularFirework() {
    this(0);
  }
*/
  void launch() {
    targetX = mouseX;
    targetY = mouseY;
    newX = mouseX;
    newY = height;
    ySpeed = ceil(random(3)+2);
    numDots = 30;
    dotSize = 3;
    duration = ceil((random(50)+10)+(random(50)+10));
    angle = 360/numDots; //to create an even circle
    ignite = true;
    explode = false;
  }

  void reachTarget() {
    origX = newX;
    origY = newY;
    //if (dist(newX, newY, targetX, targetY) > 2) { 
      newY += -ySpeed; // only y coordinates chance in a vertical pattern
      if (newY <= targetY){
        newY = targetY;
        explode();
      }
    //}
   // else {
     // explode();
    //}
  }
}


