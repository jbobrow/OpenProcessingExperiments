
import java.util.Date;

int REC_LEVEL = 8;

float hourA, minuteA, secondA;

int hourL = 40;
int minuteL = 55;
int secondL = 55;

void setup() {
  size(640, 640, P3D);
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, 0, -1, 0, 0);
  frameRate(30);
}

void draw() {
  background(0);
  translate( width/2, height/2 );
  smooth();
  
  Date now = new Date();
  int milli = int(now.getTime() % 1000);
  float fMilli = float(milli);
  float fSecond = float(second()) + fMilli / 1000.0;
  float fMinute = float(minute()) + fSecond / 60.0;
  float fHour = float(hour()) + fMinute / 60.0;
  
  hourA = fHour / 12.0 * TWO_PI;
  minuteA = fMinute / 60.0 * TWO_PI;
  secondA = fSecond / 60.0 * TWO_PI;
  
  drawHands(REC_LEVEL);
  
}

void drawHands(int level) {
  if( level == 0 ) {
    return;
  }
  
  if( level == REC_LEVEL ) {
    adjustedStroke(level);
    strokeWeight(3);
    line(0, 0, (level - REC_LEVEL) * 5, cos(hourA) * hourL, sin(hourA) * hourL, (level - REC_LEVEL - 1) * 5);
  }

  strokeWeight(2);
  adjustedStroke(level);
  line(0, 0, (level - REC_LEVEL) * 5, cos(minuteA) * minuteL, sin(minuteA) * minuteL, (level - REC_LEVEL - 1) * 5);
  
  if(level > 1) {
    pushMatrix();
    rotateZ(minuteA);
    translate(minuteL, 0);
    rotateZ(- hourA + PI);
    drawHands(level - 1);
    popMatrix();
  }
  
  strokeWeight(1);
  adjustedStroke(level);
  line(0, 0, (level - REC_LEVEL) * 5, cos(secondA) * secondL, sin(secondA) * secondL, (level - REC_LEVEL - 1) * 5);
  
  if(level > 1) {
    pushMatrix();
    rotateZ(secondA);
    translate(secondL, 0);
    rotateZ(- hourA + PI);
    drawHands(level - 1);
    popMatrix();
  }
  
}

void adjustedStroke(int level) {
  stroke(color(150 + 3 * (REC_LEVEL - level), 220, 70 + 12 * level), 255 * ((float)level / float(REC_LEVEL)));
}

void mouseClicked() {
  if( mouseButton == LEFT ) {
    REC_LEVEL++;
  }
  else if(REC_LEVEL > 1){
    REC_LEVEL--;
  }
}

