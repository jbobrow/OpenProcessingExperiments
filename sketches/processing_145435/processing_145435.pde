
/* Code written by Pauline Unietis
 Leap Motion hardware needed to run this code!
 Sections of code from Leap Motion Java Reference (https://developer.leapmotion.com/documentation/java/index.html)
 controlP5, Leap Motion and Minim code and libraries used
 Help from Sonia Martin and Ms. Freed
 NOTE: If a NullPointerException arises, try unplugging the Leap and plugging it back in
 KNOWN BUG: A NullPointerException arises after closing the program */
import controlP5.*;
import de.voidplus.leapmotion.*;
import ddf.minim.* ;
int[] keycolors = new int[9];
int screenwidth = 800;
int screenlength = 500;
int keywidth = screenwidth / 8;
int m;
float fingerNumber;
LeapMotion leap;
Minim minim;
ControlP5 cp5;
Textlabel instructions;
Textlabel instructions2;
AudioPlayer key1, key2, key3, key4, key5, key6, key7, key8;

void setup()
{
  size(screenwidth, screenlength, P3D);
  background(0);
  noStroke();
  rect(50, 50, 700, 400);
  fill(0);
  rect(75, 75, 650, 350);
  fill(255);
  leap = new LeapMotion(this).withGestures();
  minim = new Minim(this);
  cp5 = new ControlP5(this);
  key1 = minim.loadFile("xylo1.wav");
  key2 = minim.loadFile("xylo2.wav");
  key3 = minim.loadFile("xylo3.wav");
  key4 = minim.loadFile("xylo4.wav");
  key5 = minim.loadFile("xylo5.wav");
  key6 = minim.loadFile("xylo6.wav");
  key7 = minim.loadFile("xylo7.wav");
  key8 = minim.loadFile("xylo8.wav");
  instructions = cp5.addTextlabel("label")
    .setText("Place your hand in this box! Turn it so that your pinkie finger is facing")
      .setPosition(75, 0)
        .setFont(createFont("Georgia", 20))
          ;
  instructions2 = cp5.addTextlabel("label2")
    .setText("the computer and your thumb is facing the sky.")
      .setPosition(175, 22)
        .setFont(createFont("Georgia", 20))
          ;
}

