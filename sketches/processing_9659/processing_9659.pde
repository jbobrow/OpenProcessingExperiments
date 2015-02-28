
Monster m1;
Monster m2;
Monster m3;

void setup() {
  size(500,500);
  strokeWeight(3);
  
  m1 = new Monster(10, 20);
  m2 = new Monster(175, 50);
  m3 = new Monster(150, 400);
}

void draw() {
  
  // Update each monster's pupils to follow cursor.
  m1.update(mouseX, mouseY);
  m2.update(mouseX, mouseY);
  m3.update(mouseX, mouseY);
  
  // Display each monster with updated pupil position.
  m1.display();
  m2.display();
  m3.display();
  
/*
  // Paint background
  background(209,255,255);
  fill(255,234,0);
  
  // Paint monster's head
  triangle(50,50,250,50,150,200);
  fill(0,93,42);
  
  // Paint monster's mouth
  smooth();
  ellipse(135,135,32,16);
  fill(255,255,255);
  
  // Paint monster's fangs
  triangle(130,131,132,162,136,135);
  triangle(136,131,138,162,142,135);
  
  // Paint monster's left eye
  ellipse(95,80,16,30);   
  fill(0);
  ellipse(95,80,8,15);
  
  // Paint monste's right eye
  ellipse(180,80,16,30);
  fill(255,255,255);
  ellipse(180,80,8,15);
  
  // Paint monster's legs
  line(154,196,158,245);
  line(146,196,142,245);
  
  // Paint monster's ears
  ellipse(50,50,5,5);
  ellipse(250,50,5,5); 
*/
}

class Monster
{
  int mx;
  int my;
  Eye leye;
  Eye reye;
  
  Monster(int x, int y) {
    mx = x;
    my = y;
    leye = new Eye(50, 50, 100);
    reye = new Eye(150, 50, 50);
  }
  
  void update(int mx, int my) {
    leye.update(mx, my);
    reye.update(mx, my);
  }
  
  void display() {
    pushMatrix();
    translate(mx, my);
    
    // draw all parts of the monster that is 
    // static, i.e. everything apart from the
    // eye. make sure all coordinates are
    // relative to the current location of
    // the monster.
     triangle(0,0,200,0,100,150);
     fill(0,93,42);
  
    
    leye.display();
    reye.display();
    
    popMatrix();
  }
}

class Eye 
{
  int ex, ey;
  int size;
  float angle = 0.0;
  
  Eye(int x, int y, int s) {
    ex = x;
    ey = y;
    size = s;
 }

  void update(int mx, int my) {
    angle = atan2(my-ey, mx-ex);
  }
  
  void display() {
    pushMatrix();
    translate(ex, ey);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}

