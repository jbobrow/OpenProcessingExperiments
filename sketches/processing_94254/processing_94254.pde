
// Holi Splats

snow[] flake = new snow[1000];                            // Declare array of snow flakes
int rS = 11; int sS = 8;
boolean cleaner=true;
boolean textOn = false;


void setup() {                                            // Setup canvas and create 1000 flakes using for loop
 size(500,500);
 background(0);
 for (int i=0; i<1000; i++) {
     flake[i] = new snow(); 
 }
}

void draw() {                                             // Execute draw function of each flake
    if (cleaner) {fill(0,0,0,5); rect(-10,-10,520,520);}
    for (int i=0; i<1000; i++) {
     flake[i].drawSnow(); 
    }
    if (!textOn) {
    fill(0,0,0,255);
    rect(-10,375,250,120);
    fill(255,255,255,255);
    text("UP/DOWN - speed ["+rS+"]",20,400);
    text("LEFT/RIGHT - stroke size ["+sS+"]",20,420);
    text("0 - alpha cleaner rectangle ["+cleaner+"]",20,440);
    text("1 - clear background",20,460);
    text("2 - hide this text",20,480);
    }
    
}

class snow {                                              // Snow class
    PVector pos;                                          // Position (x,y)
    PVector speed;                                        // Speed (x,y)
    float bright;                                         // Alpha
    float r,g,b;

snow() {
    pos = new PVector(random(500),random(500));           // Construct flake with random parameters
    speed = new PVector(random(-rS,rS), random(-rS,rS));
    bright = random(255);
    r = random(255);
    b = random(255);
    g = random(255);
}

void drawSnow() {                                         // Draw flake
    strokeWeight(int(random(sS)));
    stroke(r,g,b,bright);                           // Set the alpha of the point
    point(pos.x, pos.y);                                  // Draw the actual flake!
    pos.add(speed);                                       // Add the speed vector
    speed.x = random(-rS,rS);                               // Randomize x speed again
    speed.y = random(-rS,rS);                               // Randomize y speed again
}

}

void keyPressed() {
 if (key == '0') {cleaner=!cleaner;}
 if (key == '2') {textOn = !textOn;}
 if (key == '1') {background(0);}
  if (key == CODED) {
  if (keyCode == UP) { rS++; }
  if (keyCode == DOWN) { if (rS>1) {rS--; }}
  if (keyCode == LEFT) { if (sS>1) { sS--; }}
  if (keyCode == RIGHT) { sS++; }
  }
}
   


