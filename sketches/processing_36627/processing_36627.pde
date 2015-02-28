
void setup() {
  size(500, 300);
  background(255);
}

float count = 0;
float number = 13;

void draw() {
  //to make the stripes 
  if (count < number) {
    if (count % 2 == 0) {//creates every other stripe red
      noStroke();
      fill (255, 0, 0);
      rect(0, count * height/number, width, height/number);
    }
  }
  count++;
  //for the blue box
  fill(0, 22, 250);
  rect(0, 0, 230, 162);

  //for the stars to move  
  float count = 5;
  float circleSize;


  if (count > 0) {
    circleSize = random(10, 20); //to make the stars pop
    fill(255);
    //each star placement
    ellipse(46, 27, circleSize, circleSize);
    ellipse(46, 81, circleSize, circleSize);
    ellipse(46, 135, circleSize, circleSize);
    ellipse(92, 54, circleSize, circleSize);
    ellipse(92, 108, circleSize, circleSize);
    ellipse(138, 81, circleSize, circleSize);
    ellipse(138, 27, circleSize, circleSize);
    ellipse(138, 135, circleSize, circleSize);
    ellipse(184, 108, circleSize, circleSize);
    ellipse(184, 54, circleSize, circleSize);
  }
  count--;
}


