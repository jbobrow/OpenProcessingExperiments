
import sprites.utils.*;
import sprites.maths.*;
import sprites.*;

final int NBR_GHOSTS = 6;
final float TRAP_VEL = 100;
final int TRAP_STOPPED = 0;
final int TRAP_LEFT = -1;
final int TRAP_RIGHT = +1;

int nbr_dead = 0;

PImage bimg;

// Sprites
Sprite[] ghost = new Sprite[NBR_GHOSTS];
Sprite trap;
Sprite vortex;

// Current trap state
int trapState = TRAP_STOPPED;

StopWatch sw = new StopWatch();

public void setup() {
  size(700, 500);
  bimg = loadImage("haunted-house.jpg");
  // The trap
  trap = new Sprite(this, "trap.png", 4, 1, 50);
  trap.setXY(width/2, height - 30);
  trap.setVelXY(0.0f, 0);
  trap.setDomain(0, height-80, width, height, Sprite.HALT);
  // The ghost catching vortex
  vortex = new Sprite(this, "sparkler.png", 4, 1, 21);
  vortex.setXY(-10000, -10000);
  vortex.setFrameSequence(0, 3, 0.05f);
  vortex.setVisible(false);
  vortex.setVelXY(-20.0f, 0);
  // Create the ghosts
  for (int i = 0; i < NBR_GHOSTS; i++) {
    ghost[i] = new Sprite(this, "ghost2.png", "ghostmask2.png", 4, 1, 0);
    ghost[i].setDomain(-100, -60, width + 100, height - 100, Sprite.REBOUND);
  }
  initGhosts();

  registerMethod("pre", this);
  registerMethod("keyEvent", this);

  cursor(CROSS);
}

public void keyEvent(KeyEvent e) {
  if (key == CODED) {
    switch(keyCode) {
    case DOWN:
    case UP:
      trap.setVelX(0);
      trapState = TRAP_STOPPED;
      break;
    case LEFT:
      trap.setVelX(TRAP_LEFT * TRAP_VEL);
      trapState = TRAP_LEFT;
      break;
    case RIGHT:
      trap.setVelX(TRAP_RIGHT * TRAP_VEL);
      trapState = TRAP_LEFT;
      break;
    }
  }

  else {
    switch(e.getKeyCode()) {
    case ' ':    // spacebar
      if (!vortex.isOnScreem()) {
        vortex.setDead(false);
        vortex.setXY(trap.getX()+10, trap.getY() - vortex.getHeight()/2);
        vortex.setVelXY(0, -200);
        vortex.setAccXY(0, -300);
        vortex.setVisible(true);
        vortex.setFrameSequence(0, 3, 0.1f, 5);
        trap.setFrameSequence(0, 3, 0.1f, 1);  
        trapState = TRAP_STOPPED;
      }
      break;
    case 's':
    case 'S':
      trap.setVelX(0);
      trapState = TRAP_STOPPED;
      break;
    }
  }
}

void handleSpriteEvents(Sprite sprite) { 
  /* code */
}

void initGhosts() {
  float speed, angle;
  nbr_dead = 0;
  for (int i = 0; i < NBR_GHOSTS; i++) {
    ghost[i].setXY(random(50, width - 50), random(-20, height - 200));
    angle = ((int)random(0, 4)) * 45 + random(-20, 20);
    speed = random(40, 100);
    ghost[i].setSpeed(speed, angle);
    ghost[i].setAccXY(2, 2);
    ghost[i].setVisible(true);
    ghost[i].setDead(false);
    ghost[i].setFrameSequence(0, 3, 0.2f);
    System.out.print(ghost[i].getX() + "   " + ghost[i].getY() + "    ");
    System.out.println(ghost[i].getVelX() + "   " + ghost[i].getVelY());
  }
  System.out.println();
}

/*
 * See if the vortex has collided with a ghost
 * S4P provides 4 collision detection methods. 
 * The one used in this demo requires 60% overlap 
 * of the vortex sprite to get collision. If you change to 
 * bb_collision, cc_collision orpp_collision you get different
 * levels of collision sensitivity which affects game play.
 *
 */
void processCollisions() {
  if (vortex.isVisible()) {
    for (int g = 0; g < NBR_GHOSTS; g++) {
      if (!ghost[g].isDead() &&  vortex.oo_collision(ghost[g], 60)) {
        nbr_dead++;
        println(nbr_dead);
        vortex.setXY(-10000, -10000);
        ghost[g].setXY(10000, 10000);
        ghost[g].setVelXY(0, 0);
        ghost[g].setDead(true);
        vortex.setVisible(false);
        break;
      }
    }
  }
}

/*
 * Method provided by Processing and is called every 
 * loop before the draw method. It has to be activated
 * with the following statement in setup() <br>
 * <pre>registerMethod("pre", this);</pre>
 */
public void pre() {
  // Calculate time difference since last call
  float elapsedTime = (float) sw.getElapsedTime();
  processCollisions();
  if (nbr_dead == NBR_GHOSTS)
    initGhosts();
  S4P.updateSprites(elapsedTime);
}

public void draw() {
  background(bimg);
  S4P.drawSprites();
}

