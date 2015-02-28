
// allow user to place a circle of radius R at a location on the canvas
// with a mouse click

float R;
ArrayList<Circle> circles;

// variables for target game;
boolean game;
float target_centerX, target_centerY, target_radius;

void setup() {
  size(750, 750);
  R = 8;
  circles = new ArrayList<Circle>();
  game = true;
  target_radius = 10;
  target_centerX = random(target_radius, width - target_radius);
  target_centerY = random(target_radius, height - target_radius);
}

void draw() {
  background(255);
  // Execute this section until the target has been hit
  if (game) {
    // Draw Target
    noStroke();
    fill(255, 0, 0);
    ellipse(target_centerX, target_centerY, 2*target_radius, 2*target_radius);
    fill(255);
    ellipse(target_centerX, target_centerY, 1.5*target_radius, 1.5*target_radius);
    fill(255, 0, 0);
    ellipse(target_centerX, target_centerY, target_radius, target_radius);
    fill(255);
    ellipse(target_centerX, target_centerY, 0.5*target_radius, 0.5*target_radius);
    // Draw Circles
    stroke(0);
    fill(255, 255, 0);
    for (int i=0; i<circles.size(); i++) {
      circles.get(i).render();
      circles.get(i).move();
      if (circles.get(i).isStale()) {
        circles.remove(i);
        i--;
      }
    }
  }
  else{
  fill(0, 255, 0);
  text("Congratulations! You hit the target!", width/3, height/4);
  while(circles.size() != 0) circles.remove(0);
  fill(0, 0, 155);
  rect(width/3, height/3, width/3, height/3);
  fill(255);
  text("Click to play again", 2*width/5, height/2);
  }
}

void mouseClicked() {
  if(game){
    if(mouseX < target_centerX - 2*target_radius ||
    mouseX > target_centerX + 2*target_radius ||
    mouseY < target_centerY - 2*target_radius ||
    mouseY > target_centerY + 2*target_radius)
    circles.add(new Circle(mouseX, mouseY, R));
  }
  else if(mouseX > width/3 && mouseX < 2*width/3 && mouseY > height/3 && mouseY < 2 * height/3){
    game = true;
    target_centerX = random(target_radius, width - target_radius);
    target_centerY = random(target_radius, height - target_radius);
  }
}

// define the Circle class
class Circle {
  // class data/variables
  float centerX, centerY;
  float vx, vy, ax, ay;
  float v_min, v_max;
  float radius;
  color c;

  // Constructor, builds the object when it is declared.
  Circle(float x, float y, float r) {
    centerX = x;
    centerY = y;
    v_min = -5;
    v_max = 5;
    vx = random(v_min, v_max);
    vy = random(v_min, v_max);
    ax = 0;
    ay = 0.3;
    c = color(random(255), random(255), random(255));
    radius = random(r/2, r);
  }

  // Test if the circle is off the canvas, return true if it is.
  boolean isStale() {
    return (centerX < -radius || centerX > width+radius || centerY < -radius || centerY > height + radius);
  }

  // render the circle object
  void render() {
    fill(c);
    stroke(0);
    ellipse(centerX, centerY, 2*radius, 2*radius);
  }

  // update position using newtonian motion
  void move() {
    centerX += vx;
    centerY += vy;
    vx += ax;
    vy += ay;
    if (centerY > height - radius) { 
      centerY = height - radius;
      vy = -0.9 * vy;
    }
    else if (centerY < radius) {
      vy = - 0.9 * vy;
      centerY = radius;
    }
    if (centerX > width - radius) { 
      vx = -0.9 * vx;
      centerX = width - radius;
    }
    else if (centerX < radius) {
      vx = -0.9 * vx;
      centerX = radius;
    }
    // Check to see if it will hit the target
    if(target_centerX - target_radius <= centerX 
    && target_centerX + target_radius >= centerX
    && target_centerY - target_radius <= centerY
    && target_centerY + target_radius >= centerY)
    game = false;  
  }
}



