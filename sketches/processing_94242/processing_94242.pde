
// Snow Pattern

snow[] flake = new snow[1000];                            // Declare array of snow flakes

void setup() {                                            // Setup canvas and create 1000 flakes using for loop
 size(500,500);
 background(0);
 for (int i=0; i<1000; i++) {
     flake[i] = new snow(); 
 }
}

void draw() {                                             // Execute draw function of each flake
    for (int i=0; i<1000; i++) {
     flake[i].drawSnow(); 
    }
}

class snow {                                              // Snow class
    PVector pos;                                          // Position (x,y)
    PVector speed;                                        // Speed (x,y)
    float bright;                                         // Alpha

snow() {
    pos = new PVector(random(500),random(500));           // Construct flake with random parameters
    speed = new PVector(random(-2,2), random(-2,2));
    bright = random(255);
}

void drawSnow() {                                         // Draw flake
    stroke(255,255,255,bright);                           // Set the alpha of the point
    point(pos.x, pos.y);                                  // Draw the actual flake!
    pos.add(speed);                                       // Add the speed vector
    speed.x = random(-2,2);                               // Randomize x speed again
    speed.y = random(-2,2);                               // Randomize y speed again
}

}


