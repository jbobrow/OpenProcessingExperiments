
// Step1: click mode, click on the alien to destroy them

// Setup:
//  set up the aliens
//  make arrays of aliens object

// Draw:
//  crete aliens location and controled speed
//  if catcher intersect alience, hightlight colors
//  if click on the aliens, the aliene caught

// Data:
//  Start
//  Move
//  Display
//  Hightlight
//  Intersect
//  Caught
//----------------------------------------------------
/*
Click[] click = new Click[300];
// add totalClick to create flexible array
int totalClick = 0;

void setup() {
  size(600, 400);
  smooth();
  
  /*for(int i = 0; i < click.length; i++) {
    click[i] = new Click(random(width), random(height), 50);
  }*/
/*}

void draw() {
  background(255);
  
  // Initailize one alien click
  click[totalClick] = new Click(random(width), random(height), 50);
  // Increment totalClick
  totalClick++;
  // If we hit the end of the array
  if (totalClick >= click.length) {
    totalClick = 0;
  }
  
  for(int i = 0; i < totalClick; i++) {
    click[i].move();
    if (click[i].mouseOver()) {
      click[i].hightlight();
      if (click[i].caught()) {
        click[i].alienCaught();
      }
    }
    click[i].display();
  }
}*/

class Click {
  float x, y;
  float r;
  float xspeed;
  float yspeed;
  boolean mouseClick = false;
  boolean finished = false;
  
  Click (float xpos, float ypos,float tempr, float tempxspeed, float tempyspeed) {
    x = xpos;
    y = ypos;
    r = tempr;
    xspeed = tempxspeed;
    yspeed = tempyspeed;
  }
  
  // Control Aliens object movement
  void move() {
    x += xspeed;
    y += yspeed;
    
    if ( x > width-r/2 || x < 0+r/2) {
      xspeed *= -1;
    }
    
    if ( y > height-r/2 || y < 0+r/2) {
      yspeed *= -1;
    }
  }   
  
  // Check it mouse over the object 
  boolean mouseOver() {
    if (mouseX > x-r && mouseX < x+r && mouseY > y-r && mouseY < y+r ) {
      return true;
    } else {
      return false;
    }
  }
  
  // If mouseOver true, hightlight alien object
  void hightlight() {
    x += random(-2,2)*xspeed;
    y += random(-2,2)*yspeed;
    stroke(random(255));
    fill(random(255), random(255), random(255));
    ellipse(x, y, r, r); 
  }
  
  // If mouse pressed, caught aliens object
  boolean caught() {
    if (mousePressed) {
      return true;
    } else {
      return false;
    }
  }
  
  // Aliens caught, disappear
  void alienCaught() {
    xspeed = 0;
    yspeed = 0;
    y = -1000;
  }
  
  // If there is no event
  void display() {
    stroke(0);
    fill(127,100,50, 60);
    ellipse(x, y, r/2, r/2);
    fill(127, 127, 200, 60);
    ellipse(x, y, r, r); 
  }
  
   boolean aIntersect(Click c) {
    float distance = dist(x, y, c.x, c.y);
    if (distance > r + c.r) {
      return true;
    } else {
      return false;
    }
  }
  
  void finished() {
    finished = false;
  }
}

