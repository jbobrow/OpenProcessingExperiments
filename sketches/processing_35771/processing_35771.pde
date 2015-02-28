
/**
 * Adapted bouncing effect from the sketch linked below.
 * http://wwww.openprocessing.org/visuals/?visualID=20121
 */

int sizes = 60;
float ypos = 200;
float xpos = 350;

float x_current = 350;
float y_current = 200;

float dsitXfinal = 0;
float distYfinal = 0;

float ease; //force

float bouncetime = 0;
float bouncetotal = 100;

float velx = 0;
float vely = 0;

void setup() {
  size(700,400);
  background(0);
}

void draw() {
  smooth();
  background(0);
  stroke(92,85,232);
  fill(92,85,232,50);
  ellipse(xpos,ypos,sizes,sizes);
  strokeWeight(2);
  
  
  if (mousePressed == true) {
    xpos = mouseX;
    ypos = mouseY;

  } else {
    float accelerationX = 0.3 * (350 - xpos);
    float accelerationY = 0.3 * (200 - ypos);
    println(accelerationX);
    
    velx = 0.9 * (velx + accelerationX);
    vely = 0.9* (vely + accelerationY);
    
    xpos = xpos + velx;
    ypos = ypos + vely;
  }
}


