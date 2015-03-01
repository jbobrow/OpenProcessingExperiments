
/*
  @pjs preload="node.png";
 */

/*
 Andor Salga
 Follow  
 */
 
final float Speed = 50.0f;

PImage img;
final int numSprites = 2;
Timer timer;

int movementIndex = 0;
ArrayList<Movement> movements;
ArrayList<Sprite> sprites;
Sprite leader;

class Sprite {
  PVector position;
  PVector acceleration;
  PVector velocity;
  PVector dir;

  boolean visible;

  Sprite leader;
  Movement movement;

  Sprite() {
    position = new PVector();
    acceleration = new PVector();
    velocity = new PVector();
    dir = new PVector();

    leader = null;
    visible = true;
    movement = null;
  }

  void follow(Sprite l) {
    leader = l;
  }

  void setMovement(Movement m ) {
    movement = m;
  }

  void setVisible(boolean v) {
    visible = v;
  }

  void setPosition(PVector p) {
    position.set(p.x, p.y);
  }

  PVector getPosition() {
    return position;
  }

  void render() {
    if (visible == false) {
      return;
    }

    fill(255, 0, 0);

    pushMatrix();
    translate(position.x, position.y);

    if (leader != null) {
      rotate( atan2((leader.position.y-position.y), (leader.position.x-position.x) ));
    }

    image(img, 0, 0);
    noFill();

    popMatrix();
  }

  void update(float dt) {
    if (movement != null) {
      movement.update(dt);
      position = movement.getPosition();
    }
    else if (leader != null) {
      dir.x = (leader.position.x - position.x);
      dir.y = (leader.position.y - position.y );
      dir.normalize();
      
      velocity.add(dir);
      velocity.mult(dt * Speed);
      limit(velocity, 3.0);

      position.add(velocity);
    }
  }
}

//
// Movement
class Movement {
  PVector position;

  Movement() {
    position = new PVector();
  }

  PVector getPosition() {
    return position;
  }

  void update(float dt) {
  }
}

//
// BounceOffWallsMovement
class BounceOffWallsMovement extends Movement {
  PVector velocity;

  BounceOffWallsMovement() {
    velocity = getRandomVector();
    // no random2D :(
    velocity.mult(4);
  }

  void setStartPosition(PVector pos) {
    position.set(pos.x, pos.y);
  }

  void update(float dt) {
    position.add(velocity);
    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    }
    else if (position.x < 0) {
      position.x = 0;
      velocity.x *= -1;
    }
    else if (position.y > height) {
      position.y = height;
      velocity.y *= -1;
    }
    else if (position.y < 0) {
      position.y = 0;
      velocity.y *= -1;
    }
  }
}

// 
// NoiseMovement
class NoiseMovement extends Movement {
  PVector dir = new PVector(1, 0);

  void update(float dt) {
    position.x += (dir.x * 5);

    if (position.x > width) {
      position.x = width;
      dir.x *= -1;
    }
    else if (position.x < 0) {
      position.x = 0;
      dir.x *= -1;
    }

    position.y = map(noise(frameCount/80.0f), -1, 1, -height, height);
  }
}

//
// CircularMovement
class CircularMovement extends Movement {
  void update(float dt) {
    position.set(width/2 + cos(frameCount/30.0) * width/4, height/2 + sin(frameCount/30.0) * height/4);
  }
}

//
// CursorMovment
class CursorMovment extends Movement {
  void update(float dt) {
    position.set(mouseX, mouseY);
  }
}

//
// Figure8Movement
class Figure8Movement extends Movement {
  void update(float dt) {
    position.x = width/2 + cos(frameCount/30.0) * 120;
    position.y = height/2 + sin(frameCount/15.0) * 50;
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


void setup() {
  size(400, 400);
  rectMode(CENTER);
  imageMode(CENTER);
  noSmooth();
  noStroke();
  timer = new Timer();

  img = loadImage("node.png");

  movements = new ArrayList<Movement>();
  movements.add(new CircularMovement());
  movements.add(new Figure8Movement()); 
  movements.add(new CursorMovment());
  movements.add(new NoiseMovement());
  movements.add(new BounceOffWallsMovement());

  sprites = new ArrayList<Sprite>();
  leader = new Sprite();
  leader.visible = false;

  for (int i = 0; i < numSprites; i++) {
    sprites.add(new Sprite());
  }

  for (int i = sprites.size()-1; i >= 1; i--) {
    sprites.get(i).follow(sprites.get(i-1));
  }

  // first sprite follows the leader, then the rest follow each other
  sprites.get(0).follow(leader);

  leader.setMovement(movements.get(0));
}

void draw() {
  fill(0, 128);
  rect(width/2, height/2, width, height);

  timer.tick();
  float d = timer.getDeltaSec();

  leader.update(d);
  leader.render();

  for (int i = sprites.size()-1; i >= 0; i--) {
    Sprite s = sprites.get(i);
    s.update(d);
    s.render();
  }
}

void mousePressed() {
  // TODO: fix adding a sprite while doing random movement
  if (movementIndex != sprites.size()-1) {
    Sprite s = new Sprite();
    s.setPosition(new PVector(width/2, -10)); 
    s.follow(sprites.get(sprites.size()-1));
    sprites.add(s);
  }
}

void keyPressed() {
  movementIndex++;
  movementIndex %= movements.size();

  if (movementIndex == movements.size()-1) {
    for (int i = 0; i < sprites.size(); i++) {
      Sprite s = sprites.get(i);
      BounceOffWallsMovement movement = new BounceOffWallsMovement();
      movement.setStartPosition(s.getPosition());
      sprites.get(i).setMovement(movement);
    }
  }
  else {
    for (int i = 0; i < sprites.size(); i++) {
      sprites.get(i).setMovement(null);
    }

    for (int i = sprites.size() - 1; i > 0; i--) {
      sprites.get(i).follow(sprites.get(i-1));
    }
    leader.setMovement(movements.get(movementIndex));
    // first sprite follows the leader, then the rest follow each other
    sprites.get(0).follow(leader);
  }
}

void limit(PVector v, float limit) {
  if (v.mag() > limit) {
    v.normalize();
    v.mult(limit);
  }
}

PVector getRandomVector() {
  PVector v = new PVector(random(-1, 1), random(-1, 1));
  v.normalize();
  return v;
}