void draw()
{   
  int fps = leap.getFrameRate();
  // HANDS
  for (Hand hand : leap.getHands()) {
    ArrayList<Finger> finger1 = hand.getFingers();
    int     hand_id          = hand.getId();
    PVector hand_position    = hand.getPosition();
    PVector hand_stabilized  = hand.getStabilizedPosition();
    PVector hand_direction   = hand.getDirection();
    PVector hand_dynamics    = hand.getDynamics();
    float   hand_roll        = hand.getRoll();
    float   hand_pitch       = hand.getPitch();
    float   hand_yaw         = hand.getYaw();
    PVector sphere_position  = hand.getSpherePosition();
    float   sphere_radius    = hand.getSphereRadius();
    // FINGERS
    for (Finger finger : hand.getFingers()) {
      fingerNumber = finger1.size();
      if (fingerNumber == 1) {
        // Basics
        finger.draw();
        int     finger_id         = finger.getId();
        PVector finger_position   = finger.getPosition();
        PVector finger_stabilized = finger.getStabilizedPosition();
        PVector finger_velocity   = finger.getVelocity();
        PVector finger_direction  = finger.getDirection();          

        if (finger_position.x > 50 && finger_position.x < 750
          && finger_position.y > 50 && finger_position.y < 450) 
          //if the finger is in the right position
        {
          //leave instructions for 5 seconds
          m = millis();
          if (m > 5000)
          {
            //remove the instructions
            instructions.setText("");
            instructions2.setText("");
            //draw the keys
            fill(keycolors[0]); 
            rect(0, 0, keywidth, screenlength);
            fill(keycolors[1]);
            rect(keywidth, 0, keywidth, screenlength); 
            fill(keycolors[2]);
            rect(keywidth * 2, 0, keywidth, screenlength);
            fill(keycolors[3]);
            rect(keywidth * 3, 0, keywidth, screenlength);
            fill(keycolors[4]);
            rect(keywidth * 4, 0, keywidth, screenlength);
            fill(keycolors[5]);
            rect(keywidth * 5, 0, keywidth, screenlength);
            fill(keycolors[6]);
            rect(keywidth * 6, 0, keywidth, screenlength);
            fill(keycolors[7]);
            rect(keywidth * 7, 0, keywidth, screenlength);
            fill(255);
          }

          //depending on the finger's position, play a different key 
          //and change the colors of the keys
          if (finger_position.x <= keywidth)
          {
            keycolors[0] = 200;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key1.play();
            key2.pause();
            key3.pause();
            key4.pause();
            key5.pause();
            key6.pause();
            key7.pause();
            key8.pause();
            key2.rewind();
            key3.rewind();
            key4.rewind();
            key5.rewind();
            key6.rewind();
            key7.rewind();
            key8.rewind();
          }
          else if (finger_position.x >= keywidth && finger_position.x <= keywidth * 2)
          {
            keycolors[1] = 200;
            keycolors[0] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key2.play();
            key1.pause();
            key3.pause();
            key4.pause();
            key5.pause();
            key6.pause();
            key7.pause();
            key8.pause();
            key1.rewind();
            key3.rewind();
            key4.rewind();
            key5.rewind();
            key6.rewind();
            key7.rewind();
            key8.rewind();
          }  
          else if (finger_position.x >= keywidth * 2 && finger_position.x <= keywidth * 3)
          {
            keycolors[2] = 200;
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key3.play();
            key1.pause();
            key2.pause();
            key4.pause();
            key5.pause();
            key6.pause();
            key7.pause();
            key8.pause();
            key1.rewind();
            key2.rewind();
            key4.rewind();
            key5.rewind();
            key6.rewind();
            key7.rewind();
            key8.rewind();
          }
          else if (finger_position.x >= keywidth * 3 && finger_position.x <= keywidth * 4)
          {
            keycolors[3] = 200;
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key4.play();
            key1.pause();
            key2.pause();
            key3.pause();
            key5.pause();
            key6.pause();
            key7.pause();
            key8.pause();
            key1.rewind();
            key2.rewind();
            key3.rewind();
            key5.rewind();
            key6.rewind();
            key7.rewind();
            key8.rewind();
          }
          else if (finger_position.x >= keywidth * 4 && finger_position.x <= keywidth * 5)
          {
            keycolors[4] = 200;
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key5.play();
            key1.pause();
            key2.pause();
            key3.pause();
            key4.pause();
            key6.pause();
            key7.pause();
            key8.pause();
            key1.rewind();
            key2.rewind();
            key3.rewind();
            key4.rewind();
            key6.rewind();
            key7.rewind();
            key8.rewind();
          }
          else if (finger_position.x >= keywidth * 5 && finger_position.x <= keywidth * 6)
          {
            keycolors[5] = 200;
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key1.pause();
            key2.pause();
            key3.pause();
            key4.pause();
            key5.pause();
            key7.pause();
            key8.pause();
            key1.pause();
            key1.rewind();
            key2.rewind();
            key3.rewind();
            key4.rewind();
            key5.rewind();
            key7.rewind();
            key8.rewind();
          }
          else if (finger_position.x >= keywidth * 6 && finger_position.x <= keywidth * 7)
          {
            keycolors[6] = 200;
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key7.play();
            key1.pause();
            key2.pause();
            key3.pause();
            key4.pause();
            key5.pause();
            key6.pause();
            key8.pause();
            key1.rewind();
            key2.rewind();
            key3.rewind();
            key4.rewind();
            key5.rewind();
            key6.rewind();
            key8.rewind();
          }
          else if (finger_position.x >= keywidth * 7 && finger_position.x <= keywidth * 8)
          {
            keycolors[7] = 200;
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[8] = 0;
            key8.play();
            key1.pause();
            key2.pause();
            key3.pause();
            key4.pause();
            key5.pause();
            key6.pause();
            key7.pause();
            key8.pause();
            key1.rewind();
            key2.rewind();
            key3.rewind();
            key4.rewind();
            key5.rewind();
            key6.rewind();
            key7.rewind();
          }
          else
          {
            keycolors[0] = 0;
            keycolors[1] = 0;
            keycolors[2] = 0;
            keycolors[3] = 0;
            keycolors[4] = 0;
            keycolors[5] = 0;
            keycolors[6] = 0;
            keycolors[7] = 0;
            keycolors[8] = 0;
            key1.rewind();
            key2.rewind();
            key3.rewind();
            key4.rewind();
            key5.rewind();
            key6.rewind();
            key7.rewind();
            key8.rewind();
          }

          // Touch Emulation
          int     touch_zone        = finger.getTouchZone();
          float   touch_distance    = finger.getTouchDistance();

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
    // DEVICES
    for (Device device : leap.getDevices()) {
      float device_horizontal_view_angle = device.getHorizontalViewAngle();
      float device_verical_view_angle = device.getVerticalViewAngle();
      float device_range = device.getRange();
    }
  }
}

void stop()
{
  key1.close();
  key2.close();
  key3.close();
  key4.close();
  key5.close();
  key6.close();
  key7.close();
  key8.close();
  minim.stop();
  super.stop();
}

// SWIPE GESTURE
void leapOnSwipeGesture(SwipeGesture g, int state) {
  int     id                  = g.getId();
  Finger  finger              = g.getFinger();
  PVector position            = g.getPosition();
  PVector position_start      = g.getStartPosition();
  PVector direction           = g.getDirection();
  float   speed               = g.getSpeed();
  long    duration            = g.getDuration();
  float   duration_seconds    = g.getDurationInSeconds();

  println(direction);

  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    println("SwipeGesture: "+id);
    break;
  }
}

// CIRCLE GESTURE
void leapOnCircleGesture(CircleGesture g, int state) {
  int     id                  = g.getId();
  Finger  finger              = g.getFinger();
  PVector position_center     = g.getCenter();
  float   radius              = g.getRadius();
  float   progress            = g.getProgress();
  long    duration            = g.getDuration();
  float   duration_seconds    = g.getDurationInSeconds();

  switch(state) {
  case 1: // Start
    break;
  case 2: // Update
    break;
  case 3: // Stop
    println("CircleGesture: "+id);
    break;
  }
}

// SCREEN TAP GESTURE
void leapOnScreenTapGesture(ScreenTapGesture g) {
  int     id                  = g.getId();
  Finger  finger              = g.getFinger();
  PVector position            = g.getPosition();
  PVector direction           = g.getDirection();
  long    duration            = g.getDuration();
  float   duration_seconds    = g.getDurationInSeconds();

  println("ScreenTapGesture: "+id);
}

// KEY TAP GESTURE
void leapOnKeyTapGesture(KeyTapGesture g) {
  int     id                  = g.getId();
  Finger  finger              = g.getFinger();
  PVector position            = g.getPosition();
  PVector direction           = g.getDirection();
  long    duration            = g.getDuration();
  float   duration_seconds    = g.getDurationInSeconds();

  println("KeyTapGesture: "+id);
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

