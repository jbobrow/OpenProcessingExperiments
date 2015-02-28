
// Bouncing Ball with State Changes
int state;
float x = 20;
float y = 20;
float speedX = 3;
float speedY = 3;
float diam = 20;

void setup() {
  size(800,600);
  smooth();
state = 0;
fill(0);
}

void draw() {
  background(255);
  // Add the current speed to the x location.
  x = x + speedX;
  y = y + speedY;
  // Remember, || means "or."
  if ((x > (width - (diam))) || (x < (-20 + (diam)))) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speedX = speedX * -1.025;
    state = state + 1;
    
  }
  if ((y > (height - (diam))) || (y < (-20 + (diam)))) {
    // If the object reaches either edge, multiply speed by -1 to turn it around.
    speedY = speedY * -1.025;
    state = state + 1;
    if (state > 15);{
     fill(state-20,state-10,state-30);
    }
    if (state < 15);{
      fill(state*15,state*20,state*10);
    }
    if (state > 30);{
      fill(state+30,state+40,state+60);
    }
    
  }

  // Display circle at x location
  stroke(0);
  ellipseMode(CENTER);
  ellipse(x+20,y+20,diam + state,diam + state);
  print (state);
}


// coded by Keenan Mosimann




