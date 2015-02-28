
void setup()
{
     size(450,450);
     background(0); 
     smooth();
}

void draw()
{
  background(0);
  noStroke();
  smooth();
  int x = 270;
  int y = 630;
   
  color HR   = color(0,51,153); // hour
  color MI  = color(255,255,255); // minute
  color SC   = color(255,0,0); // seconds
  color MSC = color(255,255,0); // millis

  int H    = hour(); // 0-23 
  int M   = minute(); // 0-59
  int S     = second(); // 0-59
  int MS  = millis(); // 0

  MS %=1000;
  MS = (int)map(MS,0,1000,0,59);
 
  int sY = (int)map(S,0,59,x,y);
  int msY = (int)map(MS,0,59,x,y);
  int mY = (int)map(M,0,59,x,y);
  int hY = (int)map(H,0,12,x,y);
  int hYpmn = (int)map(H,13,23,x,y);
  int hYpm = (int)map(H,13,23,x,y);
 
  fill(HR);
  arc(225,225,400,400,radians(x),radians(hY));
  fill(0,102,153);
  arc(225,225,400,400,radians(x),radians(hYpm));
  fill(MI);
  arc(225,225,300,300,radians(x),radians(mY));
  fill(SC);
  arc(225,225,200,200,radians(x),radians(sY));
  fill(MSC);
  arc(225,225,100,100,radians(x),radians(msY));
}



