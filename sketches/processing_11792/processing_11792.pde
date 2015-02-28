
abstract class Activity {
  boolean active;
  float x;
  float y;
  float w;
  float h;

  abstract void update();
}


interface Drawable {
  void draw();
}


interface Collidable {
  boolean intersects(Rectangle2D r);
}


abstract class DrawableActivity extends Activity implements Drawable {
  abstract void draw();
}  


abstract class Mobile extends DrawableActivity implements Collidable {
  PImage[] images;
  Geometry[] geometries;
  float frame;

  abstract void update();

  void draw() {
    if (active) {
      image(images[(int) frame], x, y, w, h);
    }
  }

  Rectangle2D boundingRect() {
    return new Rectangle2D.Float(x, y, w, h);
  }

  boolean intersects(Rectangle2D r) {
    Rectangle2D b = boundingRect();
    return b.intersects(r) && geometry().intersects(r, x, y);
  }

  Geometry geometry() {
    return geometries[(int) frame];
  }

  boolean intersects(Mobile other) {
    Rectangle2D b = boundingRect();
    if (!b.intersects(other.boundingRect())) {
      return false;
    }
    Geometry g = geometry();
    return g.intersects(x, y, other.geometry(), other.x, other.y);
  }
}


class Animation {
  final float NOT_STARTED = -1;
  PImage[] frames;
  float duration;
  float startTime;
  float frame;
  
  Animation(PImage[] frames, float duration) {
    this.frames = frames;
    this.duration = duration;
    this.startTime = NOT_STARTED;
  }
  
  // When the caller asks for an animation to play then the animation
  // starts playing.
  void play() {
    this.startTime = now;
  }

  boolean isStarted() {
    return now >= startTime;
  }
  
  boolean isFinished() {
    return now >= startTime + duration;
  }
  
  // When the caller asks for an animation to update then it sets its frame
  // according to the current time.  
  void update() {
    if (!isStarted()) return;
    if (isFinished()) return;
    float elapsed = now - startTime;
    frame = (elapsed / duration) * frames.length;
    frame = min(frame, frames.length - 1);
  }
  
  void draw(float x, float y, float w, float h) {
    image(frames[(int) frame], x, y, w, h);
  }
}

class Robot extends Mobile {
  Animation animation;
  Animation imagesLeft;
  Animation imagesRight;
  Animation imagesScanning;
  Animation imagesUp;
  Animation imagesDown;
  Geometry[] geometriesLeft;
  Geometry[] geometriesRight;
  Geometry[] geometriesScanning;
  Geometry[] geometriesUp;
  Geometry[] geometriesDown;
  float spawnX;
  float spawnY;
  Player player;
  Maze maze;
  ShotCreator shotCreator;
  float distance;
  int ticker;
  final int INITIAL_RATE = 60;
  final float WALKING_ANIMATION_SPEED = 300;
  final float WALKING_SPEED = 2;
  final float ROOT_TWO = sqrt(2);
  float dx;
  float dy;

  Robot() {
    this.active = true;
    this.w = ROBOT_WIDTH;
    this.h = ROBOT_HEIGHT;
    this.distance = max(w, h);
    this.x = 0;
    this.y = 0;
    this.spawnX = 0;
    this.spawnY = 0;
    imagesLeft = new Animation(
      new PImage[] {
        robotLeftImg01,
        robotLeftImg02,
        robotLeftImg03,
        },
      WALKING_ANIMATION_SPEED
      );
    imagesRight = new Animation(
      new PImage[] {
        robotRightImg01,
        robotRightImg02,
        robotRightImg03,
        },
      WALKING_ANIMATION_SPEED
      );
    imagesScanning = new Animation(
      new PImage[] {
        robotScanImg01,
        robotScanImg02,
        robotScanImg03,
        robotScanImg02,
        },
      WALKING_ANIMATION_SPEED
       );
    imagesUp = new Animation(
      new PImage[] {
        robotStraightImg01,
        robotStraightImg02,
        robotStraightImg03,
        robotStraightImg04
        },
      WALKING_ANIMATION_SPEED
        );
    imagesDown = new Animation(
      new PImage[] {
        robotStraightImg04,
        robotStraightImg03,
        robotStraightImg02,
        robotStraightImg01
        },
      WALKING_ANIMATION_SPEED
        );        
    animation = imagesScanning;
    animation.play();
    geometriesLeft = new Geometry[] {
      robotLeftGeo01,
      robotLeftGeo02,
      robotLeftGeo03,
    };
    geometriesRight = new Geometry[] {
      robotRightGeo01,
      robotRightGeo02,
      robotRightGeo03,
    };
    geometriesScanning = new Geometry[] {
      robotScanGeo01,
      robotScanGeo02,
      robotScanGeo03,
      robotScanGeo02,
    };
    geometriesUp = new Geometry[] {
      robotStraightGeo01,
      robotStraightGeo02,
      robotStraightGeo03,
      robotStraightGeo04,
    };
    geometriesDown = new Geometry[] {
      robotStraightGeo04,
      robotStraightGeo03,
      robotStraightGeo02,
      robotStraightGeo01,
    };
    geometries = geometriesScanning;
    this.frame = 0;
    this.ticker = INITIAL_RATE;
  }

