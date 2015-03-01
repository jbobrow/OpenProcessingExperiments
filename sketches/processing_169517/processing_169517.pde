
Turd newTurd;
float time, duration;

//float newX;

float newheadwh;
color newheadc;

float newbellyw;
color newbellyc, newbellys;

float newnosew, newnoseh;
color newnosec, newnoses;

float newtiew, newtieh;
color newtiec, newties;

boolean over = false;
boolean pressed = false;

void setup() {
  size(750, 750);
  smooth();
  strokeJoin(ROUND);
  background(255);
  //noStroke();
  import processing.pdf.*;

  truecolor[0] = turd;
  truecolor[1] = jumpsuit;
  truecolor[2] = bowtie;
  truecolor[3] = skin;
  truecolor[4] = suitline;
  truecolor[5] = tieline;
  truecolor[6] = skinline;
  truecolor[7] = ground;

  newTurd = new Turd();

//  newX = random(100, 650);

  newtiew = random(20, 60);
  newtieh = random(15, 30);
  newtiec = truecolor[(int)random(0, truecolor.length)];
  newties = truecolor[(int)random(0, truecolor.length)];

  newheadwh = random(90, 200);
  newheadc = truecolor[(int)random(0, truecolor.length)];

  newbellyw = random(150, 300);
  newbellyc = truecolor[(int)random(0, truecolor.length)];
  newbellys = truecolor[(int)random(0, truecolor.length)];

  newnosew = random(50, 100);
  newnoseh = random(0, 50);
  newnosec = truecolor[(int)random(0, truecolor.length)];
  newnoses = truecolor[(int)random(0, truecolor.length)];

  duration = 200;
}

void draw() {
  beginRecord (PDF, "Lucero_Week_#.pdf");
  background(60);
  noFill();
  rect(10, 10, 20, 20);
  stroke(255);
  rect(10, 40, 20, 20);
  if (over == true) {
    fill(150);
  }
  else {
  }
  newTurd.draw();

  if (time <= duration) {
    time++;
  }
  endRecord();
}


