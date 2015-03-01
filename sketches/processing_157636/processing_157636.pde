
/*
 @pjs preload="font.png,ship.gif,bk.png";
 */

/*
 Andor Salga
 Simple demo of forces from Nature of Code 
*/

PImage hud;

Debugger debug;
Ship ship;
StarBackground starBackground;
Timer timer;

/////////////////
// SETUP
/////////////////
void setup() {
  size(640, 400);
  imageMode(CENTER);
  hud = loadImage("bk.png");

  debug = new Debugger();

  Keyboard.lockKeys(new int[] {
    KEY_D, 
    KEY_P, 
    KEY_T
  }
  );
  Keyboard.setVirtualKeyDown(KEY_T, true);

  ship = new Ship();
  ship.setMaxSpeed(300);
  ship.applyForce(0, 40);

  timer = new Timer();
  starBackground = new StarBackground();
  starBackground.setup(20);
}

void update() {

  debug.setOn(Keyboard.isKeyDown(KEY_T));

  timer.tick();
  float dt = timer.getDeltaSec();

  ship.update(dt);

  starBackground.setVelocity(ship.getVelocity());  
  starBackground.update(dt);

  debug.addString("T - Toggle testing");
  debug.addString("D - Toggle drifting");
  debug.addString("Z - Thrusters");
}

/////////////////
// DRAW
/////////////////
void draw() {
  Timer frameTimer = new Timer();
  frameTimer.tick();

  update();

  fill(0);
  rect(0, 0, width, height);

  starBackground.render();

  pushStyle();
  imageMode(CORNER);
  image(hud, 0, 0);
  popStyle();

  ship.render();

  frameTimer.tick();
  float frameTime = frameTimer.getDeltaSec();
  debug.addString(frameTime * 1000 + "ms");
  debug.addString("" + floor(ship.getVelocity().x) + ", " + floor(ship.getVelocity().y));
  

  debug.draw();
  debug.clear();
}

void keyReleased() {
  Keyboard.setKeyDown(keyCode, false);
}

void keyPressed() {
  Keyboard.setKeyDown(keyCode, true);
}

////////////////////////
// DEBUGGER
////////////////////////

/*
 * Prints text on top of everything for real-time object tracking.
 */
class Debugger{
  private ArrayList strings;
  private PFont font;
  private int fontSize;
  private boolean isOn;
  
  public Debugger(){
    isOn = true;
    strings = new ArrayList();
    fontSize = 15;
    font = createFont("Arial", fontSize);
  }
  
  public void addString(String s){
    if(isOn){
      strings.add(s);
    }
  }
  
  /*
   * Should be called after every frame
   */
  public void clear(){
    strings.clear();
  }
  
  /**
    If the debugger is off, it will ignore calls to addString and draw saving
    some processing time.
  */
  public void toggle(){
    isOn = !isOn;
  }
  
  public void setOn(boolean on){
    isOn = on;
  }
  
  public void draw(){
    if(isOn){
      int y = 20;
      fill(255);
      for(int i = 0; i < strings.size(); i++, y+=fontSize){
        textFont(font);
        text((String)strings.get(i),0,y);
      }
    }
  }
}

////////////////////////
// KEYBOARD
////////////////////////

/*
 * Classes poll keyboard state to get state of keys.
 */
public static class Keyboard{
  
  /*
  * 
  */
  private static final int NUM_KEYS = 128;
  
  // Locking keys are good for toggling things.
  // After locking a key, when a user presses and releases a key, it will register and
  // being 'down' (even though it has been released). Once the user presses it again,
  // it will register as 'up'.
  private static boolean[] lockableKeys = new boolean[NUM_KEYS];
  
  // Use char since we only need to store 2 states (0, 1)
  private static char[] lockedKeyPresses = new char[NUM_KEYS];
  
  // The key states, true if key is down, false if key is up.
  private static boolean[] keys = new boolean[NUM_KEYS];
  
  /*
   * The specified keys will stay down even after user releases the key.
   * Once they press that key again, only then will the key state be changed to up(false).
   */
  public static void lockKeys(int[] keys){
    for(int k : keys){
      if(isValidKey(k)){
        lockableKeys[k] = true;
      }
    }
  }
  
  /*
   * TODO: if the key was locked and is down, then we unlock it, it needs to 'pop' back up.
   */
  public static void unlockKeys(int[] keys){
    for(int k : keys){
      if(isValidKey(k)){
        lockableKeys[k] = false;
      }
    }
  }
  
  /* This is for the case when we want to start off the game
   * assuming a key is already down.
   */
  public static void setVirtualKeyDown(int key, boolean state){
    setKeyDown(key, true);
    setKeyDown(key, false);
  }
  
  /**
   */
  private static boolean isValidKey(int key){
    return (key > -1 && key < NUM_KEYS);
  }
  
