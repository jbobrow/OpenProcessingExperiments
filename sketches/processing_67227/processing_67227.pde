
//This one doesn't tell time at all.  Trippy.
int counter = 0;
int colorCounter = 0;
float colorCounter2 = 100;

void setup() {
  background (0);
  smooth();
  size(500, 500);
  noStroke();
  colorMode(HSB);
  frameRate(15);
}

void draw() {
  
  counter+=2;
  if (counter > 359){
   counter = 0; 
  }
  
  colorCounter+=1;
  if (colorCounter > 255){
   colorCounter = 0; 
  }
  
  colorCounter2 -=1.5;
  if ( colorCounter2 < 0){
   colorCounter2 = 255; 
  }
  
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
  // make six spirals in each direction
  for (int i = 0; i < 6; i++) {
    spiral(i*60+counter, color(colorCounter, 255, 255, 100), width/2, height/2, false);  // arms spaced every 60 degrees
    spiral(i*90+counter, color(colorCounter2, 255, 255, 100), width/2, height/2, true);  // arms spaced every 90 degrees
  }
}

// this function wants a starting angle, fill color, center x and y and a boolean for direction
void spiral(float angle, color clockColor, float centerX, float centerY, boolean clockwise) {
  fill(clockColor);  
  
  float degree = angle;
  int direction = -1;
  if (clockwise) {
    direction = 2;
  } 

  
    for (int i = 0; i < 720; i++) {
      float x = i/2 * cos ( radians(angle+i)) * direction;   
      float y = i/2 * sin (radians(angle+i));
      ellipse (x+centerX, y+centerY, i/50+.5, i/50+.5);
    }
 
}


