
// Instead of a bunch of floats, we now just have two PVector variables.
PVector location, locationTwo, locationThree, locationFour;
PVector velocity, velocityTwo, velocityThree, velocityFour;

void setup() {
  size(500,500);
  smooth();
  background(255);
  location = new PVector(100,100);
  velocity = new PVector(2.5,5);
  locationTwo = new PVector(50,50);
  velocityTwo = new PVector(3.2,5);
  locationThree = new PVector(250,250);
  velocityThree = new PVector(5.5,5);
  locationFour = new PVector(200,240);
  velocityFour = new PVector(5.5,5);
}

void draw() {
  noStroke();
  fill(255,5,60,10);
  rect(0,0,width,height);
  
  // Add the current speed to the location.
  location.add(velocity);
  locationTwo.add(velocityTwo);
  locationThree.add(velocityThree);
  locationFour.add(velocityFour);

  // We still sometimes need to refer to the individual components of a PVector 
  // and can do so using the dot syntax (location.x, velocity.y, etc.)
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
  
  if ((locationTwo.x > width) || (locationTwo.x < 0)) {
    velocityTwo.x = velocityTwo.x * -1;
  }
  if ((locationTwo.y > height) || (locationTwo.y < 0)) {
    velocityTwo.y = velocityTwo.y* -1;
  }
  
  if ((locationThree.x > width) || (locationThree.x < 0)) {
    velocityThree.x = velocityThree.x * -1;
  }
  if ((locationThree.y > height) || (locationThree.y < 0)) {
    velocityThree.y = velocityThree.y* -1;
  }
  
   if ((locationFour.x > width) || (locationFour.x < 0)) {
    velocityFour.x = velocityFour.x * -1;
  }
  if ((locationFour.y > height) || (locationFour.y < 0)) {
    velocityFour.y = velocityFour.y* -1;
  }
   

  // Display circle at x location
  noStroke();
  fill(175,20,200);
  ellipse(location.x,location.y,16,16);
  fill(55,23,235);
  ellipse(locationTwo.x,locationTwo.y,16,16);
  fill(45,192,250);
  ellipse(locationThree.x,locationThree.y,16,16);
  fill(255,33,177);
  ellipse(locationFour.x,locationFour.y,16,16);
  
 
}



