
// Drag (click and hold) your mouse across the 
// image to change the value of the rectangle

int value = 0;
int c = 0;
int d = 255;
int x, y;
float r;
float g;
float b;
float a;
//float diam;
int colorTone = 0; // 0:gray 1:red 2:green 3:blue


void setup() {
  size(500, 500);
  smooth();
  noStroke();
//  fill(255, 0, 0, random(255));
  }

void draw() {
  //set the location of the circle and color it in black
  fill(c);
  ellipse(250, 250, 300, 300);
  //set the locations of the circles and color them in white
  fill(d);
  ellipse(100, 100, 200, 200);
  ellipse(400, 400, 200, 200);
  ellipse(400, 100, 200, 200);
  ellipse(100, 400, 200, 200);
  //set the locations of the squares and color them in black
  fill(value);
  rect(0, 0, 100, 100);
  rect(100, 100, 100, 100);
  rect(200, 200, 100, 100);
  rect(300, 300, 100, 100);
  rect(400, 400, 100, 100);
  rect(400, 0, 100, 100);
  rect(300, 100, 100, 100);
  rect(200, 200, 100, 100);
  rect(100, 300, 100, 100);
  rect(0, 400, 100, 100);
  rect(0, 200, 100, 100);
  rect(200, 0, 100, 100);
  rect(200, 400, 100, 100);
  rect(400, 200, 100, 100);
  

  
//  diam = random(10);//diameter
  if (colorTone==0) { //gray
    fill(0, random(255));
  }
  else if (colorTone==1) { //red
    fill(random(255), 0, 0, random(255));
  }
  else if (colorTone==2) { //green
    fill(0, random(255), 0, random(255));
  }
  else if (colorTone==3) { //blue
    fill(0, 0, random(255), random(255));
  }  
  ellipse(250, 250, 300, 300);
}

void keyPressed() {
  if (key == '0') {
    colorTone = 0; //the circle at the center turns gray
  }
  else if (key == 'r' || key == 'R' || key == '1') {
    colorTone = 1; //the circle at the center turns red
  }
  else if (key == 'g' || key == 'G' || key == '2') {
    colorTone = 2; //the circle at the center turns green
  }
  else if (key == 'b' || key == 'B' || key == '3') {
    colorTone = 3; //the circle at the center turns blue
  }
  else if (key == ' ') {
    background(255); // erase the canvas
  }
}

//when you move the mouse, the colour of the squares will change
void mouseMoved() {
  value = value - 100;
  if (value > 255) 
    value = 0;
}


