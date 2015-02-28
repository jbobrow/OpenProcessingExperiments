
void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(0);
  noStroke();
  frameRate(4);
}

//float color1 = fill(random(0,255),random(0,255),random(0,255));
int count = 50; //number of ellipses limited to 50 in each quadrant
//sets variable for a random color
float randomColor;

void draw() {

  //Sets random placement in quadrant II
  float x1 = random(0, 300);
  float y1 = random(0, 300);
  //Sets random placement in quadrant IV
  float x2 = random(300, 600);
  float y2 = random(300, 600);
  
  //While x1 & y1 are both the same random variable, and x2 & y2 are as well, I didnt use just one float for each random because if I added module in Quadrant I or III the x & y would be different.


  if (count > 0) {
    //Sets up random color
    randomColor = random(100);
    //From example random_prob the low variable of ten allows for more blue than red
    if (randomColor > 10) {
      fill(50, 200, 200, 50);
    }
    else {
      fill(0, 200, 200, 50);
    }
    //Use x1 & y1 to locate random placement within Quadrant II
    ellipse(x1, y1, 30, 30);
    //Use x2 & y2 to locate random placement within Quadrant IV
    ellipse(x2, y2, 30, 30);
  }
  count--;
}


//reset sketch code borrowed & modified from Sean Gillespie
void mousePressed() {                         //when mouse is pressed the sketch redraws
  if (mousePressed == true) {
    count = 50;                              //when mouse is pressed count is reset to draw over sketch
    setup();
  }
}


