
// This sketch probably will go very well with the music piece from 
// the "Wonderful Chill Out Music Beach Lounge Mix by Tekiu" on Youtube (from 19'54" to 23'19"). 


float circle_x = 40;
float circle_y = 40;
float circle_w = 40;
float circle_h = 40;

float move_1 = 0.2;
float move_2 = 0.4;

int size_change = 15;

int init_color = 100;
int color_change = 10;

void setup() {
  size(300, 300);
  smooth();
  frameRate(140);
}

void draw() {
  // Always put the background() in the draw() event if we want to see the shape moves!
  background(init_color);
  
  noStroke();
  
  // Change the color of the circles when they touch each other.
  if(abs(2 * circle_x - width) == circle_w || abs(2 * circle_y - height) == circle_h) {
    fill(255);
    println("hey!");
  } else if (abs(2 * circle_x - width) < circle_w || abs(2 * circle_y - height) < circle_h) {
    fill(180, 130, 255);
    background(init_color - color_change);
  } else if (circle_w >= 85 && circle_h >= 85) {
    fill(255, 130, 230);
  } else {
    fill(0, 200, 200);
  } 
  
  // The first circle
  ellipse(circle_x, circle_y, circle_w, circle_h);
  
  // The second circle that's 40 pixels (horizontally) right from the first circle.
  ellipse(width - circle_x, circle_y, circle_w, circle_h);
  
  // The third circle that's 40 pixels below the first circle.
  ellipse(circle_x, height - circle_y, circle_w, circle_h);
  
  // The fourth circle that's 40 pixels (horizontally) right from the third circle.
  ellipse(width - circle_x, height - circle_y, circle_w, circle_h);
  
  // Make all circles move towards the center. 
  circle_x = circle_x + move_1;
  circle_y = circle_y + move_2;
  
  // Make sure the circles bounce back up once they hit the "bottom height border" of the canvas.
  // Stretch the width of the circles by "size_change pixels" when they hit the "bottom height border" 
  // of the canvas. 
  if((height - (circle_h / 2)) <= circle_y) {
    move_2 = -move_2;
    circle_w = circle_w + size_change;
    background(250, 255, 190);
    
    // Make sure the circles bounce back up once they hit the "top height border" of the canvas. 
    // Stretch the width of the circles by "size_change pixels" when they hit the "bottom height border" 
    // of the canvas.
  } else if ((circle_h / 2) >= circle_y && move_2 < 0) {
    move_2 = -move_2;
    circle_h = circle_h + size_change;
    background(250, 255, 190);
    
  }
  
  // Make sure the circles bounce back up once they hit both of the width borders of the canvas.
  if((width - (circle_h / 2)) <= circle_x) {
    move_1 = -move_1;
    background(250, 255, 190);
  } else if ((circle_w / 2) >= circle_x && move_1 < 0) {
    move_1 = -move_1;
    background(250, 255, 165);
    
    //println(frameCount);
  }
  
  // Make the frameRate higher when the colliding circles are quite big. 
  if (abs(2 * circle_x - width) < circle_w || abs(2 * circle_y - height) < circle_h && circle_w >=150 && circle_h >= 150) {
    frameRate(200);
  }
  
  // Print out the end message of these colliding balls.
  if(12094 <= frameCount) {
    fill(0);
    PFont font;
    font = loadFont("Cochin-BoldItalic-48.vlw");
    textFont(font, 32); 
    text("Ultimate explosion!", 20, 150);
    
    noLoop();
  }
  
}

