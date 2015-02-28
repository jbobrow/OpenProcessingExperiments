
boolean button = false;
int x1=75;  // X1 name given so that the various integers did not get mixed up
int y2=75;  // Y2 name given so that the various integers did not get mixed up
int w=50;
int h=50;

float x = 100; //  x location of square
float y = 0;  //  Y location of square

float speed = 10;  // Speed of Circle
float gravity = 0.95; // A new variable for gravity (acceleration)


void setup() {
  size(200, 200);  // Size of screen
}


void draw() {
  //  The button is pressed if (mouseX, mouseY) is inside the rectangle and mousePressed is true
  if (mouseX > x1 && mouseX < x1+w && mouseY < y2+h && mousePressed) {
   button = true;
  } else {
   button = false; 
   
  }
  if (button) {
    // if button is true carry out this code
    background(255, 255, 255);  // Background is white when button is pressed
    stroke(0);  // Lines are black when button is pressed
  } else {
    //  If button is false carry out this code
    background(0,0,0);  // Background is black
    stroke(255);  // Lines are black 
  }
  fill (175);  // Square is grey
  rect(x1,y2,w,h);
  line(100,0,100,200);  // Box size
  line(0,100,200,100);
  // Fill a black colour
  noStroke();
  fill(225, 0, 0);
  ellipse(x, y, w, h);

  y = y + speed;  // Add speed to location

  speed = speed + gravity;  // Add gravity to speed

  // if the circle reaches the bottom, reverse speed
  if (y > height) {
    y = height;
    speed = speed * -0.95; // dampening; multiplying by -0.95 slows the circle down each time it bounces

    if (mouseX < 100 && mouseY < 100) {
      fill (255, 0, 0);  // square colour red
      rect(0, 0, 100, 100);  // Square location
    } 
    else if (mouseX < 100 && mouseY < 100) {
      fill (0, 255, 0);  // Square green
      rect (100, 0, 100, 100);
    } 
    else if (mouseX > 100 && mouseY < 100) {
      fill (0, 0, 255);  // Square Blue
      rect (100, 0, 100, 100);
    } 
    else if (mouseX < 100 && mouseY > 100) {
      fill(255, 0, 255);  // Square pink
      rect (0, 100, 100, 100);
    } 
    else if (mouseX > 100 && mouseY > 100) {
      rect (100, 100, 100, 100);
      fill (255, 55, 55);
    }
  }
}
