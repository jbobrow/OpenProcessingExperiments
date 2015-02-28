
PFont AvianBold48;
int hours;
int minutes;
int seconds;

void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(0, 0,200);
  strokeCap(ROUND);
  smooth();
  AvianBold48 = loadFont("AvianBold48.vlw");
}

void draw() {
  background(0, 0,200);
  noStroke();

  hours = hour();
  minutes = minute();
  seconds = second();
  println(hours + " " + minutes + " " + seconds);

  int rectX = 180;
  int rectY = 230;  

  for (int i = 0; i < minutes; i++) {
    fill(10,50,100);
    rect(rectX, rectY,10,10);

    if(rectX > 380) {              
      rectX = 180;                     
      rectY += 20;                    
    } 
    else {                       
      rectX += 20;                    
    }
  }

  fill(10,seconds,100);
  rect(rectX, rectY,10,10);
  noFill();

  int HrectX=0;
  int HrectY=0;

  if (hours>1) {
    HrectX=180+(10*hours);
  }
  else {
    HrectX=180;
  }

  for (int h = 0; h < hours; h++) {
    fill(94);

    rect(HrectX, HrectY,10,220);
  }

  int HtextX=180;
  int HtextY=220;

  if (hours>1) {
    HtextX=180+(10*hours);
  }
  else {
    HtextX=180;
  }

  fill(50);
  textFont(AvianBold48, 15);
  text(hours, HtextX, HtextY);
  fill(10,70,100);
  text(minutes, HtextX+20, HtextY);
  fill(20);
  text(".", HtextX+10, HtextY);
}


void mousePressed() {
  saveFrame("Drawing tool_r.jpg");
}


