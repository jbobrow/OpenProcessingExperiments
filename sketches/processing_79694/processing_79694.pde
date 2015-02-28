
// simple car by Luke O'Connor

    PFont font;
    PImage img;  // Image variable here
    int timer=25;
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
    }
    void game() {
      if (second()!=timeLast) {
        timeLast=second();
        timer-=1;
      }
      //
      background(img);
      fill(0);
      text("Timer: "+timer, 320, 35);
      //
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
      //
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

