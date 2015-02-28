
/**
 * Monster Dance
 *
 * Assignment: 
 * Course: Interactive Digital Mdedia
 * Author: David Langly
 * Date: 
 *
 * Description: Group of monsters dancing to the beat
 * of the music.
 */

Monster m1;
Monster m2;
Monster m3;
Monster m4;

void setup() {
  size(500,500);
  strokeWeight(3);
  
  m1 = new Monster(150, 50);
  m2 = new Monster(40, 300);
  m3 = new Monster(300, 250);
  m4 = new Monster(350, 100);
}

void draw() {
  background(244,38,59);
  
  // Update each monster's pupils to follow cursor.
  m1.update(mouseX, mouseY);
  m2.update(mouseX, mouseY);
  m3.update(mouseX, mouseY);
  m4.update(mouseX, mouseY);
  
  // Display each monster with updated pupil position.
  m1.display();
  m2.display();
  m3.display();
  m4.display();
}

void mousePressed() {
  m1.mousePressed();
  m2.mousePressed();
  m3.mousePressed();
  m4.mousePressed();
}

void mouseDragged() {
  m1.mouseDragged();
  m2.mouseDragged();
  m3.mouseDragged();
  m4.mouseDragged();
}

void mouseReleased() {
  m1.mouseReleased();
  m2.mouseReleased();
  m3.mouseReleased();
  m4.mouseReleased();
}

/**
 * Monster.
 *
 * This class defines the blueprint for creating a monster
 * with a triangular head and two bulging eyes. The monster
 * is cool because its bulging eyes follow the mouse cursor
 * and grow with time. Moreover, the position of the monster
 * can be changed by clicking near the monster's eye and 
 * dragging with the mouse. The functionality to move the
 * monster was implemented based on the Mouse Functions
 * example application bundled with Processing.
 */
class Monster
{
  float monsterX;
  float monsterY;
  Eye leye;
  Eye reye;
  
  boolean bover = false;
  boolean locked = false;
  float bdifx = 0.0;
  float bdify = 0.0;
  
  Monster(int x, int y) {
    monsterX = x;
    monsterY = y;
    leye = new Eye(50, 50);
    reye = new Eye(150, 50);
  }
  
  void update(int mx, int my) {
    leye.update(mx-monsterX, my-monsterY);
    reye.update(mx-monsterX, my-monsterY);
    
    
    if (isInside(mx, my))
    {
      bover = true;
    }
    else
    {
      bover = false;
    }
  }
  
  boolean isInside(int mx, int my) {
    if (leye.isInside(mx-monsterX, my-monsterY))
    {
      return true;
    }
    if (reye.isInside(mx-monsterX, my-monsterY))
    {
      return true;
    }
    return false;
  }
  
  void mousePressed() {
    if (bover) 
    {
      locked = true;
    }
    else
    {
      locked = false;
    }  
    
    bdifx = mouseX-monsterX;
    bdify = mouseY-monsterY;
  }
  
  void mouseDragged() {
    if (locked) 
    {
      monsterX = mouseX-bdifx;
      monsterY = mouseY-bdify;
    }
  }
  
  void mouseReleased() {
    locked = false;
  }
  
  void display() {
    pushMatrix();
    translate(monsterX, monsterY);
    
    // draw all parts of the monster that is 
    // static, i.e. everything apart from the
    // eye. make sure all coordinates are
    // relative to the current location of
    // the monster.
    stroke(0);
    fill(230, 201, 42);
    triangle(0, 0, 200, 0, 100, 150);
     
    leye.display();
    reye.display();
    
    popMatrix();
  }
}

/**
 * Eye.
 * 
 * This class defines the blueprint for diplaying an eye whose
 * pupil follows the position of the mouse cursor. The original
 * idea and calculations were taken from the example application
 * "Arctangent" bundled with the Processing application. 
 *
 * The eye increases and decreases in size automatically as a
 * function of time. The initial size of an eye as well as the
 * rate at which the eye grows are both determined by using a
 * random number generator.
 */
class Eye 
{
  final static int MAX_EYE_SIZE = 100;
  final static int MIN_EYE_SIZE = 20;

  final static float MAX_EYE_VELOCITY = 0.2;
  final static float MIN_EYE_VELOCITY = -0.2;
  
  int ex, ey;
  float size;
  float velocity;
  float angle = 0.0;
  
  Eye(int x, int y) {
    ex = x;
    ey = y;    
    size = random(MIN_EYE_SIZE, MAX_EYE_SIZE);
    velocity = random(MIN_EYE_VELOCITY, MAX_EYE_VELOCITY);
  }
 
  boolean isInside(float mx, float my) {
   float distance = sqrt(sq(ex - mx) + sq(ey - my));
   if (distance <= size)
   {
     return true;
   }
   else
   {
     return false;
   }
  }
 
  void update(float mx, float my) {
    angle = atan2(my-ey, mx-ex);
    size += velocity;
    if (size > MAX_EYE_SIZE) {
      velocity = -velocity;
    }
    if (size < MIN_EYE_SIZE) {
      velocity = -velocity;  
    }
  }
  
  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    stroke(0);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}

