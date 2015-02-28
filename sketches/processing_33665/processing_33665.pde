
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
  background(255, 204, 0);
   
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
     
    
    stroke(0);
    fill(230, 201, 42);
    
      
    leye.display();
    reye.display();
     
    popMatrix();
  }
}
 

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


