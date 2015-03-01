
Ball ball;

float H = 0;
float S = 0;
float B = 0;

boolean click = false;

void setup() {
  colorMode(HSB, 360, 100, 100); //changes color mode to HSB mode 
  background(0, 0, 0);  //black background
  size(600, 600);
  smooth();
  ball = new Ball(50);
}

void draw() { 
  if(click == true){
  ball.display();
  ball.bounce();
  }
}

void mouseClicked(){
 click = true; 
}
class Ball {
  float x; //x coordinate of ball
  float y; //y coordinate of ball
  float d; //diameter
  float xspeed;
  float yspeed;


  Ball(float _d) {
    x = 0; //starting position
    y = 0;
    xspeed = 5.5; //vertical speed
    yspeed = 4; //horizontal speed
    d = _d; //choose diameter when the class is called in setup
    //step = 0; //for spin function onlyty
  }

  void display() {
    noStroke();
    H = map(x, 0, width, 50, 280); //maps hue values to horizontal values
    S = map(y, 0, height, 0, 100); //maps the saturation to vertival values
    B = map(y, 0, height, 0, 100);
    fill(H, 100, 100, 80); //90 is the opacity;

    ellipse(x, y, d, d);
  }

  void bounce() {
    x = x+xspeed; //bounces off the walls of the display
    y = y+yspeed;

    if ( x>width ||x<=0) {
      xspeed = -xspeed;
    }

    if (y > height || y<0) {
      yspeed = -yspeed;
    }
  }
}


