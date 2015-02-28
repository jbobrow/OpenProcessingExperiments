
/**
 * Sketch to demonstrate the use of push and popMatrix to isolate
 * transformations in a composite shape. <br>
 * In this case we have an alien alien hand (just 2 fingers and an 
 * opposing thumb), although it is simple enough to add more 
 * fingers. BTW the thumb is treated as a finger in the code.<br>
 * 
 * There are three classes Hand, Finger and FingerPart.
 * 
 * @author Peter Lager
 *
 */

import g4p_controls.*;

int bodyFill, bodyEdge;

FingerPart[] finger;
Hand hand;

public void setup() {
  size(500, 630);
  bodyFill = color(128, 200, 128);
  bodyEdge = color(32, 128, 32);

  hand = new Hand(100, 60, 250, 250, 0);
  FingerPart p0, p1, p2;
  Finger f;

  p2 = new FingerPart(50, 10, 40, 0, 0, PI/3);
  p1 = new FingerPart(80, 12, 68, 0, 0, PI/3);
  p0 = new FingerPart(100, 14, 86, 0, 0, PI/5);
  p0.nextPart = p1;
  p1.nextPart = p2;
  f = new Finger(p0);
  hand.addFinger(f, 40, -10);

  p2 = new FingerPart(30, 10, 20, 0, 0, PI/2.8);
  p1 = new FingerPart(60, 12, 48, 0, 0, PI/2.8);
  p0 = new FingerPart(80, 14, 66, 0, 0, PI/4.7);
  p0.nextPart = p1;
  p1.nextPart = p2;
  f = new Finger(p0);
  hand.addFinger(f, 40, -10);

  // Opposing thumb
  p1 = new FingerPart(40, 14, 26, 0, 0, -PI/3);
  p0 = new FingerPart(50, 16, 34, 0, PI/2, PI/8);
  p0.nextPart = p1;
  f = new Finger(p0);
  hand.addFinger(f, 16, 16);

  createGUI();
  hand.angle = sdrHand.getValueF();
  hand.moveFinger(0, sdrFinger0.getValueF());
  hand.moveFinger(1, sdrFinger1.getValueF());
  hand.moveFinger(2, sdrFinger2.getValueF());
}

public void draw() {
  background(64);
  noStroke();
  fill(227, 230, 255);
  rect(0, 500, width, height-500);
  hand.display();
}

/**
 * This represents one section of a finger.
 */
public class FingerPart {
  // Next section of the finger (order is from hand to finger tip)
  FingerPart nextPart = null;
  // The pivot point for the next section
  float pivotX = 0;
  float pivotY = 0;
  // The range of angles this part can be made relative
  // to its parent shape.
  float startAngle = 0;
  float endAngle = TWO_PI;
  // Finger dimensions
  float length;
  float thick;

  /**
   * Create a finger part. <br>
   * The nextPart (finger section) is set later.
   */
  public FingerPart(float len, float th, float px, float py, float sang, float eang) {
    length = len;
    thick = th;
    pivotX = px;
    pivotY = py;
    startAngle = sang;
    endAngle = eang;
  }

  /**
   * Display the finger at an angle determined by the parameter t which
   * should be in the range 0-1 and corresponds to an angle in the range <br>
   * startAngle (t=0) to endAngle (t=1) <br>
   * Notice that this will call the display method for the next finger 
   * section and so on.
   */
  public void display(float t) {
    pushMatrix();
    rotate(startAngle + (endAngle - startAngle) * t);
    ellipse(0, 0, 2 * thick, 2 * thick);
    ellipse(pivotX, pivotY, 2 * thick, 2 * thick);
    noStroke();
    rect(0, -thick, pivotX, 2 * thick);
    stroke(bodyEdge);
    line(0, -thick, pivotX, -thick);
    line(0, thick, pivotX, thick);
    translate(pivotX, pivotY);
    if (nextPart != null)
      nextPart.display(t);
    popMatrix();
  }
}

/**
 * This represents a single finger. <br>
 * It has its own t value so it can be moved independently of the other
 * fingers.
 */
public class Finger {
  // The first section of the finger
  FingerPart first;
  // Its position relative to the hand.
  float posX;
  float posY;
  // Controls angle the finger is drawn at
  float t;

  /**
   * Create a finger specifying the first finger section
   */
  public Finger(FingerPart part) {
    first = part;
  }

  /**
   * Drawing the first section will cause subsequent sections
   * to be displayed.
   */
  public void display() {
    pushMatrix();
    translate(posX, posY);
    if (first != null)
      first.display(t);
    popMatrix();
  }
}

/**
 * The hand can have as many fingers as you like. <br>
 * Calling the display method will draw the hand 
 * and then each finger (which then displays the 
 * finger sections. <br>
 */
public class Hand {
  ArrayList<Finger> fingers = new ArrayList<Finger>();

  float posX;
  float posY;
  float angle;
  float length;
  float thick;

  public Hand(float len, float th, float px, float py, float ang) {
    length = len;
    thick = th;
    posX = px;
    posY = py;
    angle = ang;
  }

  public void addFinger(Finger f, float x, float y) {
    f.posX = x;
    f.posY = y;
    fingers.add(f);
  }

  /**
   * Move the specified finger
   * @param id the position in the arraylist
   * @param t the angle control value
   */
  public void moveFinger(int id, float t) {
    if (id >= 0 && id < fingers.size())
      fingers.get(id).t = t;
  }

  /**
   * Display the hand at its current position and angle.
   * @param t
   */
  public void display() {
    pushStyle();
    fill(bodyFill);
    stroke(bodyEdge);
    strokeWeight(2);
    pushMatrix();
    translate(posX, posY);
    rotate(angle);
    rect(-length / 2, -thick/2, length, thick);
    fill(bodyFill);
    for (Finger f : fingers)
      f.display();
    popMatrix();
    popStyle();
  }
}


