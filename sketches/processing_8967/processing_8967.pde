
//VARIABLES

color bg = color(9, 0, 57);
color green1 = color(38, 102, 71);
color green2 = color(100, 163, 82);
color red1 = color(112, 3, 14);
color red2 = color(58, 18, 20);

int diam = 130;
int x = 230;
int y = 240;
int x2 = 410;
int y2 = 240;

float pupilX = map(mouseX, 0, width, 215, 265); 
float pupilY = map(mouseY, 0, height, 230, 240);
float pupilA = map(mouseX, 0, width, 375, 425);

float angle = 0;
float scalar = 1;
float angleInc = PI / 2.5;
float s;


//SETUP

void setup(){
  size(640, 480);
  background(9, 0, 57);
  noStroke();

}

//DRAW

void draw(){
  smooth();
  noStroke();
  background(bg);

  fill(17, 13, 56);
  ellipse(x, y, diam+20, diam+20);
  ellipse(x2, y2, diam+20, diam+20);
  fill(22, 16, 72);
  ellipse(x, y, diam+5, diam+5);
  ellipse(x2, y2, diam+5, diam+5);


  s = sin(angle) * scalar;
  angle = angle + angleInc;

  if(mousePressed){
    fill(red1);
    translate(s*1.5, 0);
  }
  else {
    fill(green1);
  }
  ellipse(x, y, diam-20, diam-20);
  ellipse(x2, y2, diam-20, diam-20);


  if(mousePressed){
    fill(red2);
  }
  else {
    fill(green2);
  }
  ellipse(x, y, diam-35, diam-35);
  ellipse(x2, y2, diam-35, diam-35);
  fill(0);
  ellipse(x, y, diam-45, diam-45);
  ellipse(x2, y2, diam-45, diam-45);

  fill(255);
  float pupilX = map(mouseX, 0, width, 198, 262); 
  float pupilY = map(mouseY, 0, height, 210, 265); 
  float pupilA = map(mouseX, 0, width, 377, 442); 
  ellipse(pupilX, pupilY, 20, 20); //left pupil 
  ellipse(pupilA, pupilY, 20, 20); //right pupil


  if(mousePressed){
    fill(bg);
    ellipse(320, 140, 270, 270);
  }

}

void mouseReleased(){
  setup();
}










