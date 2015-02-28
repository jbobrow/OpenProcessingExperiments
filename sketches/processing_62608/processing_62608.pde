
Disk [] Ghosts;

void setup() {
   size(600, 400);
   background(132, 144, 163);
   buildGhosts();
}

void draw() {
   for (int i=0; i<Ghosts.length; i++) {
      Ghosts[i].move();
      Ghosts[i].render();
   }
}

void buildGhosts() {
   Ghosts = new Disk[10];
   int border = 50;
   for (int i=0; i<Ghosts.length; i++) {
      float xPos = random(border, width-border);
      float yPos = random(border, height-border);
      float xDir = random(-8, 8);
      float yDir = random(-8, 8);
      float radius = random(10, 30);
      color clr = color(random(20, 255),
                        random(20, 255),
                        random(20, 255), 128);
      Ghosts[i] = new Disk(xPos, yPos, xDir, yDir, radius, clr);
   }
}

class Disk {
   float xPos;   // 1. Current location (X and Y)
   float yPos;  
   float xDir;   // 2. Current motion (X and Y)
   float yDir;
   float radius; // 3. Radius
   color clr;    // 4. Color

   Disk (float axPos, float ayPos, float axDir,  float ayDir,
   float aradius, color aclr) {
      xPos   = axPos;
      yPos   = ayPos;
      xDir   = axDir;
      yDir   = ayDir;
      radius = aradius;
      clr    = aclr;
   }
   
   void render() {
      fill(clr);
      ellipse(xPos, yPos, radius*2, radius*2);
   }
   
   void move() {
      xPos += xDir;
      if ((xPos < 0) || (xPos > width)) {
         xDir = -xDir;
      }
      yPos += yDir;
      if ((yPos < 0) || (yPos > height)) {
         yDir = -yDir;
      }
   }
}
