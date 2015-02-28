



/////////////////////////////ellipses
float x1 = 140.0;
float y1 = 140.0;

float x2 = 180.0;
float y2 = 180.0;

float angle1;
float angle2;

float speed = 1.0;

float radius1;
float radius2;

float trans1;
float trans2;

float bri1;
float bri2;

float speedX1 = 0.85;
float speedY1 = 0.75;

float speedX2 = 0.4;
float speedY2 = 0.3;

int directionX1 = 1;
int directionY1 = -1;
int directionX2 = -1;
int directionY2 = -1;

////////////////////////fade in and out
float fade = 0.0;
float fadeSpeed = 0.01;
int fadeDir = 1;

boolean colorReveal = false;
int page = 0;

//////////////////////////////////setup
void setup() {
  size (480, 320);
  smooth();
  colorMode(HSB, 360, 100, 100, 255);
  noStroke();
  ellipseMode(RADIUS);
  cursor(CROSS);
  setValues();
}

/////////////////////////////set values
void setValues() {
  
 fade = 0;
  
 angle1 = random(0, TWO_PI);
 angle2 = random(0, TWO_PI);
  
 x1 = 140.0;
 y1 = 140.0;

 x2 = 180.0;
 y2 = 180.0;

 speed = 1.0;

 trans1 = random(30, 180);
 trans2 = random(40, 190);
 
 bri1 = random(35, 65);
 bri2 = random(45, 75);
 

 speedX1 = 0.85;
 speedY1 = 0.75;

 speedX2 = 0.4;
 speedY2 = 0.3;

 directionX1 = 1;
 directionY1 = -1;

 directionX2 = -1;
 directionY2 = -1;

 radius1 = random(70.0, 140.0);
 radius2 = random(60.0, 120);
}

void draw() {

  background(0,0,255);
  
  /////////////////////////////////////////////////////ellipse 1
  
  pushMatrix();

if (mouseX != 0) {
  angle1 = map (mouseX, 0, width, 0, TWO_PI);
    
  }
  
  if (colorReveal == false) {
    fill(0, 99, 0, trans1 * fade);
    
  } else {
    fill(degrees(angle1), 100, bri1, trans1 * fade);
    
  }

  
  ellipse(x1,y1, radius1, radius1); 
  
  if (fade < 1.0) {
    fade += fadeSpeed;
  }
  
  x1 += speedX1 * directionX1;
  if ((x1 > width - radius1) || (x1< radius1)) {
    directionX1 = - directionX1;
  }
  y1 += speedY1 * directionY1;
  if (( y1 > height - radius1) || (y1 < radius1)) {
    directionY1 = - directionY1;
  }

  //////////////////////////dial
  stroke(0, 0, 100, 100);
  strokeWeight(2);
  strokeCap(ROUND);
  translate (x1, y1);
  rotate (angle1);
  line(0, 0, radius1, 0);
  noStroke();
  
  popMatrix();

  /////////////////////////////////////////////////////ellipse 2

  pushMatrix();

if (mouseY != 0) {
  angle2 = map (0 + mouseY, 0, height, 0,TWO_PI);
}
  
  if (colorReveal == false){
    fill(0, 99, 0, trans2 * fade);
  } else {
    fill(degrees(angle2), 100, bri2, trans2 * fade);
  }
  
  ellipse(x2,y2, radius2, radius2); 
  

  x2 += speedX2 * directionX2;
  if ((x2 > width - radius2) || (x2< radius2)) {
    directionX2 = - directionX2;
  }
  y2 += speedY2 * directionY2;
  if (( y2 > height - radius2) || (y2 < radius2)) {
    directionY2 = - directionY2;
  }
  
  ////////////////////////////dial
  stroke(0, 0, 100, 100);
  strokeWeight(2);
  strokeCap(ROUND);
  translate (x2, y2);
  rotate (angle2);
  line(0, 0, radius2, 0);
  noStroke();
  
  popMatrix();
}

void mouseReleased() {
    if(colorReveal == true){
    reset();
  } else {
    colorReveal = true;
  }
}

void reset(){
  colorReveal = false;
  setValues();
}


