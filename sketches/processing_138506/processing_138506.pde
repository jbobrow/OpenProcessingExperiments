
//very simple clock

TimeRect[] rects;
int rectWidth  = 100;

void setup() {
  size(500, 700);
  smooth();  
  rects = new TimeRect[5];
  
  for(int i = 0; i<rects.length; i++)
  rects[i] = new TimeRect(i*rectWidth,i);
  
}


void draw() {
  background(0);
  stroke(0);
  strokeWeight(0.2);
  fill(255);
  for(int i = 0; i<rects.length; i++)
  rects[i].draw();
  

}

class TimeRect {


  int x, y;
  int rectHeight;
  int margin;
  int timeValue;
  String timeNorm;
  float temp;


  //timeValue 0 month 1 day 2 hour 3 minute 4 second  

  TimeRect(int x_, int timeValue) {

    this.x = x_;
    this.y = 0;
    this.timeValue = timeValue;    
    this.rectHeight = 100;

    switch(timeValue)
    {
    case 0:
      margin = 12;
      timeNorm = "month";
      break;

    case 1:
      margin = 31;
      timeNorm = "day";
      break;

    case 2:
      margin = 24;
      timeNorm = "hour";
      break;

    case 3:
      margin = 60;
      timeNorm = "minute";
      break;

    case 4:
      margin = 60;
      timeNorm = "second";
      break;
    }
  }




  void draw() {

    temp = 0.0;
    ;
    switch(timeValue)
    {
    case 0:
      temp = month();
      break;

    case 1:
      temp = day();
      break;

    case 2:
      temp = hour();
      break;

    case 3:
      temp = minute();
      break;

    case 4:
      temp = second();
      break;
    }
    
    fill(255);

    float tempRectHeight = map(temp, 1, margin, 50, height-rectHeight);
    rect(x, y, rectWidth, tempRectHeight+rectHeight);
    fill(0);
    text(timeNorm,x+30,rectHeight-50);
    text((int)temp,x+40,tempRectHeight+50);
  }
}

