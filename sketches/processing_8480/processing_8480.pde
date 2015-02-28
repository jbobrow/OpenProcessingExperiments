
int ln_s = 100;
int ln_m = 85;
int ln_h = 70;
int frameWidth = 300;
int frameHeight = 300;
PFont myFont;

// unitAngle setup
float unitAngle = TWO_PI*6/360;
float secondAngle = TWO_PI*6/360;
float minuteAngle = TWO_PI/3600;
float hourAngle = TWO_PI*30/360;
float hourPlus = TWO_PI*1/720;

// setup the center of clock
int centerX = frameWidth/2;
int centerY = frameHeight/2;

void setup () {
  size(300,300);
  frameRate(20);
  smooth();
  background(0);
  myFont = loadFont("Verdana-48.vlw");
  textFont(myFont,24);
}


void draw() {
  SECOND();
  MINUTE();
  HOUR();
  noStroke();
  fill(0,15);
  rect(0,0,frameWidth,frameHeight);
  NUMBER();
  // It's a lazy way to get thumbnail for upload.
  if (keyPressed == true) {
    saveFrame("thumbnail.jpg");
  }
}

void SECOND () {
  int s = second();  // Values from 0 - 59
  int x_coord = int(ln_s*cos(s * secondAngle + 1.5*PI));
  int y_coord = int(ln_s*sin(s * secondAngle + 1.5*PI));
  strokeWeight(1);
  stroke(255);
  line(centerX, centerY, centerX+x_coord, centerY+y_coord);
}

void MINUTE () {
  int m = minute();  // Values from 0 - 59
  int x_coord = int(ln_m*cos(m * unitAngle + 1.5*PI));
  int y_coord = int(ln_m*sin(m * unitAngle + 1.5*PI));
  strokeWeight(3);
  stroke(255);
  line(centerX, centerY, centerX+x_coord, centerY+y_coord);
}

void HOUR() {
  int h = hour();    // Values from 0 - 23
  int m = minute();
  // hourPlus make the hour hand move in every minute.
  // for example, at 3:30, the hour hand will between 3 and 4.
  int x_coord = int(ln_h*cos(h * hourAngle + m * hourPlus + 1.5*PI));
  int y_coord = int(ln_h*sin(h * hourAngle + m * hourPlus + 1.5*PI));
  int x_offset1 = int(0.2*ln_h*cos(h * hourAngle + m * hourPlus + 1.5*PI + 0.1*PI));
  int y_offset1 = int(0.2*ln_h*sin(h * hourAngle + m * hourPlus + 1.5*PI + 0.1*PI));
  int x_offset2 = int(0.2*ln_h*cos(h * hourAngle + m * hourPlus + 1.5*PI - 0.1*PI));
  int y_offset2 = int(0.2*ln_h*sin(h * hourAngle + m * hourPlus + 1.5*PI - 0.1*PI));
  int topX = int(0.25*ln_h*cos(h * hourAngle + m * hourPlus + 0.5*PI));
  int topY = int(0.25*ln_h*sin(h * hourAngle + m * hourPlus + 0.5*PI));
  noStroke();
  fill(255,0,0);
  quad(centerX+topX,centerX+topY,centerX+x_offset1,centerX+y_offset1,centerX+x_coord,centerX+y_coord,centerX+x_offset2,centerX+y_offset2);
}

void NUMBER() {
  int current = hour();
  textAlign(CENTER);
  int[] COLOR = new int[12];
  for(int i = 0; i < 12; i++) {
    int NUM = i;
    int x_coord = int((centerX-30)*cos(i * hourAngle + 1.5*PI));
    int y_coord = int((centerY-30)*sin(i * hourAngle + 1.5*PI));
    if (i == 0){
      NUM = i+12;
    }
    if(current > 12){
      current = current -12;
    }
    if(i == current){
      COLOR[i] = 255;
    }
    else {
      COLOR[i] = 25;
    }

    fill(COLOR[i]);
    text(NUM,x_coord+centerX,y_coord+centerY);
  }
  //print(current);
}






