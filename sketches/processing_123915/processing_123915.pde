
import de.voidplus.leapmotion.*;
ArrayList<Emitter> peep = new ArrayList();
LeapMotion leap;

void setup() {
  size(800, 500);
  //background(255);
  noStroke(); 
  fill(50);
  // ...

  leap = new LeapMotion(this);
}

void draw() {
  background(255);
  // ...
  int fps = leap.getFrameRate();

  // HANDS
  for (Hand hand : leap.getHands()) {

    hand.draw();
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    float   hand_time        = hand.getTimeVisible();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();

    // FINGERS
    for (Finger finger : hand.getFingers()) {

      // Basics
      finger.draw();
      int     finger_id         = finger.getId();
      PVector finger_position   = finger.getPosition();
      PVector finger_stabilized = finger.getStabilizedPosition();
      PVector finger_velocity   = finger.getVelocity();
      PVector finger_direction  = finger.getDirection();
      float   finger_time       = finger.getTimeVisible();

      // Touch Emulation
      int     touch_zone        = finger.getTouchZone();
      float   touch_distance    = finger.getTouchDistance();

      noFill();
      stroke(0);
      ellipse(finger_stabilized.x, finger_stabilized.y, 50, 50);
//
//      for (int i=0; i<1;i++)
//      {
//        Emitter E = new Emitter(new PVector(finger_stabilized.x, finger_stabilized.y));
//        peep.add(E);
//      }



      switch(touch_zone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#"+finger_id+"): "+touch_distance);
        break;
      case 1: // Touching
        // println("Touching (#"+finger_id+")");
        break;
      }
    }


    // TOOLS
    for (Tool tool : hand.getTools()) {

      // Basics
      tool.draw();
      int     tool_id           = tool.getId();
      PVector tool_position     = tool.getPosition();
      PVector tool_stabilized   = tool.getStabilizedPosition();
      PVector tool_velocity     = tool.getVelocity();
      PVector tool_direction    = tool.getDirection();
      float   tool_time         = tool.getTimeVisible();

      // Touch Emulation
      int     touch_zone        = tool.getTouchZone();
      float   touch_distance    = tool.getTouchDistance();

      switch(touch_zone) {
      case -1: // None
        break;
      case 0: // Hovering
        // println("Hovering (#"+tool_id+"): "+touch_distance);
        break;
      case 1: // Touching
        // println("Touching (#"+tool_id+")");
        break;
      }
    }
  }

  for (int j=0;j<peep.size();j++)
  {
    Emitter e = (Emitter) peep.get(j);
    e.display();
    e.update();
  }



  // DEVICES
  // for(Device device : leap.getDevices()){
  //   float device_horizontal_view_angle = device.getHorizontalViewAngle();
  //   float device_verical_view_angle = device.getVerticalViewAngle();
  //   float device_range = device.getRange();
  // }
}

void leapOnInit() {
  // println("Leap Motion Init");
}

void leapOnConnect() {
  // println("Leap Motion Connect");
}

void leapOnFrame() {
  // println("Leap Motion Frame");
}

void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}

void leapOnExit() {
  // println("Leap Motion Exit");
}



class Emitter {
  PVector loc, acc;
  color c;
  float r;
  Emitter(PVector loc1) {
    loc = loc1;
    acc = new PVector(random(-1, 1), random(-1, 1));
    c = (color) random(#000000);
    r = random(20);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(loc.x, loc.y, r, r);
  }

  void update() {
    loc.add(acc);
  }
}

