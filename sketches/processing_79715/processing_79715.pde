
// simple car by Luke O'Connor

    PFont font;
    PImage img, mask;  // Image variables here
    int state = 1; // Start with the car on the track
    int timer=30;
    int timeLast = 0;
    PVector position, velocity;
    float angle, steerAngle;
    boolean[] keys = new boolean[256];

    //
    void setup() {
      //
      size(690, 645);
      smooth();
      timeLast=second();
      font = loadFont("ARDESTINE-48.vlw");
      textFont(font, 48);
      // load images in setup
      img = loadImage("racecartrack.jpg");
      
      mask= loadImage("mask.jpg");
      //
      velocity = new PVector();
      position = new PVector(width * 10.5, height * 10.5);
      //
      angle = 0.0;
      steerAngle = 0.0;
    }

    //
    void draw() {
      if (timer>0) {
        game();
      }
      else {
         state = 4; // out of time
       }
    }
    void game() {
      if (second()!=timeLast) {
        timeLast=second();
        timer-=1;
      }
      if(timer < 0){
            text("Out of time", 40, 35);
      }
      //
      background(img);
      fill(0);
      text("Timer: "+timer, 320, 35);
      //
      switch(state){
  case 0:
    text("Crashed", 40, 35);
    break;
  case 2:
    text("Finished", 40, 35);
    break;
  case 4:
    text("Out of time", 40, 35);
         break;
     }
      PVector force = new PVector();
      //
      PVector vector1 = new PVector(sin(angle), cos(angle));
      PVector vector2 = new PVector(vector1.y, - vector1.x);
      //
      float forwardVelocity = vector1.dot(velocity);
      float sidewaysVelocity = vector2.dot(velocity);
      //
      steerAngle = 0.0;
      float factor = constrain(forwardVelocity * 1.0, -2.5, 2.5);
      if (keys[37]) {
        angle += 0.025 * factor;
        steerAngle = - PI * 0.75;
      }
      if (keys[39]) {
        angle -= 0.025 * factor;
        steerAngle = PI * 0.75;
      }
      //
      force.add(PVector.mult(vector1, -forwardVelocity * 0.3));
      if (keys[38]) {
        force.add(PVector.mult(vector1, 3.0));
      }
      if (keys[40]) {
        force.add(PVector.mult(vector1, -3.0));
      }
      //
      float sidewaysFriction = - constrain(sidewaysVelocity * 5.0, -10.0, 10.0);
      force.add(PVector.mult(vector2, sidewaysFriction));
      //
      force.div(15.0);
      velocity.add(force);
      position.add(velocity);
      //
      position.x = (position.x + width) % width;
      position.y = (position.y + height) % height;
      // get the color from the mask image
int c = mask.get((int)position.x, (int)position.y);
  // Now test c for the color
  println(red(c) + " " + green(c) + " "  + blue(c));
if(c == color(237,27,36))
  state = 0; // red (off track)
else if (c == color(35, 177,77))
  state = 1; //green (on track)
else if (c == color(77,110, 243))
  state = 2; // blue (finish line)
      fill(0, 210);
      noStroke();
      rectMode(CENTER);
      //
      pushMatrix();
      translate(position.x, position.y);
      rotate(-angle);
      rect(0, 0, 35, 75);
      pushMatrix();
      translate(10, 17);
      rotate(steerAngle);
      rect(0, 5, 5, 10);
      popMatrix();
      pushMatrix();
      translate(-10, 17);
      rotate(steerAngle);
      rect(0, 5, 5, 10);
      popMatrix();
      pushMatrix();
      translate(-10, -17);
      rect(0, -5, 5, 10);
      popMatrix();
      pushMatrix();
      translate(10, -17);
      rect(0, -5, 5, 10);
      popMatrix();
      popMatrix();
    }
    //
    void keyPressed() {
      keys[keyCode] = true;
    }
    void keyReleased() {
      keys[keyCode] = false;
    }

