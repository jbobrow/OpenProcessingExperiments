
// My final project for Processing Course - Week 5

// This sketch draws random shapes centered on the middle of the sketch and, using symmetry, copies them onto the rest of the screen
// This allows a good visual result with many colorlines. It's a colorlines generator... 

// global variables
float radius = 10.0;
float angle = 0.0;
int resolution = 3;


// setup
void setup() {
   size(800, 600);
   background(255);
   noFill();
}

void draw() {
  if (mousePressed) {
    float cRed = random(255);
    float cGreen = random(255);
    float cBlue = random(255);
    
    color c0 = color(cRed, cGreen, cBlue);
    color c1 = color(cRed, 0, 0);
    color c2 = color(0, cGreen, 0);
    color c3 = color(0, 0, cBlue);
    color c4 = color(0, 255-cGreen, 255-cBlue);
    color c5 = color(255-cRed, 255-cGreen, 0);
    color c6 = color(255-cRed, 0, 255-cBlue);

    pushMatrix();
    translate(width/2, height/2);
    resolution = (int) map(mouseY+100, 0, height, 2, 10);
    radius = mouseX-width/2;
    angle = TWO_PI/resolution;
    stroke(c0);
    createFigure();
       
    //red
    pushMatrix();
    stroke(c1);
    translate(-width/4, -height/4);
    scale(.5);
    createFigure();
    popMatrix();
    
    //cyan
    pushMatrix();
    stroke(c4);
    translate(width/4, height/4);
    scale(.5);
    createFigure();
    popMatrix();

    //green
    pushMatrix();
    stroke(c2);
    translate(-width/4, height/4);
    scale(.5);
    createFigure();
    popMatrix();
    
    //magenta
    pushMatrix();
    stroke(c5);
    translate(width/4, -height/4);
    scale(.5);
    createFigure();
    popMatrix();
    popMatrix();
  }
} 



void keyReleased() {
  switch (key) {
    case DELETE:
    case BACKSPACE:
      background(255);
      break;
    case 's':
    case 'S':
      saveFrame("screenshot.png");
      break;      
  }
}

void createFigure() {
  beginShape();
  for (int i=0; i<=resolution; i++) {
    float x = 0 + cos(angle * i) * radius;
    float y = 0 + sin(angle * i) * radius;
    vertex(x, y);
  }
  endShape(CLOSE);  
}




