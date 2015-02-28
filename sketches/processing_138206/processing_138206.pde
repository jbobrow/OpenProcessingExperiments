
//Wave lines make delicate patterns while the color of them changes. 
//The initial window is blank, then you click the mouse, drawing starts.
//then click again, the window trun to white. Then click again, drawing starts again.
//You can save a screenshot with pressing the key 's' or 'S'.

//Clicking mouse starts and stops drawing 
boolean click = false;

//for the wave of left to right
float posX = 0;
float posY = 0;
float baseR = 0;
// for the color change 
float n = 0.01;

float x =30;
float y =30;

void setup() {
  size(960, 600);
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
}

void draw() {
  // when the mouse is clicked 
  if (click) {
    pushMatrix();
  // for the translate x and y position 
    float baseT = 0.0;
    baseT += 0.5;
    float rad = radians(baseT);
    baseR += 3.5;
    posX = cos(rad)*baseR;
    posY = sin(rad)*baseR + (height/2-25);
    translate(posX, posY);
    if (posX > width +100) {
      baseT = 0.0;
      baseR = 0;
    }
    // rotate lines
    rotate(radians(frameCount*2 % 360));
    // circle lines
    float h = 60+noise(n)*300;
    n += 0.01;
    stroke(h, 100, 100, 80);
    strokeWeight(0.1);
    noFill();
    line(0,0,x,y);
    x += 0.05;
    y += 0.05;
   
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



