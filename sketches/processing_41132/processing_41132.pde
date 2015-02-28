
int millisRolloverTime;
int prevSec;

void setup()
{ 
size(1024, 768);
smooth();
strokeWeight(10);
noFill();
millisRolloverTime = 0;
}

void draw()
{
  
  background(255);
  int m = minute();
  int s = second();
  int h = hour()%12;
  
    if (prevSec != s) {
    millisRolloverTime = millis();
  }
 
  prevSec = s;
  int mils = millis() - millisRolloverTime;
  
  stroke(0, map(s+mils/1000.0, 0, 60, 255, 0));
  arc(width/2, height/2, 450, 450, 1.5*PI, 1.5*PI+map(s+mils/1000.0, 0, 60, 0, TWO_PI));
  stroke(0, map(m+s/60.0, 0, 60, 255, 0));
  arc(width/2, height/2, 300, 300, 1.5*PI, 1.5*PI+map(m+s/60.0, 0, 60, 0, TWO_PI));
  stroke(0);
  arc(width/2, height/2, 150, 150, 1.5*PI, 1.5*PI+map(h + m/60.0, 0, 12, 0, TWO_PI));
}
