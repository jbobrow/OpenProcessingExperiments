
/* The purpose of the sketch is to play with the generation of graphics 
 based on the generation of stars using a defined function.
 The number of the points of the stars is a mapped value depending on
 the mouse x position.
 The stars also grow and rotate depending on the on the mouse x position
 (growth) and the y mouse position (rotation).
 The sketch allows to play with just black drawn stars without any color
 and with colored stars by pressing the f key.Pressing n key will return
 to drawn mode.
 You can erase the screen by pressing the delete or backspace keys.
 The sketch also allows to save png screenshots by pressing s key.
 You can also play with symmetric compositions switching between the 2,
 4 and 8 keys that trigger the copy of a central portion of the sketch
 populating the screen with that portion. */

//Global variables
color strokeColor = color(0, 40);
float x = 0;
float y = 0;
int starBase;

//setup
void setup() {
  size(800, 600);
  colorMode(HSB, 100, 100, 100, 100);
  noFill();
  background(100);
}

//draw
void draw() {
  float smallRadius = abs(mouseX-width/2); //sets the inlet star radious
  float bigRadius = smallRadius*3; //sets the outlet star radius
  int rotation = (int)map(mouseY, 0, height, 10, 40);
  float fillColor = random(100);
  if (keyPressed) {
    //changes to colorful mode
    if (key == 'f' || key == 'F') {
      noStroke();
      fill(fillColor, 100, 100, 50);
    }
  }

  starBase = (int)map(mouseX, 0, width, 2, 10);//sets the number of points of the star
  if (mousePressed) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(frameCount / rotation);//sets the rotation of the star
    strokeWeight(random(0.4, 1.6));
    stroke(strokeColor);
    star(0, 0, smallRadius, bigRadius, starBase); //draws the star
    popMatrix();
  }
}

//function with the needed arguments to draw a star
void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float i = 0; i < TWO_PI; i += angle) {
    float sx = x + cos(i) * radius2;
    float sy = y + sin(i) * radius2;
    vertex(sx, sy);
    sx = x + cos(i+halfAngle) * radius1;
    sy = y + sin(i+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void keyReleased() {
  //erase screen
  if (key == DELETE || key == BACKSPACE)
    background(100);
  //save screenshot
  if (key == 's' || key == 'S')
    saveFrame ("###.png");
  //returbs to drawing mode
  if (key == 'n' || key == 'N')
    noFill(); 
  //switch mode that plays with symmetry
  switch(key) {
  case '2':
    copy(200, 0, 400, 600, 0, 0, 400, 600);
    copy(0, 0, 400, 600, width/2, 0, 400, 600);
    break;
  case '4':
    copy(200, 150, 400, 300, 0, 0, 400, 300);
    copy(0, 0, 400, 300, width/2, 0, 400, 300);
    copy(0, 0, 800, 300, 0, height/2, 800, 300);
    break;
  case '8':
    copy(300, 150, 200, 300, 0, 0, 200, 300);
    copy(0, 0, 200, 300, 200, 0, 200, 300);
    copy(0, 0, 400, 300, 0, 300, 400, 300);
    copy(0, 0, 400, 600, width/2, 0, 400, 600);
    break;
  }
}



