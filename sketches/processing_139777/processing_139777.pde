
//AQUARIUM PROJECT: MOTION UNIT
//Coded by Clara Kelley
/* This fish tank is "3D without the rendering." A fully customizable set of fish swim around the screen,
drawn in by food morsels placed with a click of the mouse. Fish can be set to face any angle and still look 3D,
though I assure you they are not. Complete with real rocking swim motion. Try it offline! */
//Inspired by http://www.youtube.com/watch?v=gjspaQtk3zI
//includes arrays, classes, fish, aquarium, movement, motion, fishes, and flocking
//Free to use
//Trig obsession courtesy of Ms. V's math class
//TODO: Add bubbles!!

//WARNING: Too many fish means slow calculations and jerky movements! change at your own risk!
static int FISHES = 5;

int j;
float lastDistance; //distance between current fish and last food item checked
float thisDistance; //distance between current fish and current food item
int counter = 0; //current number of frames: used for "swimming" effect
color c = color(50, 55, 100); // for fishy
Fish fishy = new Fish(200.0, 200.0, HALF_PI*4, 5.0, c); //test object
Fish[] fishes = new Fish[FISHES]; //array to store fish objects 
Food closestFood; //object variable to store closest food to one fish;
ArrayList<Food> foods = new ArrayList<Food>(); //arraylist to store food items created on-click

void setup() {
  //setup creates all fish randomly and graphics settings needed.
  size(1400, 850, "processing.core.PGraphicsRetina2D");
  j = 0;
  fishy.eyeMultiplier = 10;
  noStroke();
  for (int i = 0; i < fishes.length; i++) {
    fishes[i] = new Fish(random(100, 1300), random(100, 800), random(TWO_PI), random(2, 5), color(random(255), random(255), random(255)));
    fishes[i].eyeMultiplier = fishes[i].scale;
  }
}

void draw() {
  background(133, 201, 237); //clears the screen
  for (int n = 0; n < fishes.length; n++) { //cycle through each fish
    if (fishes[n].x > 1440 || fishes[n].x < 0) { //off left || right edges?
      fishes[n].turn(PI); //this flips Cosine
    }
    if (fishes[n].y + fishes[n].scale*10 > 850) { //off top || bottom edges?
      fishes[n].moveTo(fishes[n].x, fishes[n].y - 25); //FAULTY CODE! need more efficient process
      fishes[n].turnTo(PI); 
    } else if (fishes[n].y - fishes[n].scale*10 < 0){
      fishes[n].moveTo(fishes[n].x, fishes[n].y +25); //FAULTY CODE! need more efficient process
      fishes[n].turnTo(PI/4); 
    }
    fishes[n].moveTo(fishes[n].x+(3*cos(fishes[n].angle)), fishes[n].y+(2*sin(2*fishes[n].angle))); //natural fish motion
    if (counter < 25) { //turning right?
      fishes[n].turn(.02);
    } 
    else { //other half of time turning left
      fishes[n].turn(-.02);
    }
    lastDistance = 1700; //reset variables for each 
    thisDistance = 0;
    for (int i = 0; i < foods.size(); i++) { //cycle through each food item
      thisDistance = sqrt(sq(fishes[n].x - foods.get(i).myX) + sq(fishes[n].y -foods.get(i).myY)); //distance between fish and food, using distance formula
      if (lastDistance > thisDistance && thisDistance < 400) { //if fish should be able to detect food
        lastDistance = thisDistance;
        closestFood = foods.get(i); //store closest food in object variable for later use.
      }
      if (thisDistance < 50) { //if fish "eats" the food;
        foods.remove(i); //remove food from array
      }
    }



    if (closestFood != null) { //if closest food exists (variable stored earlier) 
      //FISH MOVEMENT CALCULATION
      fishes[n].moveTo(fishes[n].x + (closestFood.myX - fishes[n].x)/8, fishes[n].y + (closestFood.myY - fishes[n].y)/10); //move 1/10 distance to food
      //FISH ANGLE CALCULATION: Still "fishy"
      if ((closestFood.myX - fishes[n].x < 0) && sin(fishes[n].angle) < 0 && cos(fishes[n].angle) < 0) { //fish facing food
        //println("a");
      }
      if ((closestFood.myX - fishes[n].x < 0) && sin(fishes[n].angle) > 0) { //fish not facing food
        //println("b");
        fishes[n].turn(PI/(thisDistance/10));
      }
      if ((closestFood.myX - fishes[n].x > 0) && sin(fishes[n].angle) < 0) { //fish not facing food
        //println("c");
        fishes[n].turn(PI/(thisDistance/10));
      }
      if ((closestFood.myX - fishes[n].x > 0) && sin(fishes[n].angle) > 0 && cos(fishes[n].angle) > 0) { //fish facing food
        //println("d");
      }
      /*if (closestFood.myX - fishes[n].x < 0 && cos(fishes[n].angle) > 0){ //distance is negative and fish facing wrong way
        fishes[n].turn(-PI/(thisDistance/10));
        println("A");
      }
      else if (closestFood.myX - fishes[n].x > 0 && cos(fishes[n].angle) < 0){ //distance is negative and fish facing wrong way
        fishes[n].turn(PI/(thisDistance/10));
        println("A");
      }
      else if (closestFood.myX - fishes[n].x >= 0 && sin(fishes[n].angle+(PI/thisDistance)) >= 0) { //distance is positive and fish facing wrong way
          //fishes[n].turn(-PI/(thisDistance/10));
          println("B"); 
  
      } else {
      println(cos(fishes[n].angle));
      }*/
    }
    //last position compared to closest food.
    fishes[n].display(); //draw fish in new locaton
    closestFood = null; //clear food object
    counter = counter % 50; //counter recycles at 50
    counter++; //increment frame counter
  }
  for (int i = 0; i < foods.size(); i++) { //food animation
    foods.get(i).fall(); //sink food
    foods.get(i).feed(); //draw food
  }
}

