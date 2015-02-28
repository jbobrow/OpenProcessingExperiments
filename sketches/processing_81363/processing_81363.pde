
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/5398*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
float a = 0.0; //variables for moving in place
float angleInc = PI/36.00; //variables for moving in place
float scalar = 6.00; //variables for moving in place

float x = 0.0; // Current x-coordinate
float y = 0.0; // Current y-coordinate
// starting XY point
float beginX = 240.0; 
float beginY = 160.0; 
// ending XY point
float endX = 240.0;
float endY = 160.0; 
// distance btwn endXY's and beginXY's
float distX; 
float distY; 
// for the path that the object takes from beginXY to endXY
float exponent = 1.0; // the curve of the path
float step = 0.05; // size of steps on the path
float pct = 0.0; // how much is traveled by percent, 0.0->1.0

PImage rd1, rd2, bgimg, vd1, vd2; 

boolean hitspace = false;

boolean bitten = false;


void setup() {
  size(600, 500);
  smooth();
  bgimg = loadImage("hearts-map.jpg");
  rd1 = loadImage("dormkey.png");

  vd1 = loadImage("housekey.png");
  distX = endX - beginX;
  distY = endY - beginY; 

}
  
void draw () {
  background(bgimg);
  float s = sin(a) * scalar;
  a = a + angleInc;
  
  if (hitspace == true) {  //changes between house key and dorm key 
    imageMode(CENTER);
    if (bitten == true) {         
      imageMode(CENTER);
    }
    else {
      image(rd1, x, y+s);
    }

  }
  
  else {
    imageMode(CENTER);
    if (bitten == true) { 
      imageMode(CENTER);
    }
    else {
      image(vd1, x, y + s);
    }

  }
  
  if (pct < 1.0) { // determines X's Y's when key follows mouse
    pct = pct + step;
    float rate = pow(pct, exponent);
    x = beginX + (rate * distX);
    y = beginY + (rate * distY);
  }


}

void mousePressed() { //key follows mouse with each click
    pct = 0.0;
    beginX = x;
    beginY = y;
    distX = mouseX - x;
    distY = mouseY - y;
}

void keyPressed() { //allows skin to change
  if (key == ' ') {
    if (hitspace == true) {
      hitspace = false;
    } 
    else {
      hitspace = true;
    }
  }

  if (key == ENTER) { 
  bitten = true;}
} 
 
void keyReleased () { //goes back to normal
  bitten = false;
} 


