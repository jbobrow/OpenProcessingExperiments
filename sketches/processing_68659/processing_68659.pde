
float theta;   

void setup() {
  size(640, 360);
  smooth();
}

void draw() {
  background(0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-120);
  // Move to the end of that line
  translate(0,-120);
  // Start the recursive branching!
  branch(120);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}

















int sx, sy; 
float density = 0.5; 
int[][][] world;
 
void setup() 
{ 
  size(640, 200, P2D);
  frameRate(12);
  sx = width;
  sy = height;
  world = new int[sx][sy][2]; 
   
  // Set random cells to 'on' 
  for (int i = 0; i < sx * sy * density; i++) { 
    world[(int)random(sx)][(int)random(sy)][1] = 1; 
  } 
} 
 
void draw() 
{ 
  background(0); 
  
  // Drawing and update cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      //if (world[x][y][1] == 1) 
      // Change recommended by The.Lucky.Mutt
      if ((world[x][y][1] == 1) || (world[x][y][1] == 0 && world[x][y][0] == 1)) 
      { 
        world[x][y][0] = 1; 
        set(x, y, #FFFFFF); 
      } 
      if (world[x][y][1] == -1) 
      { 
        world[x][y][0] = 0; 
      } 
      world[x][y][1] = 0; 
    } 
  } 
  // Birth and death cycle 
  for (int x = 0; x < sx; x=x+1) { 
    for (int y = 0; y < sy; y=y+1) { 
      int count = neighbors(x, y); 
      if (count == 3 && world[x][y][0] == 0) 
      { 
        world[x][y][1] = 1; 
      } 
      if ((count < 2 || count > 3) && world[x][y][0] == 1) 
     { 
        world[x][y][1] = -1; 
      } 
    } 
  } 
} 
 
// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) 
{ 
  return world[(x + 1) % sx][y][0] + 
         world[x][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][y][0] + 
         world[x][(y + sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][(y + 1) % sy][0] + 
         world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
         world[(x + 1) % sx][(y + sy - 1) % sy][0]; 
}