  /*
   * Set the state of a key to either down (true) or up (false)
   */
  public static void setKeyDown(int key, boolean state){
    
    if(isValidKey(key)){
      
      // If the key is lockable, as soon as we tell the class the key is down, we lock it.
      if( lockableKeys[key] ){
          // First time pressed
          if(state == true && lockedKeyPresses[key] == 0){
            lockedKeyPresses[key]++;
            keys[key] = true;
          }
          // First time released
          else if(state == false && lockedKeyPresses[key] == 1){
            lockedKeyPresses[key]++;
          }
          // Second time pressed
          else if(state == true && lockedKeyPresses[key] == 2){
             lockedKeyPresses[key]++;
          }
          // Second time released
          else if (state == false && lockedKeyPresses[key] == 3){
            lockedKeyPresses[key] = 0;
            keys[key] = false;
          }
      }
      else{
        keys[key] = state;
      }
    }
  }
  
  /* 
   * Returns true if the specified key is down.
   */
  public static boolean isKeyDown(int key){
    return keys[key];
  }
}

// These are outside of keyboard simply because I don't want to keep
// typing Keyboard.KEY_* in the main Tetrissing.pde file
final int KEY_BACKSPACE = 8;
final int KEY_TAB       = 9;
final int KEY_ENTER     = 10;

final int KEY_SHIFT     = 16;
final int KEY_CTRL      = 17;
final int KEY_ALT       = 18;

final int KEY_CAPS      = 20;
final int KEY_ESC = 27;

final int KEY_SPACE  = 32;
final int KEY_PGUP   = 33;
final int KEY_PGDN   = 34;
final int KEY_END    = 35;
final int KEY_HOME   = 36;

final int KEY_LEFT   = 37;
final int KEY_UP     = 38;
final int KEY_RIGHT  = 39;
final int KEY_DOWN   = 40;

final int KEY_0 = 48;
final int KEY_1 = 49;
final int KEY_2 = 50;
final int KEY_3 = 51;
final int KEY_4 = 52;
final int KEY_5 = 53;
final int KEY_6 = 54;
final int KEY_7 = 55;
final int KEY_8 = 56;
final int KEY_9 = 57;

final int KEY_A = 65;
final int KEY_B = 66;
final int KEY_C = 67;
final int KEY_D = 68;
final int KEY_E = 69;
final int KEY_F = 70;
final int KEY_G = 71;
final int KEY_H = 72;
final int KEY_I = 73;
final int KEY_J = 74;
final int KEY_K = 75;
final int KEY_L = 76;
final int KEY_M = 77;
final int KEY_N = 78;
final int KEY_O = 79;
final int KEY_P = 80;
final int KEY_Q = 81;
final int KEY_R = 82;
final int KEY_S = 83;
final int KEY_T = 84;
final int KEY_U = 85;
final int KEY_V = 86;
final int KEY_W = 87;
final int KEY_X = 88;
final int KEY_Y = 89;
final int KEY_Z = 90;

// Function keys
final int KEY_F1  = 112;
final int KEY_F2  = 113;
final int KEY_F3  = 114;
final int KEY_F4  = 115;
final int KEY_F5  = 116;
final int KEY_F6  = 117;
final int KEY_F7  = 118;
final int KEY_F8  = 119;
final int KEY_F9  = 120;
final int KEY_F10 = 121;
final int KEY_F12 = 122;

//final int KEY_INSERT = 155;

/////////////////
// SHIP
/////////////////
class Ship {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float thrustCoolDown;

  PImage img;
  float rotation;
  float rotSpeed;
  float dragCoefficient = .01;
  float maxSpeed;

  Ship() {
    position = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    img = loadImage("ship.gif");
    rotation = 0;
    rotSpeed = TWO_PI;
    maxSpeed = 100;
    thrustCoolDown = 0.0f;
  }

  PVector getVelocity() {
    return velocity;
  }

