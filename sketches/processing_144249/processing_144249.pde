
/*
 Andor Salga
 April 2014
 
 BUGS/TODOS:
 - Fix sprites popping (need to sort)
 - Fix rendering culling (this test was initially only for collisions)
 - Separate collision checks from update()
 
 - Fix JS perf when root dimensions = canvas dimensions
 - Java mode -> 700 sprites @ level 4 ~= 60 fps
 - JS mode   -> 300 sprites @ level 4 ~= 15 fps
 - calling contains() is slow
 (Using binary search tree could help here)
 (Currently mitigated by increasing the size of the quadtree so that it is called less)
 */

final int SpriteSize = 32;
final int MaxSprites = 300; // limited because js perf issue :(
final int StartSpriteCount = 10;

int numSprites = 0;

PImage ghost1, ghost2;
QuadTree quadTree;
QuadTree.Node root;
Timer timer;
Timer perfTimer;
Timer updateHUDTimer;

boolean isPaused = false;
boolean debugOn = true;

PVector camPos;
float camSpeed = 500.0f;
Rectangle r;

PFont fpsFont = createFont("arial", 20);

// HUD stuff
float updateTime = 0;
int numTests = 0;

void setup() {
  size(500, 500);

  imageMode(CENTER);
  ellipseMode(CENTER);
  noSmooth();

  ghost1 = loadImage("ghost1.png");
  ghost2 = loadImage("ghost2.png");

  restart();
}

void restart() {
  numSprites = StartSpriteCount;
  setupQuadTree(1);
  
  timer = new Timer();
  perfTimer = new Timer();
  updateHUDTimer = new Timer();
  
  r = new Rectangle(root.x, root.y, root.w, root.h);
  camPos = new PVector(root.w/2 - width/2, root.h/2 - height/2);
}

void setupQuadTree(int depth) {
  quadTree = new QuadTree();
  quadTree.create(width * 4, height * 4, depth);
  quadTree.setDebug(debugOn);
  root = quadTree.getRoot();

  for (int i = 0; i < numSprites; i++) {
    Ghost g = new Ghost();
    g.pos.x = random(0, root.w); 
    g.pos.y = random(0, root.h);
    quadTree.addSprite(g);
  }
  
  // Add one to center to user has idea of what's going on
  Ghost g = new Ghost();
  g.pos.x = root.w/2;
  g.pos.y = root.h/2;
  quadTree.addSprite(g);
  numSprites++;
  
}

void update() {
  timer.tick();
  perfTimer.tick();
  updateHUDTimer.tick();
  
  float delta = timer.getDeltaSec();
  
  if(updateHUDTimer.getTotalTime() > 0.25f){
    updateHUDTimer.reset();
    updateTime = perfTimer.getDeltaSec();
    numTests = quadTree.getNumIntersectionTests();
  }

  if (Keyboard.isKeyDown(KEY_RIGHT)) {
    camPos.x += camSpeed * delta;
  }
  if (Keyboard.isKeyDown(KEY_LEFT)) {
    camPos.x -= camSpeed * delta;
  }
  if (Keyboard.isKeyDown(KEY_UP)) {
    camPos.y -= camSpeed * delta;
  }
  if (Keyboard.isKeyDown(KEY_DOWN)) {
    camPos.y += camSpeed * delta;
  }

  quadTree.update(delta);
}

void keyPressed() {
  Keyboard.setKeyDown(keyCode, true);

  if (keyCode == KEY_P) {
    timer.togglePause();
  }

  if (keyCode == KEY_R) {
    restart();
  }

  if (keyCode == KEY_D) {
    debugOn = !debugOn;
    quadTree.setDebug(debugOn);
  }

  if (keyCode >= KEY_1 && keyCode <= KEY_4) {
    quadTree.setDepth(keyCode - 48);
  }
}

void keyReleased() {
  Keyboard.setKeyDown(keyCode, false);
}

