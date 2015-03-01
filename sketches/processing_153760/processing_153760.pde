
//Where we store all out bubbles.
ArrayList<Bubble> bubbles;

void setup() {
  //Works best if both width and height are the same value.
  size(640, 720);

  //Bubbles stored in ArrayList.
  bubbles = new ArrayList<Bubble>();
}

void draw() {
  //fill(0, 10);
  //rect(0, 0, width, height);
  background(0);
  for (Bubble b : bubbles) {
    b.drawBubble(); //Draw the Bubble.
    b.moveBubble(); //Move the Bubble.
    b.update();     //Update the Bubble.
  }

  //Iterate through all the bubbles in our ArrayList.
  for (int i = 0; i < bubbles.size(); i++) {
    Bubble b = bubbles.get(i); //Get every individual bubble and set it to 'b'.
    if (b.dead) { //Is the bubble dead? (Is dead = true).
      bubbles.remove(b); //Remove the bubble from the arrayList.
    }
  }

  /*If the frameCount, which is how many frames have ticked over from the start
  of the sketch, add a new Bubble at a random location.*/
  if ((frameCount % 1) == 0) {
    bubbles.add(new Bubble(new PVector(int(random(width)), height)));
  }
}

class Bubble {
  PVector loc;          //Location
  PVector velocity;     //Velocity of the bubble
  PVector acceleration; //Acceleration of the bubble
  PVector gravity;      //Gravity isn't perfect here but is set to look realistic.

  //Is the bubble gone or still on screen?
  boolean dead = false;
  int mass;
  float life;

  //Change colors but keep them at a certain tone.
  int r;
  int g;
  int b;

  Bubble(PVector loc_) {
    //Loop to get flames to spread from the middle out
    for (int i = 0; i < width; i++) {//Run how many pixels spread across the whole screen
      if (loc_.x == i) {//If the bubbles location maches i Ex: i = width/2
        //check whether location is before or after middle.
        if (loc_.x < width/2) {
          //Set the life of the bubble to the value width/2 (the heighest value)
          life = i;
          r = i/5;
          g = i/10;
          b = i;
        }
        else {
          /*We don't want life to exceed width/2. So if the location is after width/2 Ex: width
          then minus i from width AKA width-i.*/
          life = width-i;
          r = (width-i)/5;
          g = (width-i)/10;
          b = (width-i);
        }
      }
    }
    loc = loc_;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 1;
    /*gravity is -0.05 so the bubble go up. If the bubbles were spawning from the top then 
    gravity would be set to 0.05;*/
    gravity = new PVector(0, -0.03);
  }

  void drawBubble() {
    fill(r+=2, g--, b-=2, height-loc.y);
    //noFill();
    noStroke();
    //Set radius of bubble to life. The bubble gets smaller as our variable life gets smaller.
    ellipse(loc.x, loc.y, life, life);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void moveBubble() {
    applyForce(gravity);

    velocity.add(acceleration);
    loc.add(velocity);

    acceleration.mult(0);
  }

  void update() {
    /*Remeber what we did to make the value for our variable life? Ex: life = width/2;
    now we minus 2 from life so that the circles width and height (which is set to 
    the varible life) gets smaller. The smaller the number life, the quicker the 
    bubbles go.*/
    life -= 1.5;
    if (life <= 0) {
      //If the bubble is not on screen AKA life <= 0), make dead equal true.
      dead = true;
    }
  }
}



