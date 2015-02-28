



int Radius;
int Col;
int Row;
int Interval;
int Margin;
int Num;

float DegShortHands[];
float DegLongHands[];
float HandsSpeed[];

color FrameColor[];
color PatternColor[];
color HandsColor[];

Integrator[] interPatternInside;
Integrator[] interPatternOutside;
Integrator[] interFrame;
Integrator[] interShortHands;
Integrator[] interLongHands;
Integrator[] interHandsRadius;
Integrator[] interHandsStroke;
Integrator[] interPatternStroke;
Integrator[] interPatternRepeat;


void setup() {
  size(700,700);
  colorMode(HSB, 255,255,255);
  Radius = 100;
  Interval = 30;
  Margin = 80;
  Col = 5;
  Row = 5;
  Num = Col * Row;
  FrameColor = new color[Num];
  HandsColor = new color[Num];
  PatternColor = new color[Num];

  DegShortHands = new float[Num];
  DegLongHands = new float[Num];
  HandsSpeed = new float[Num];


  interFrame = new Integrator[Num];
  interPatternInside = new Integrator[Num];
  interPatternOutside = new Integrator[Num];
  interShortHands = new Integrator[Num];
  interLongHands = new Integrator[Num];
  interHandsRadius = new Integrator[Num];
  interHandsStroke = new Integrator[Num];
  interPatternStroke = new Integrator[Num];
  interPatternRepeat = new Integrator[Num];


  for(int i = 0; i < Row; i++) { 
    for(int j = 0; j < Col; j++) {
      FrameColor[i * Col + j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      HandsColor[i * Col + j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      PatternColor[i * Col + j] = color(int(random(0,255)), int(random(0, 255)), int(random(0, 255)));
      HandsSpeed[i * Col + j] = random(1,10);
      DegShortHands[i * Col + j] = random(0, 360);
      DegLongHands[i * Col + j] = random(0, 360);

      float initialFrame = random(0,20);
      interFrame[i * Col + j] = new Integrator(initialFrame, 0.75, 0.025);
      float initialPatternInside = random(30,35);
      interPatternInside[i * Col + j] = new Integrator(initialPatternInside, 0.75, 0.025);
      float initialPatternOutside = random(25, 50);
      interPatternOutside[i * Col + j] = new Integrator(initialPatternOutside, 0.75, 0.025);
      float initialShortHands = random(5,30);
      interShortHands[i * Col + j] = new Integrator(initialShortHands, 0.75, 0.025);
      float initialLongHands = random(30,50);
      interLongHands[i * Col + j] = new Integrator(initialLongHands, 0.75, 0.025);
      float initialHandsRadius = random(0, 5);
      interHandsRadius[i * Col + j] = new Integrator(initialHandsRadius, 0.75, 0.025);

      float initialHandsStroke = random(0,5);
      interHandsStroke[i * Col + j] = new Integrator(initialHandsStroke, 0.75, 0.025);
      float initialPatternStroke = random(.01, .5);
      interPatternStroke[i * Col + j] = new Integrator(initialPatternStroke, 0.75, 0.025);
      float initialPatternRepeat = random(2, 100);
      interPatternRepeat[i * Col + j] = new Integrator(initialPatternRepeat, 0.75, 0.025);

    }
  }

  smooth();
}


void draw() {

  background(255);

  for(int i = 0; i < Row; i++) { 
    for(int j = 0; j < Col; j++) {
      interFrame[i * Col + j].update();
      interPatternInside[i * Col + j].update();
      interPatternOutside[i * Col + j].update();
      interShortHands[i * Col + j].update();
      interLongHands[i * Col + j].update();
      interHandsRadius[i * Col + j].update();
      interHandsStroke[i * Col + j].update();
      interPatternStroke[i * Col + j].update();
      interPatternRepeat[i * Col + j].update();
    }
  }


  for(int i = 0; i < Row; i++) { 
    for(int j = 0; j < Col; j++) {
      int x = Margin + j * (Radius + Interval);
      int y = Margin + i * (Radius + Interval);

      drawFrame(x, y, i * Col + j);
      drawBoard(x, y, i * Col + j);
      drawPatterns(x, y, i * Col + j);
      drawHands(x, y, i * Col + j);


    }
  }


}


void drawFrame(int x, int y, int number) {
  float tmpFrame = interFrame[number].value;
  
  noStroke();
  fill(FrameColor[number]);
  ellipseMode(CENTER);
  ellipse(x,y,Radius + tmpFrame ,Radius + tmpFrame); 
}

void drawBoard(int x, int y, int number) {
  fill(250);
  ellipseMode(CENTER);
  ellipse(x,y,Radius ,Radius); 
}

void drawPatterns(int x, int y, int number) {
  float tmpPatternStroke = interPatternStroke[number].value;
  float tmpPatternRepeat = interPatternRepeat[number].value;
  
  stroke(PatternColor[number]);
  strokeWeight(tmpPatternStroke);
  for(int i = 0; i < tmpPatternRepeat; i++){
    float tmpPatternInside = interPatternInside[number].value;
    float tmpPatternOutside = interPatternOutside[number].value;

    float deg = 360 / tmpPatternRepeat * i;
    line(x + tmpPatternInside * cos(radians(deg)),
    y + tmpPatternInside * sin(radians(deg)),
    x + tmpPatternOutside * cos(radians(deg)),
    y + tmpPatternOutside * sin(radians(deg)));
  }
}


void drawHands(int x, int y, int number) {
  
  float tmpHandsStroke = interHandsStroke[number].value;
  float tmpShortHands = interShortHands[number].value;
  float tmpLongHands = interLongHands[number].value;
  float tmpHandsRadius = interHandsRadius[number].value;
  
  
  stroke(HandsColor[number]);
  strokeWeight(tmpHandsStroke);
  beginShape(LINES);

  vertex(x + tmpShortHands * cos(radians(DegShortHands[number])),
  y + tmpShortHands * sin(radians(DegShortHands[number])));
  vertex(x, y);
  vertex(x + tmpLongHands * cos(radians(DegLongHands[number])),
  y + tmpLongHands * sin(radians(DegLongHands[number])));
  vertex(x, y);

  endShape();

  ellipse(x + tmpShortHands * cos(radians(DegShortHands[number])),
  y + tmpShortHands * sin(radians(DegShortHands[number])),
  tmpHandsRadius, tmpHandsRadius);
  ellipse(x + tmpLongHands * cos(radians(DegLongHands[number])),
  y + tmpLongHands * sin(radians(DegLongHands[number])),
  tmpHandsRadius, tmpHandsRadius);

  DegLongHands[number] += HandsSpeed[number];
  if(DegLongHands[number] > 360) {
    DegShortHands[number] += 30;
    DegLongHands[number] = 0;
  }
}


void mousePressed() {
  updateValues();
}

void updateValues() {

  for(int i = 0; i < Row; i++) { 
    for(int j = 0; j < Col; j++) {
      FrameColor[i * Col + j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      HandsColor[i * Col + j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
      PatternColor[i * Col + j] = color(int(random(0,255)), int(random(0, 255)), int(random(0, 255)));
      HandsSpeed[i * Col + j] = random(1,10);
      DegShortHands[i * Col + j] = random(0, 360);
      DegLongHands[i * Col + j] = random(0, 360);

      float newFrame = random(0,20);
      interFrame[i * Col + j].target(newFrame);
      float newPatternInside = random(30,35);
      interPatternInside[i * Col + j].target(newPatternInside);
      float newPatternOutside = random(25, 50);
      interPatternOutside[i * Col + j].target(newPatternOutside);
      float newShortHands = random(5,30);
      interShortHands[i * Col + j].target(newShortHands);
      float newLongHands = random(30,50);
      interLongHands[i * Col + j].target(newLongHands);
      float newHandsRadius = random(0, 5);
      interHandsRadius[i * Col + j].target(newHandsRadius);

      float newHandsStroke = random(0,5);
      interHandsStroke[i * Col + j].target(newHandsStroke);
      float newPatternStroke = random(.01, .5);
      interPatternStroke[i * Col + j].target(newPatternStroke);
      float newPatternRepeat = random(2, 100);
      interPatternRepeat[i * Col + j].target(newPatternRepeat);

    }
  }

}






