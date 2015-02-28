
void setup() {
  size(600, 600);
  colorMode(RGB);
  background(50, 200, 200, 50);
  noStroke();
  frameRate(5);
}

void draw() {

  float line1 = (random(0, 100));
  float line2 = (random(101, 200));
  float line3 = (random(201, 300));
  float line4 = (random(301, 400));
  float line5 = (random(401, 500));
  float line6 = (random(501, 600));

  strokeWeight(2);
  stroke(255, 0, 0);
  line(line1, 0, 0, line1);
  stroke(255, 255, 0);
  line(line2, 0, 0, line2);
  stroke(255, 0, 255);
  line(line3, 0, 0, line3);
  stroke(200, 100, 50);
  line(line4, 0, 0, line4);
  stroke(50, 100, 200);
  line(line5, 0, 0, line5);
  stroke(100, 50, 200);
  line(line6, 0, 0, line6);
  
  stroke(random(0,255),random(0,255),random(0,255));
  line(random(300,600),random(300,600),600,600);
}

//reset sketch code borrowed & modified from Sean Gillespie
void mousePressed() {                         //when mouse is pressed the sketch redraws
  if (mousePressed == true) {                              //when mouse is pressed count is reset to draw over sketch
    setup();
  }
}