void draw() {
  update();

  background(0);

  pushMatrix();
  translate(-camPos.x, -camPos.y);
  quadTree.draw();
  popMatrix();

  if (mousePressed && timer.isPaused() == false) {
    if (numSprites < MaxSprites) {
 
      int x = int(mouseX + camPos.x);
      int y = int(mouseY + camPos.y);

      if (Utils.isPointInRect(new PVector(x, y), r)) { 
        Sprite s = new Ghost();
        // Prevent the sprite from leaving the quadtree
        s.pos.x = x;
        s.pos.y = y;
        quadTree.addSprite(s);
        numSprites++;
      }
    }
  }

  int x = 20;
  // Drawing the debug lines for the quadtree 
  fill(0, 255, 0);
  textFont(fpsFont);
  text("FPS:" + floor(frameRate), x, 20);
  text("Sprites: " + numSprites, x, 60);
  text("Collisions Tests " + numTests, x, 80);
  text("QuadTree Depth: " + quadTree.getDepth(), x, 100);
  text("Update Time (ms): " + updateTime, x, 120);
}

/*
    
 */
public class Ghost extends Sprite {  

  private float speed = 50.0f;

  public Ghost() {
    pos.x = 0;
    pos.y = 0;
    circleBounds.r = 0;

    setRadius(SpriteSize / 2);

    dir = new PVector(random(-1, 1), random(-1, 1));
    // force moving along x
    dir.x *= 2.0f;
    
    dir.normalize();
  }

  public void setRadius(float r) {
    if (r > 0) {
      circleBounds.r = r;
    }
  }

  public void update(float delta) {
    if (hasUpdated) {
      return;
    }
    hasUpdated = true;

    QuadTree.Node root = quadTree.getRoot();

    pos.x += dir.x * delta * speed;
    pos.y += dir.y * delta * speed;

    if (pos.x + circleBounds.r >= root.w && dir.x > 0) {
      dir.x *= -1;
    }

    else if (pos.x - circleBounds.r < root.x && dir.x < 0) {
      dir.x *= -1;
    }

    if (pos.y - circleBounds.r < root.y && dir.y < 0) {
      dir.y *= -1;
    }

    else if ( pos.y + circleBounds.r >= root.h && dir.y > 0) {
      dir.y *= -1;
    }

    circleBounds.x = pos.x;
    circleBounds.y = pos.y;
  }

  /*
   */
  public void draw() {
    renderCallCount++;

    if (renderCallCount < quadrantCount) {
      return;
    }

    pushMatrix();
    translate(pos.x, pos.y);

    if (dir.x < 0) {
      scale(-1, 1);
    }

    image(isIntersecting ? ghost2 : ghost1, 0, 0);

    // Outline circle is too expensive, just leave it out
    /*if (debugOn) {
     stroke(255, 0, 0);
     noFill();
     ellipse(0, 0, circleBounds.r*2, circleBounds.r*2);
     }*/
    popMatrix();

    // Draw number of nodes this sprite is inside
    //fill(255, 0, 0);
    //text(quadrantCount, pos.x, pos.y);
    clearStates();
  }
}

/*
 * Classes poll keyboard state to get state of keys.
 */
public static class Keyboard{
  
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
  