void mousePressed() { //feed fish on mouse pressed
  foods.add(new Food(mouseX, mouseY)); 
}

class Fish { //fish class creates fish
  float x;
  float y;
  float angle; //WARNING: angle is not always within 0-2pi
  float scale; 
  color scaleColor; //fish color
  float fishwidth; //used for rotation, do not modify directly
  float fishtail; //used for rotation, do not modify directly
  float fishtailwidth; //used for rotation, do not modify directly
  float eyeMultiplier;
  Fish(float initX, float initY, float initAngle, float initScale, color initColor) { //constructor only sets initial fields
    x = initX;
    y = initY;
    angle = initAngle;
    scale = initScale;
    scaleColor = initColor;
    fishwidth = 40*abs(cos(angle))+10;
    fishtail = -140*cos(angle);
    fishtailwidth = 15*abs(cos(angle))+5;
    eyeMultiplier=1;
  }
  void turn(float amountTurn) { //additive angle calculates new drawing variables for you
    angle += amountTurn;
    fishwidth = 40*abs(cos(angle))+10;
    fishtail = -140*cos(angle);
    fishtailwidth = 15*abs(cos(angle))+5;
  }
  void turnTo(float newAngle) { //HACK: used for bounce behavior
    angle = newAngle;
    fishwidth = 40*abs(cos(angle))+10;
    fishtail = -140*cos(angle);
    fishtailwidth = 15*abs(cos(angle))+5;
  }
  void moveTo(float newtempX, float newtempY) { //moveTo does not draw fish
    x = newtempX;
    y = newtempY;
  }
  void display() {
    fill(scaleColor);

    if (sin(angle) < 0) { //If negative sin
      drawBody();
      drawTail();
      if (cos(angle) < -.25) { 
        //left eye
        fill(0);
        ellipse(x-(-cos(angle)*scale*12)-(scale*6), y, scale*eyeMultiplier, scale*eyeMultiplier);
      } 
      else if (cos(angle) > .25) {
        //right eye
        fill(0);
        ellipse(x-(-cos(angle)*scale*12)+(scale*6), y, scale*eyeMultiplier, scale*eyeMultiplier);
      }
    } 
    else {
      drawTail();
      drawBody();
      if (cos(angle) <-.25) {
        //left eye
        fill(0);
        ellipse(x+(cos(angle)*scale*22)+4*scale, y, scale*eyeMultiplier, scale*eyeMultiplier); //could also multiply eye x by abs(cos(angle))
      } 
      else if (cos(angle) > .25) {
        //right eye
        fill(0);
        ellipse(x+(cos(angle)*scale*22)-4*scale, y, scale*eyeMultiplier, scale*eyeMultiplier);
      } 
      else {
        //right eye
        fill(0);
        ellipse(x+(cos(angle)*scale*22)-4*scale, y, scale*eyeMultiplier, scale*eyeMultiplier);
        //left eye
        ellipse(x+(cos(angle)*scale*22)+4*scale, y, scale*eyeMultiplier, scale*eyeMultiplier);
      }
    }
  }
  void drawTail() { //this flips the tail direction. fishtailwidth scales the "turn"
    if (cos(angle) < 0) {
      arc(x+fishtail*scale/5, y, scale*fishtailwidth, scale*20, QUARTER_PI, TWO_PI-QUARTER_PI, PIE);
    } 
    else {
      arc(x+fishtail*scale/5, y, scale*fishtailwidth, scale*20, PI+QUARTER_PI, TWO_PI+HALF_PI+QUARTER_PI, PIE);
    }
  }
  void drawBody() { //the actual body of the fish is done here. could include fins, scales, etc.
    ellipse(x, y, scale*fishwidth, scale*20);
  }
}

class Food { //This class is created for the fish food stored in an arraylist
  float myX; //variable names are differentiated to prevent confusion.
  float myY;
  boolean eaten = false; //technically not needed; used to be doubly sure "eaten" food is not displayed
  Food(float tempX, float tempY) {//the constructor does nothing but set fields
    myY = tempY;
    myX = tempX;
  }
  void feed() {//this draws the food at specified location, almost always mouseX and mouseY at start, then falls
    if (!eaten) {
      fill(161, 119, 22, 150);
      ellipse(myX, myY, 10, 10);
    }
  }
  void fall() {//this decrements the y value of each food particle so that it looks like it is "falling"
    if (!eaten) {
      myY+= 1;
    }
  }
  void eat() { //best practice: setting variables indirectly
    eaten = true;
  }
}

