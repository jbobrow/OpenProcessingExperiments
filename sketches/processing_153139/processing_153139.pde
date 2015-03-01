
/*
 * Creative Coding
 * 
 * Challenge was to shift a single spinner to a group by using an array
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * Source sketch written by Indae Hwang and Jon McCormack
 * 
 */

float x, y;      // current drawing position
float dx, dy;    // change in position at each frame
float rad;       // radius for the moving hand

int edge = 150;

int nrTops = 24; // number of spinning tops
PVector[] location = new PVector[nrTops];
PVector[] velocity = new PVector[nrTops];
int[] direction = new int[nrTops];

void setup() {
  size(800, 450);

  // initial position in the centre of the screen
  //  x = width/2;
  // y = height/2;
 
 //randomized starting point for the array of tops
 for (int i=0; i<nrTops; i++) {
   float x = random(edge, width-edge);
   float y = random(edge, height-edge);
   location[i] = new PVector (x,y);
   
  // dx and dy are the small change in position each frame
  dx = random(-1, 1);
  dy = random(-1, 1);
  velocity[i] = new PVector (dx, dy);
  //clockwise or counterclockwise
  float r = random (1);
  direction[i] = r>0.5 ? 1 : -1;
 }
  background(0,14,255);
  frameRate(24);
}

void draw() {
  // blend the old frames into the background
 // blendMode(BLEND);
  fill(71, 75, 152, 5);
  rect(0, 0, width, height);
  rad = radians(frameCount);

  // calculate new position
  //x += dx;
  //y += dy;

  //float max = 3;
  //float min = 0.8;

     //add one velocity unit to the current location of the anchor
  for (int i=0; i<location.length; i++){
    location[i].add(velocity[i]);
    float max = 1;
    float min = 0.5;

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (location[i].x > width-edge || location[i].x < edge) {
      velocity[i].x = velocity[i].x > 0 ? -random(min, max) : random(min, max);
    }
 
    if (location[i].y > height-edge || location[i].y < edge) {
      velocity[i].y = velocity[i].y > 0 ? -random(min, max) : random(min, max);
    }
 
  //float bx = x + 100 * sin(rad);
  //float by = y + 100 * cos(rad);
  
  float bx = location[i].x + 100 * sin(rad)*direction[i];
  float by = location[i].y + 100 * cos(rad)*direction[i];
  
  fill(70, 70, 227, 125);

  float radius = 100 * sin(rad*0.1);
  float handX = bx + radius * sin(rad*3)*direction[i];
  float handY = by + radius * cos(rad*3)*direction[i];

  stroke(162, 162, 232, 150);
  line(bx, by, handX, handY);
  ellipse(handX, handY, 2, 2);
  
  }
}