  void update() {
    if (ticker > 0) {
      if (animation != imagesScanning) {
        animation = imagesScanning;
        geometries = geometriesScanning;
      }
      ticker--;
    }
    else if (animation.isFinished()) {
      moveRobot();
      setAnimationByFacing();
      checkFiring();
    }
    updateAnimation();
  }
  
  void updateAnimation() {
    if (!animation.isStarted() || animation.isFinished()) {
      animation.play();
    }
    animation.update();
    frame = animation.frame;
  }

  void moveRobot() {
    dx = (player.x + player.w/2) - (x + w/2);
    dy = (player.y + player.h/2) - (y + h/2);
    dx = abs(dx) >= 2 ? sign(dx) : 0;
    dy = abs(dy) >= 2 ? sign(dy) : 0;
    float ax = 0.0;
    float ay = 0.0;
    if (!wouldHitWall(dx, dy)) {
      ax = dx;
      ay = dy;
    }
    else if (dx != 0 && !wouldHitWall(dx, 0)) {
      ax = dx;
    }
    else if (dy != 0 && !wouldHitWall(0, dy)) {
      ay = dy;
    }
    dx = ax * WALKING_SPEED;
    dy = ay * WALKING_SPEED;
    x += dx;
    y += dy;
  }
  
  void setAnimationByFacing() {
    if (dx == 0 && dy == 0) {
      animation = imagesScanning;
      geometries = geometriesScanning;
    }
    else if (dx > 0) {
      animation = imagesRight;
      geometries = geometriesRight;
      animation.duration = (dy != 0) ? WALKING_ANIMATION_SPEED * ROOT_TWO : WALKING_ANIMATION_SPEED;
    }
    else if (dx < 0) {
      animation = imagesLeft;
      geometries = geometriesLeft;
      animation.duration = (dy != 0) ? WALKING_ANIMATION_SPEED * ROOT_TWO : WALKING_ANIMATION_SPEED;
    }
    else if (dy < 0) {
      animation = imagesUp;
      geometries = geometriesUp;
    }
    else {
      animation = imagesDown;
      geometries = geometriesDown;
    }
  }
  
  void checkFiring() {
    if (random(256) < 128) {
      float robotX = x + w/2;
      float robotY = y + h/2;
      float playerX = player.x + player.w/2;
      float playerY = player.y + player.h/2;
      if (hasLineOfSight(maze.walls, robotX, robotY, playerX, playerY)) {
        shotCreator.createShot(this, robotX, robotY, playerX, playerY);
      }
    }
  }
  
  void draw() {
    if (active) {
      animation.draw(x, y, w, h);
    }
  }
  
  float sign(float n) {
    if (n > 0) return 1.0;
    if (n < 0) return -1.0;
    return 0.0;
  }

  boolean wouldHitWall(float dx, float dy) {
    float x1 = x + w/2;
    float y1 = y + h/2;
    float x2 = x1 + dx * distance;
    float y2 = y1 + dy * distance;
    Rectangle2D target = new Rectangle2D.Float();
    for (Iterator it = maze.walls.iterator(); it.hasNext(); ) {
      Rectangle2D r = (Rectangle2D) it.next();
      extendRect(r, target);
      if (target.intersectsLine(x1, y1, x2, y2)) {
        return true;
      }
    }
    return false;
  }

  void extendRect(Rectangle2D r, Rectangle2D target) {      
    float MAGIC = distance/2;
    if (r.getWidth() > r.getHeight()) {
      target.setRect(r.getX() - MAGIC, r.getY(), r.getWidth() + 2 * MAGIC, r.getHeight());
    }
    else {
      target.setRect(r.getX(), r.getY() - MAGIC, r.getWidth(), r.getHeight() + 2 * MAGIC);
    }
  }
}


class Nemesis extends Mobile {
  int ticker;
  final int RATE = 120;
  final float BOUNCE_HEIGHT = 2.0;
  Player player;
  float t;
  float speed;
  int alertCounter;
  boolean isDisabled;

  Nemesis() {
    this.active = false;
    this.ticker = 0;
    this.images = new PImage[] {
      nemesisImg,
    };
    this.geometries = new Geometry[] {
      nemesisGeometry,
    };
    this.w = NEMESIS_WIDTH;
    this.h = NEMESIS_HEIGHT;
    this.speed = NEMESIS_SPEED;
  }

  void setTicker(int n) {
    this.ticker = n;
    setAlertCounter();
  }

  void setAlertCounter() {
    alertCounter = max(20, ticker / 4);
  }

  void update() {
    if (isDisabled) return;
    if (ticker > 0) {
      if (--ticker == 0) {
        active = true;
        t = 0;
        nemesisAlertSample.trigger();
        intruderAlertSample.trigger();
        sampleCutoffTime = intruderAlertSample.length() + millis();
      }
      else {
        if (ticker % alertCounter == 0) {
          setAlertCounter();
          nemesisCountdownSample.trigger();
        }
      }
    }
    if (!active) return;
    float dx = player.x - x;
    float dy = player.y - y;
    float angle = atan2(dy, dx);
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    if (sin(t) > 0) {
      y += 2;
    }
    else {
      y -= 2;
    }
    t += 0.2;
  }
}


