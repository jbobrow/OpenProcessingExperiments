
/**
 Msl demonstrates movement at an arbitrary angle with bouncing off of a vertical wall. Use
 the left and right arrow keys to change the angle of the launcher, and press the space bar
 to launch.
*/
float msl_x;
float msl_y;
float dx;
float dy;
float direction = PI / 2;
float speed = 4.0;
float launcher_size = 15.0;
float launcher_x1;
float launcher_y1;
float launcher_x2;
float launcher_y2;

void setup() {
  size(500, 500);
  launcher_x1 = width / 2;
  launcher_y1 = height;
  launcher_x2 = launcher_x1;
  launcher_y2 = launcher_y1 - launcher_size;
}

void draw() {
  // Move missile according to calculated offsets.
  msl_x = msl_x + dx;
  msl_y = msl_y + dy;
  
  // If missile collides with side of screen, reverse the horizontal direction.
  if (msl_x <= 0.0 || msl_x >= width) {
    dx = dx * -1.0;
    msl_x = msl_x + dx;
  }
  
  background(0);
  fill(255);
  stroke(255);
  
  // draw missile
  ellipse(msl_x, msl_y, 2, 2);
  
  // draw launcher
  line(launcher_x1, launcher_y1, launcher_x2, launcher_y2);
}
  
void keyPressed() {
  // Launch missile.
  if (key == ' ') {
    // Set starting location of missile at bottom center.
    msl_x = width / 2;
    msl_y = height;
    
    // Set horizontal and vertical movememnt based on launcher angle.
    dx = speed * cos(direction);
    dy = -speed * sin(direction);
    
  } else if (keyCode == 37) { // left arrow
    direction += 0.1;
  } else if (keyCode == 39) { // right arrow
    direction -= 0.1;
  }
  
  direction = constrain(direction, 0.0, PI);
  
  // Calculate launcher coordinates.
  launcher_x2 = launcher_x1 + launcher_size * cos(direction);
  launcher_y2 = launcher_y1 - launcher_size * sin(direction);
}

