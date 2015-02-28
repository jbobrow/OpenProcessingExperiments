
int x = 0;
int speed = 1;


void setup() {
  size(300,300);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  float h = map(hour(),0,23,30,(width-30));
  float m = map(minute(),0,60,30,(width-30));
  float s = map(second(),0,60,(width-20), 30);

  fill(255,200,0,50);
  ellipse(h,150,300,300);
  
  fill(255,63,154,50);
  ellipse(m,150,200,200);
  
  fill(0,225,255,70);
  ellipse(s, 150,150,150);
  
 
  // Add the current speed to the x location.  
  x = x + speed;
   fill(0);
  // Remember, || means "or."
  if ((x > width) || (x < 0)) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speed = speed * -1;
  }
  
  // Display circle at x location 
  fill(0,255,0,50);
  ellipse(x,150,70,70);
  
}

void mouseMoved() {
  
}