class Player extends Mobile {
  final float speed = PLAYER_SPEED;

  Player() {
    this.active = true;
    this.w = PLAYER_WIDTH;
    this.h = PLAYER_HEIGHT;
    this.x = 0;
    this.y = 0;
    this.images = new PImage[] {
      playerImg1,
      playerImg2
    };
    this.geometries = new Geometry[] {
      playerGeometry1,
      playerGeometry2
    };
    this.frame = 0;
  }

  void update() {
    if (!active) return;
    float dx = 0;
    float dy = 0;
    if (controller.leftDown())  dx--;
    if (controller.rightDown()) dx++;
    if (controller.upDown())    dy--;
    if (controller.downDown())  dy++;
    if (dx != 0 || dy != 0) {
      float angle = atan2(dy, dx);
      x += cos(angle) * speed;
      y += sin(angle) * speed;
      frame = (frame + 1/6.0) % images.length;
    }
    else {
      frame = 0;
    }
  }
}


class AbstractShot extends Mobile {
  float speed;
  float dx;
  float dy;
  Maze maze;
  float oldX;
  float oldY;

  void update() {
    if (!active) return;
    oldX = x;
    oldY = y;
    float angle = atan2(dy, dx);
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    active = (x < maze.right() && y < maze.bottom() && x + w >= maze.left() && y + h >= maze.top());
  }
};


class PlayerShot extends AbstractShot {
  PlayerShot() {
    speed = PLAYER_SHOT_SPEED / SHOT_ITERATIONS;
    this.active = false;
    this.w = PLAYER_SHOT_WIDTH;
    this.h = PLAYER_SHOT_HEIGHT;
    this.x = 0;
    this.y = 0;
    this.images = new PImage[] {
      shotImg1,
    };
    this.geometries = new Geometry[] {
      shotGeometry1,
    };
    this.frame = 0;
    this.dx = 0;
    this.dy = 0;
  }
}


class RobotShot extends AbstractShot {
  Robot owner;

  RobotShot(Robot owner, float x, float y, float targetX, float targetY, float speed) {
    this.owner = owner;
    this.speed = speed / SHOT_ITERATIONS;
    this.active = false;
    this.w = ROBOT_SHOT_WIDTH;
    this.h = ROBOT_SHOT_HEIGHT;
    this.x = x - w/2;
    this.y = y - h/2;
    float angle = atan2(targetY - y, targetX - x);
    dx = cos(angle);
    dy = sin(angle);
    this.images = new PImage[] {
      robotShotImg1,
    };
    this.geometries = new Geometry[] {
      robotShotGeometry1,
    };
    this.frame = 0;
    active = true;
  }
}


class Particle extends DrawableActivity {
  final float MIN_SPEED = 0.5f;
  final float MAX_SPEED = 1.0f;
  final float BOUNCE = 0.65f;
  final float DECAY = 0.95;
  final List walls;
  color c;
  float alph;
  float dx;
  float dy;
  float oldX;
  float oldY;
  
  Particle(List walls, float x, float y, color c) {
    this.walls = walls;
    this.x = x - w/2;
    this.y = y - h/2;
    this.w = PARTICLE_WIDTH;
    this.h = PARTICLE_HEIGHT;
    this.c = c;
    this.alph = 255;
    this.active = true;
    float direction = random(-PI, PI);
    float speed = random(MIN_SPEED, MAX_SPEED);
    dx = cos(direction) * speed;
    dy = sin(direction) * speed;
  }
  
  Particle(List walls, float x, float y) {
    this(walls, x, y, color(255, 255, 0));
  }
  
  void update() {
    oldX = x;
    oldY = y;
    x += dx;
    y += dy;
    checkWalls();
    alph *= DECAY;
    active = active && alph > 8;
  }
  
  void checkWalls() {
    for (Iterator it = walls.iterator(); it.hasNext(); ) {
      Rectangle2D wall = (Rectangle2D) it.next();
      if (checkWall(wall)) {
        break;
      }
    }
  }
  
  boolean checkWall(Rectangle2D wall) {
    Rectangle2D previous = new Rectangle2D.Float(oldX, oldY, w, h);
    Rectangle2D current = new Rectangle2D.Float(x, y, w, h);
    Rectangle2D bounds = previous.createUnion(current);
    if (bounds.intersects(wall)) {
      if (wall.getWidth() > wall.getHeight()) {
        dy = -dy;
        y += dy;
      }
      else {
        dx = -dx;
        x += dx;
      }
      dx *= BOUNCE;
      dy *= BOUNCE;
      alph *= BOUNCE;
      return true;
    }
    return false;
  }

  void draw() {
    noStroke();
    fill(c, alph);
    rect(x, y, w, h);
  }
}