  void setMaxSpeed(float max) {
    maxSpeed = max;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  void applyForce(float x, float y) {
    acceleration.x += x;
    acceleration.y += y;
  }

  void thrust(float mag) {
    applyForce(sin(rotation)*mag, cos(rotation)*mag);
  }

  void update(float dt) {
    boolean allowDrifting = Keyboard.isKeyDown(KEY_D);

    thrustCoolDown -= dt;
    thrustCoolDown = max(thrustCoolDown, 0);


    if (Keyboard.isKeyDown(KEY_UP)) {
      ship.thrust(2);
    }

    if (Keyboard.isKeyDown(KEY_LEFT)) {
      rotation -= rotSpeed * dt;
    }

    if (Keyboard.isKeyDown(KEY_RIGHT)) {
      rotation += rotSpeed * dt;
    }

    // Just playing around.....
    if (Keyboard.isKeyDown(KEY_W)) {
      rotation = 0;
    }

 
    // if we don't want drifting, we need to rotate the velocity vector  
    if (allowDrifting == false) {
      float mag = velocity.mag();
      velocity.x = sin(rotation) * mag;
      velocity.y = cos(rotation) * mag;
    }

    // Cap velocity
    if (velocity.mag() > maxSpeed && maxSpeed > 0) {
      float mag = velocity.mag();

      velocity.x = (velocity.x / mag) * maxSpeed;
      velocity.y = (velocity.y / mag) * maxSpeed;
    }


    PVector drag = new PVector(velocity.x, velocity.y);
    drag.mult(-1);
    drag.mult(dragCoefficient);
    applyForce(drag);

   if (Keyboard.isKeyDown(KEY_Z)){ //&& thrustCoolDown >= 0.0f) {
      thrust(50 * thrustCoolDown);
      thrustCoolDown -= dt *1.0f;
      thrustCoolDown = max(0, thrustCoolDown);
    }
    else{
      thrustCoolDown += dt * 2.0f;
      thrustCoolDown = min(1, thrustCoolDown);
    }


    velocity.add(acceleration);

    position.x += velocity.x * dt;
    position.y += velocity.y * dt;

    acceleration.mult(0);
  }

  void render() {
    pushMatrix();
    imageMode(CENTER);
    translate(440/2, 380/2);

    rotate(rotation);
    image(img, 0, 0);
    popMatrix();
    text("" + velocity.y, 40, 60);
  }
}

/////////////////
// STARBACKGROUND
/////////////////
class StarBackground {
  final int StarBuffer = 20;

  Star[] stars;
  PVector vel;
  PVector dir;

  StarBackground() {
  }

  void setup(int n) {
    dir = new PVector();
    stars = new Star[n];

    for (int i = 0; i < stars.length; i++) {
      stars[i] = new Star();
    }
  }

  void render() {
    stroke(255);
    strokeWeight(1);

    for (int i = 0; i < stars.length; i++) {
      stars[i].render();
    }
  }

  void update(float dt) {
    for (int i = 0; i < stars.length; i++) {
      stars[i].update(dt);
    }
  }

  void setVelocity(PVector v) {
    dir = vel = v;
    float mag = vel.mag();

    for (int i = 0; i < stars.length; i++) {
      stars[i].setDirection(dir);
    }
  }

  class Star {
    PVector position;
    PVector velocity;
    float speed;
    PVector direction;

    Star() {
      direction = new PVector();
      position = new PVector(random(0, width), random(0, height));
      speed = random(0.5, 1);
    }

    void setDirection(PVector v) {
      direction = v;
    }

    void update(float dt) {

      position.x += direction.x * dt * -speed;
      position.y += direction.y * dt * speed;

      if (position.y > height + StarBuffer) {
        position.y =  -StarBuffer;
      }
      if (position.x > width + StarBuffer) {
        position.x = -StarBuffer;
      }
      if (position.y < -StarBuffer) {
        position.y = height + StarBuffer;
      }
      if (position.x < -StarBuffer) {
        position.x = width + StarBuffer;
      }
    }

    void render() {
      point(position.x, position.y);
    }

    void setVelocity(PVector v) {
      velocity = v;
    }
  }
}

////////////////////////
// TIMER
////////////////////////

/**
 * A timer class to manage animation timing.
 */
public class Timer {

  private int lastTime;
  private float deltaTime;
  private boolean paused;
  private float totalTime;
  private boolean countingUp; 

  public Timer() {
    reset();
  }

  public boolean isPaused() {
    return paused;
  }

  public void setDirection(int d) {
    countingUp = false;
  }

  public void reset() {
    deltaTime = 0.0f;
    lastTime = -1;
    paused = false;
    totalTime = 0.0f;
    countingUp = true;
  }
  public void togglePause() {
    if (paused) {
      resume();
    }
    else {
      pause();
    }
  }

  public void pause() {
    paused = true;
  }

  public void resume() {
    deltaTime = 0.0f;
    lastTime = -1;
    paused = false;
  }

  public void setTime(int min, int sec) {    
    totalTime = (min * 60) + sec;
  }

  /*
      Format: 5.5 = 5 minutes 30 seconds
   */
  public void setTime(float minutes) {
    int int_min = (int)minutes;
    int sec = (int)((minutes - (float)int_min) * 60.0f);
    setTime( int_min, sec);
  }

  public float getTotalTime() {
    return totalTime;
  }

  /*
  */
  public float getDeltaSec() {
    if (paused) {
      return 0.0f;
    }
    return deltaTime;
  }

  /*
  * Calculates how many seconds passed since the last call to this method.
   *
   */
  public void tick() {
    if (lastTime == -1) {
      lastTime = millis();
    }

    int delta = millis() - lastTime;
    lastTime = millis();
    deltaTime = delta/1000.0f;

    if (countingUp) {
      totalTime += deltaTime;
    }
    else {
      totalTime -= deltaTime;
    }
  }
}


