
//set up an array of refferances to Particle objects
Particle p[] = new Particle[10];

void setup() {
  size( 400, 400);    //screen size 400 x 400
  background(255);    //background white
  
  //as we are using an array we need a fixed loop
  //to step through each element of the array
  for (int i=0;i<p.length;i++) {
    //now we need to hang an object off each refferance
    p[i]=new Particle();
  }
  //no fill so we can see overlapping Particles
  noFill();
}

void draw() {
 // background(255);    //every frame re draw with white backgorund
  
  //as we are in an array we must move each Particle
  for (int i=0;i<p.length;i++) {
    p[i].move();
  }
}

//declare a class
class Particle {
  //some varabel for our object we will interact with 
  float xPos=0;  
  float yPos=0;
  float d=0;

  //this is the constructor is called when we instansiate an object
  public Particle() {
    //place this Particle in a random position
    //and make it  a random size
    xPos = random(width);
    yPos = random(height);
    d=random(5, 10);
  }

  public void  move() {
    stroke(0,0,0,10);  //line colour is black          
    strokeWeight(0.1);  //very thin line
    //ellipse(xPos, yPos, 6*d, 6*d);  //draw a large ellips this is our line of collision

    //if you mouse is inside the ellips above 
    // distance from center to mouse is less than radius OR the mouse is pressed
    if (dist(mouseX, mouseY, xPos, yPos) <3*d || mousePressed) {

      //calculate the distance in the x axis from our ellipse
      //to our mouse
      float xDist = mouseX-xPos;
      float yDist = mouseY-yPos;

      //map the distance from its range 0-100 to a much smaller one 0-10
      //this means the furhter our mouse the quicker it will move towords it
      // as we get closer it slows and we get a nice deceleration effect
      float xMove = map(xDist, 0, 100, 0, 10);
      float yMove = map(yDist, 0, 100, 0, 10);

      //change the xPos by the amoutn we have calculated
      xPos+=xMove;
      yPos+=yMove;
    }
    else {
      //if we are no close to the mouse wiggle
      xPos+=random(-1, 1.4);
      yPos+=random(-2, 2);
    }
    //draw the ellips at the center
    ellipse(xPos, yPos, d, d);
  }
}

