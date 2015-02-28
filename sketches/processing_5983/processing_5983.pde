
// acd 20091107
// mobile

// how many levels
public static final int MAX_LEVELS = 6;
// length of first arm
public static final int MAX_LENGTH = 200;
public static final int MAX_DOWN = 20;
public static final int MAX_VOLUME = 30;
public static final float V_FACTOR = 0.793700526;  // 1 / cube root of 2

// probability of a sphere for each arm
public static final int R_PROB = 25;
public static final int L_PROB = 25;

// base arm
Arm arm;

void setup() {
  size(800, 400, P3D);
  arm = new Arm(0);
  sphereDetail(20);
  frameRate(15);
}

void draw() {
  background(255);
  translate(width / 2, 0, 0);
  camera(0, MAX_DOWN * 3, MAX_LENGTH * 2, 0, MAX_DOWN * 3, 0, 0, 1, 0);
  sphere(2);
  arm.draw();
}

// click rejigs everything
void mousePressed() {
  arm = new Arm(0);
}

void keyPressed() {
  saveFrame("mobile_###.png");
  delay(1000);
}

// an arm has two ends, each of which can be another arm
// each arm has a length and is centred on 0
// and is twisted in relation to its parent by angle
class Arm {
  float angle;
  float delta;
  float len, down;
  float rad;
  Arm left = null;
  Arm right = null;
  color cl, cr;
  
  public Arm(int level) {
    if (level < MAX_LEVELS) {
      if (random(100) > L_PROB) {
        left = new Arm(level + 1);
      }
      if (random(100) > R_PROB) {
        right = new Arm(level + 1);
      }
    }
    // random colour and rotation
    angle = random(TWO_PI);
    delta = random(-.02, .02);
    cl = color(random(64, 240), random(64, 240), random(64, 240));
    cr = color(random(64, 240), random(64, 240), random(64, 240));
    // arms for each level are half the length of the level above
    len = MAX_LENGTH / (1 << level);
    down = MAX_DOWN;  //15;//MAX_DOWN * pow(.6, level);
    // and the radius of the sphere varies by 1.26 (cube root of 3)
    rad = MAX_VOLUME * pow(V_FACTOR, level);
//    println("Arm[" + level + "]: L[" + left + "] R[" + right + "] L[" + len + "]");
  }
  
  public void draw() {
    
    // rotate
    angle += delta;
    
    stroke(0);
    
    pushMatrix();
    rotateY(angle);
    
    // string
    strokeWeight(1);
    line(0, 0, 0, down);
    translate(0, down);
    
    // arm
    strokeWeight(1);
    line(-len, 0, len, 0);
    
    // left
    pushMatrix();
    translate(-len, 0);
    if (left == null) {
      // draw sphere
      noStroke();
      fill(cl);
      sphere(rad);
    } else {
      // draw left child
      left.draw();
    }
    popMatrix();
    
    // right
    pushMatrix();
    translate(len, 0);
    if (right == null) {
      // draw sphere
      noStroke();
      fill(cr);
      sphere(rad);
    } else {
      // draw right child
      right.draw();
    }
    popMatrix();
    
    popMatrix();
  }
}


