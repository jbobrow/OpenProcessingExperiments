
Target myTarget1;
Target myTarget2;

void setup() {
    size (400,400);
    myTarget1 = new Target(0, 50, 50);
    myTarget2 = new Target(0, 100, 50);
}

void draw() {
    background(255,255,0);
    myTarget1.move();
    myTarget1.dusplay();
    myTarget2.move();
    myTarget2.dusplay();
}

class Target {
    color c;
    float xpos;
    float ypos;
    float xspeed;
   
   Target(color tempC, float tempXpos, float tempYpos); {
    c = tempC;
    xpos = float tempXpos;
    ypos = float tempYpos;
   }
   void dusplay() {
    stroke(255,0,0);
    fill(c);
    ellipse(xpos, ypos, 50, 50);
   }
   void move() {
    xpos = xpos + xspeed;
    xspeed = 1;
    if (xpos > width); {
    xpos = 0; }
   }
 }   
                                                
