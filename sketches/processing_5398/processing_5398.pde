
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
  size(480, 320);
  smooth();
  bgimg = loadImage("donutbg.png");
  rd1 = loadImage("rldonut11.png");
  rd2 = loadImage("rldonut12.png");
  vd1 = loadImage("vcdonut11.png");
  vd2 = loadImage("vcdonut12.png");
  distX = endX - beginX;
  distY = endY - beginY; 

}
  
void draw () {
  background(bgimg);
  float s = sin(a) * scalar;
  a = a + angleInc;
  
  if (hitspace == true) {  //changes skin of donut 
    imageMode(CENTER);
    if (bitten == true) { //changes from whole to bitten
      image(rd2, x, y+s);        
      imageMode(CENTER);
    }
    else {
      image(rd1, x, y+s);
    }

  }
  
  else {
    imageMode(CENTER);
    if (bitten == true) { 
      image(vd2, x, y + s);
      imageMode(CENTER);
    }
    else {
      image(vd1, x, y + s);
    }

  }
  
  if (pct < 1.0) { // determines X's Y's when donut follows mouse
    pct = pct + step;
    float rate = pow(pct, exponent);
    x = beginX + (rate * distX);
    y = beginY + (rate * distY);
  }


}

void mousePressed() { //donut follows mouse with each click
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

  if (key == ENTER) { //allows bitten image to appear
  bitten = true;}
} 
 
void keyReleased () { //goes back to normal
  bitten = false;
} 


