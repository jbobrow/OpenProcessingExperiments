
//Waves of lines make delicate patterns with the color changing. 
//The length of lines are getting longer.
//The initial window is blank, then you click the mouse, it starts drawing .
//then click again, the window truns to white, 
//and then click again, it starts drawing again from the last continuation. 
//You can save screenshots with pressing the key 's' or 'S'.


//Clicking mouse starts and stops drawing 
boolean click = false;

//start points of the waves
float posX = 0;
float posY = 0;
//radius for the waves
float radius = 0;
//variable for the y location of start point
float yVar = 100;
// for the color change 
float n = 0.01;

float endX = 50;
float endY = 50;

void setup() {
  size(960, 720);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  frameRate(300);
}

void draw() {
  // when the mouse is clicked 
  if (click) {
    pushMatrix();
    // for the translate x and y position 
    float angle = 0.0;
    angle += 0.1;
    float rad = radians(angle);
    radius += 1;//increment of the radius is the point!! not increment not move
    posX = cos(rad)*radius;//radius is the point for moving
    posY = sin(rad)*radius + yVar;//radius is the point for moving
    translate(posX, posY);

    // color change based on the noise
    float h = 60+noise(n)*300;
    n += 0.01;
    stroke(h, 100, 100, 30);
    strokeWeight(0.8);
    // rotate line to make ciecle
    rotate(radians(frameCount*2 % 360));
    // lines    
    line(0, 0, endX, endY);
    
    // When the wave reaches to the right, the starting point of the wave goes to the left.
    if (posX > width +100) {
      angle = 0.0;
      radius = 0;
      // When you run this code, each time y position is random, 
      yVar += noise(1)*330;
      // make lines longer
      endX += 10;
      endY += 10;
    }
    //When the wave reaches to the bottom, the starting point of the wave goes to the upper.
    if (posY > height + 30) {
      yVar = 0;
    }

    popMatrix();
  }
}

void keyPressed() {
  if (key == 's' || key == 'S') saveFrame("screenshot###.jpg");
}

void mouseReleased() {
  click = !click;
  background(360);
}



