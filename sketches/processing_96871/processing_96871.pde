
/* Author:      Mirinda Kulsrisuwan (420082165)
 * Date:        1/4/2013
 * Desciption:  Running class, including sketch environment setup and drawing function. In addition, Create particle function is
 *              also implemented. It randome create origin of firework particle and smoke particle every 50 frames, and it will
 *              remove particle when it die by check though exist function.
 */

int MAX_SMOKE = 40;                                                 // Declare constant for number of smoke particle

ArrayList <CircleParticle> cp = new ArrayList <CircleParticle>();   // Arraylist for circle particle
ArrayList <SmokeParticle> sp = new ArrayList <SmokeParticle>();     // Arraylist for smoke particle

/* Setup sketch
 */
void setup() { 
  background (0);                                                   // Set background color = black
  size (900, 700);                                                  // Set size 900x700
  colorMode(RGB, 255, 255, 255, 255);
}

/* Draw sketch
 */
void draw () {
  fill(0, 20);                                                      // Set fill color = black and alpha = 20
  rect (0, 0, width, height);                                       // Draw rectangle size equal sketch's size

  if (frameCount % 50 == 0) {                                       // Every 50 frame create new firework
    createOrigin(new PVector(random(50, width-50), random(50, height-50)));  // Call create particle function with random position
  }

  for (int i = cp.size()-1; i >= 0; i--) {                          // Travel on circle arraylist from tail to head
    CircleParticle circlepart = (CircleParticle) cp.get(i);         // Get current object from arraylist
    circlepart.update();                                            // Update particle possition
    circlepart.display();                                           // Draw particle on screen
    if (!circlepart.exist()) {                                      // Check current particle, remove it if it's die
      cp.remove(i);
    }
  }

  for (int i = sp.size()-1; i >= 0; i--) {                          // Travel on smoke arraylist from tail to head
    SmokeParticle smokepart = (SmokeParticle) sp.get(i);            // Get current object from arraylist
    smokepart.update ();                                            // Update particle possition
    smokepart.display();                                            // Draw particle on screen
    if (!smokepart.exist()) {                                       // Check current particle, remove it if it's die
      sp.remove(i);
    }
  }
}

/* Create partiocle function
 *
 * parameter:  PVector, origin of each particle group
 */
void createOrigin (PVector origin) {
  float velocX = int(random(1, 3));                                 // Random x-axis value for velocity
  float velocY = int(random(2, 5));                                 // Random y-axis value for velocity
  float accel = random(0.01, 0.03);                                 // Random accelelator value for velocity
  float startColor = random(0, 200);                                // Random Hue starting color value for velocity

  int firework_node = int(random(15, 25));                          // Random number of firework particle node

  for (int i=0; i<firework_node; i++) {                             // For each firework particle node, add circle particle object to arraylist
    cp.add (new CircleParticle (new PVector (origin.x, origin.y), -velocX, velocX, -velocY, 0f, accel, 10, startColor));
  }

  for (int i=0; i<MAX_SMOKE; i++) {                                 // For each smoke particle node, add smoke particle object to arraylist
    float org = random(-5, 5);                                      // Random origin adjust value for smoke
    sp.add (new SmokeParticle (new PVector (origin.x+org, origin.y+(org*2)), 5));
  }
}