  /*
   *
   */
  public static void reset(){
    
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
final int KEY_ESC       = 27;

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

/*
 * Calling contains() is the slowest O(n) part of running time
 */
public class QuadTree {
  private PFont font;
  private Node root;
  private int depth;
  private boolean debugOn;
  private final int MAX_DEPTH = 5;
  private int numIntersectionsTests;

  public QuadTree() {
    font = createFont("arial", 10);
    root = null;
    depth = 0;
    debugOn = false;
    numIntersectionsTests = 0;
  }

  public int getDepth() {
    return depth;
  }

  public Node getRoot() {
    return root;
  }

  private class Node {
    int x, y, w, h;
    int level;

    boolean isLeaf;
    Node northEast, northWest, southEast, southWest;

    ArrayList <Sprite>sprites = new ArrayList<Sprite>();
    ArrayList toRemove = new ArrayList<Sprite>();

    Node parent;
    Rectangle rectangle;

    public Node(int x, int y, int w, int h, int level, Node p) {
      northEast = northWest = southEast = southWest = null;
      isLeaf = false;
      this.level = level;
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      rectangle = new Rectangle(x, y, w, h);
      parent = p;
    }

    /*
    */
    public void addSprite(Sprite s, boolean bubbleUp) {
      if (sprites.contains(s)) {
        return;
      }

      if (bubbleUp == true && parent != null) {
        parent.addSprite(s, true);
      }

      if (Utils.circleIntersectsRect(s.getCircleBounds(), rectangle)) {

        if (isLeaf) {
          sprites.add(s);
          s.increaseQuadrantCount();
        }
        else {
          northEast.addSprite(s, false);
          northWest.addSprite(s, false);
          southEast.addSprite(s, false);
          southWest.addSprite(s, false);
        }
      }
    }

    /*
     */
    public void drawDebugLines() {

      if (debugOn == false) {
        return;
      }

      // draw a rectangle around the canvas to make it
      // obvious we are dealing with 1 node.
      if (level == 1) {
        noFill();
        stroke(255);
        rect(0, 0, w - 1, h - 1);
      }

      // We are drawing the lines that show the children,
      // so if this actualy doesn't have children, it dosen't make sense to draw the lines.
      if (isLeaf == true) {
        fill(192);
        textFont(font);
        if (sprites.size() > 0) {
          text("" + sprites.size(), x + (w/2), y + (h/2));
        }
        return;
      }

      strokeWeight(depth - level); 

      int opacity = 255 - (level * (255 / MAX_DEPTH));
      stroke(255, opacity);
      line(x + (w/2), y, x + (w/2), y + h);  // verttical lines
      line(x, y + (h/2), x + w, y + (h/2));  // horizontal lines
    }

    public void clearStates() {
      if (isLeaf) {
        for (int i = 0; i < sprites.size(); i++) {
          sprites.get(i).clearStates();
        }
      }
      else {
        northEast.clearStates();
        northWest.clearStates();
        southWest.clearStates();
        southEast.clearStates();
      }
    }

    /*
     * Update the sprite positions
     * If a sprite starts to intersect a node, it means it
     * is either leaving its current node 
     * In that case, that sprite needs to be inserted into the adjacent nodes
     * moving updwards up the hierarchy if necessary.
     */
    public void update(float delta) {

      if (isLeaf) {

        Circle cb;
        Sprite s;
        for (int i = 0; i < sprites.size(); i++) {
          s = sprites.get(i);
          s.update(delta);
          cb = s.getCircleBounds();

          // If the sprite has left the node entirely
          if (Utils.circleInRect(cb, rectangle) == false && Utils.circleIntersectsRect(cb, rectangle) == false) {
            // prevent rare case exception when sprite tries to leave the root quadrant
            if (parent != null) {
              parent.addSprite(s, true);
            }
            toRemove.add(s);
            s.decreaseQuadrantCount();
          }
          else {
            //s.isIntersectingNode = true;
            if (parent != null)
              parent.addSprite(s, true);
          }
        }

        // Remove any necessary sprites
        for (int i = 0; i < toRemove.size(); i++) {
          sprites.remove(toRemove.get(i));
        }
        toRemove.clear();

        Sprite s1, s2;
        // Test sprite/sprite intersections
        for (int i = 0;  i < sprites.size(); i++) {
          for (int j = i + 1;  j < sprites.size(); j++) {
            s1 = sprites.get(i);
            s2 = sprites.get(j);
            numIntersectionsTests++;     

            if (Utils.circleIntersectsCircle(s1.getCircleBounds(), s2.getCircleBounds())) {
              s2.isIntersecting = true;
              s1.isIntersecting = true;
            }
          }
        }
      }
      else {
        northEast.update(delta);
        northWest.update(delta);
        southWest.update(delta);
        southEast.update(delta);
      }
    }

    /*
     * If this node is a leaf, find all the tiles that intersect with it and 
     * draw them. If this node is a parent, recursively the children.
     */
    public void draw() {
      for (int i = 0; i < sprites.size(); i++) {
        sprites.get(i).draw();
      }

      if (isLeaf == false) {
        southEast.draw();
        southEast.drawDebugLines();

        southWest.draw();
        southWest.drawDebugLines();

        northWest.draw();
        northWest.drawDebugLines();

        northEast.draw();
        northEast.drawDebugLines();
      }
    }

    /*
     * Change the number of levels the tree has.
     * If there is only a root node, that's 1 level, not zero.
     */
    public void setDepth(int d) {
      // if we're at a leaf node and depth is greater
      // than our current level,
      // we have to subdivide and insert

      // If we're at a leaf and we need to subdivide.
      if (isLeaf && d > level) {
        isLeaf = false;
        subdivide(d);

        if (sprites != null) {
          for (int i = 0; i < sprites.size(); i++) {
            Sprite s = sprites.get(i);
            s.decreaseQuadrantCount();
            northEast.addSprite(s, false);
            northWest.addSprite(s, false);
            southEast.addSprite(s, false);
            southWest.addSprite(s, false);
          }
          sprites.clear();
          clearStates();
        }
      }
      else if (isLeaf == false && d > level) {
        northEast.setDepth(d);
        northWest.setDepth(d);
        southEast.setDepth(d);
        southWest.setDepth(d);
        clearStates();
      }

      // First we need to find the node to merge
      else if (d <= depth) {
        // If the level of this node
        if ( d + 1 == level) { 
          merge();
        }
        else {
          northEast.setDepth(d);
          northWest.setDepth(d);
          southEast.setDepth(d);
          southWest.setDepth(d);

          isLeaf = true;
          northEast = northWest = southEast = southWest = null;
        }
      }
    }

    /*
     * Call this when we reduce the number of levels of the quadtree.
     * Place all thie children in the current node into the parent.
     */
    public void merge() {
      // Base case, place all the sprites into the parent
      if (isLeaf) {
        // If we're at a leaf node, we tell the parent
        // By setting the parent to a leaf node, calling add node
        // will not try to insert the sprites lower, back into this node
        //  parent.isLeaf = true;

        for (int i = 0; i < sprites.size(); i++) {
          Sprite s = sprites.get(i);
          s.decreaseQuadrantCount();
          // Don't call addSprite() since that's used to insert sprites DOWN into the tree.
          // If the sprite was in two child nodes we run the risk of adding it in twice.
          if (parent.sprites.contains(s) == false) {
            s.increaseQuadrantCount();
            parent.sprites.add(s);
          }
        }
        clearStates();

        sprites.clear();
        return;
      }

      isLeaf = true;
      northEast.merge();
      northWest.merge();
      southEast.merge();
      southWest.merge();

      //
      for (int i = 0; i < sprites.size(); i++) {
        Sprite s = sprites.get(i);
        s.decreaseQuadrantCount();
        // Don't call addSprite() since that's used to insert sprites down into the tree.
        // If the sprite was in two child nodes we run the risk of adding it in twice.
        if (parent.sprites.contains(s) == false) {
          s.increaseQuadrantCount();
          parent.sprites.add(s);
        }
      }
      clearStates();

      sprites.clear();
      northEast = northWest = southEast = southWest = null;
    }

    /*
     * Subdivide this node into 4 children.
     */
    public void subdivide(int d) {

      // If we reached the number of levels the user wanted, we
      // declare this node to be a leaf and back out.
      if (d == level) {
        isLeaf = true;
        depth = d;
        sprites = new ArrayList();
        toRemove = new ArrayList();
        return;
      }
      northEast = new Node(x + w/2, y, w/2, h/2, level + 1, this);
      northWest = new Node(x, y, w/2, h/2, level + 1, this);
      southWest = new Node(x, y + h/2, w/2, h/2, level + 1, this); 
      southEast = new Node(x + w/2, y + h/2, w/2, h/2, level + 1, this);

      northEast.subdivide(d);
      northWest.subdivide(d);
      southEast.subdivide(d);
      southWest.subdivide(d);
    }
  }

  /*
   */
  public void create(int w, int h, int d) {
    Utils.QTassert(d > 0, "Invalid Depth");
    root = new Node(0, 0, w, h, 1, null);
    root.subdivide(d);
  }

  /*
   * If debug is on, lines showing nodes will be rendered.
   */
  public void setDebug(boolean isOn) {
    debugOn = isOn;
  }

  public void addSprite(Sprite s) {
    addSprite(s, false);
  }

  private void addSprite(Sprite s, boolean bubble) {
    root.addSprite(s, bubble);
  }

  public int getNumIntersectionTests() {
    return numIntersectionsTests;
  }

  public void update(float delta) {
    numIntersectionsTests = 0;
    root.update(delta);
  }

  public void setDepth(int d) {
    // Ignore wacky values and safe work if the depth won't change.
    if (d < 0 || d > MAX_DEPTH || depth == d) {
      return;
    }

    root.setDepth(d);
    depth = d;
  }

  public void draw() {
    root.draw();
    root.drawDebugLines();
    postRender();
  }

  public void postRender() {
    root.clearStates();
  }
}

/*
 */
public class Sprite {
  protected int id;
  protected PVector pos;
  protected PVector dir;  
  protected Circle circleBounds;
  protected int spriteSize;

  public boolean hasUpdated;
  public int renderCallCount;
  public int quadrantCount;
  public boolean isIntersecting;
  public boolean isIntersectingNode;

  public Sprite() {
    id = Utils.getNextID();
    pos = new PVector();
    dir = new PVector();
    circleBounds = new Circle();
    clearStates();
  }

  public void increaseQuadrantCount() {
    quadrantCount++;
  }

  public void decreaseQuadrantCount() {
    quadrantCount--;
  }

  public void setPosition(PVector p) {
    pos = p;
  }

  public Circle getCircleBounds() {
    return circleBounds;
  }

  public int getID() {
    return id;
  }

  public void clearStates() {
    hasUpdated = false;
    renderCallCount = 0;

    isIntersecting = false;
    isIntersectingNode = false;
  }

  public void draw() {
  }

  public void update(float d) {
  }
}


/**
 * A ticker class to manage animation timing.
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

/*
 * 
 */
public class Rectangle {
  public float x, y, w, h;

  public Rectangle(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  public String toString() {
    return x + ", " + y + ", " + w + ", " + h;
  }
}

public class Circle {
  public float x, y;
  public float r;

  public String toString() {
    return "("+ x + ", " + y + ") rad=" + r;
  }
}

public static class Utils {
  private static int id = -1;
  private static PVector circleDistance = new PVector();
  private static float cornerDistance_sq;

  public static int getNextID() {
    return ++id;
  }

  /*
  Returns true if the circle is intersecting with one of the edges of the
   specified rectangle
   */
  public static boolean circleContainedInRect(Circle c, Rectangle r) {

    // test if circle is entirely contained in the rectangle
    boolean isContained =   
      (c.x > (r.x + c.r) && 
      c.x < (r.x + r.w - c.r) &&
      c.y > (r.y + c.r) &&
      c.y < (r.y + r.h - c.r));
    return isContained;
  }

  public static boolean circleInRect(Circle c, Rectangle r) {
    if (c.x - c.r > r.x && c.x + c.r < r.x + r.w && c.y - c.r > r.y && c.y + c.r < r.y + r.h) {
      return true;
    }
    return false;
  }

  public static boolean circleIntersectsRect(Circle c, Rectangle r) {
    circleDistance.x = abs(c.x - (r.x + r.w/2.0f));
    circleDistance.y = abs(c.y - (r.y+ r.h/2.0f));

    if (circleDistance.x > (r.w/2.0f + c.r)) { 
      return false;
    }
    if (circleDistance.y > (r.h/2.0f + c.r)) { 
      return false;
    }

    if (circleDistance.x <= (r.w/2.0f)) { 
      return true;
    } 
    if (circleDistance.y <= (r.h/2.0f)) { 
      return true;
    }

    cornerDistance_sq = 
      (circleDistance.x - r.w/2.0f) * (circleDistance.x - r.w/2.0f)    +
      (circleDistance.y - r.h/2.0f) * (circleDistance.y - r.h/2.0f);

    return (cornerDistance_sq <= (c.r*c.r));
  }

  /*
  */
  public static boolean isPointInRect(PVector p, Rectangle b) {
    if (p.x >= b.x && p.x <= b.x + b.w &&
      p.y >= b.y && p.y <= b.y + b.h) {
      return true;
    }
    return false;
  }

  public static boolean circleIntersectsCircle(Circle c1, Circle c2) {
    float x = c1.x - c2.x;
    float y = c1.y - c2.y;

    float len = sqrt(x*x + y*y);
    return len < (c1.r + c2.r);
  }

  public static void QTassert(boolean value, String str) {
    if (value == false) {
      println(str);
    }
  }
}



