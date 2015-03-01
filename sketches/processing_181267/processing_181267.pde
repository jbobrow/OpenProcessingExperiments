
class pnt {
  float x, y;
  pnt(int px, int py) {
    x=float(px);
    y=float(py);
  }
  pnt(float px, float py) {
    x=px;
    y=py;
  }
}
class dotLine {
  pnt start,end;
  color dotColor, endColor, lineColor;
  float drad, dProgress, endRad,len;
  dotLine(pnt pstart, pnt pend, color pDotColor, color pEndColor, color pLineColor, float pdrad, float pdProgress, float pEndRad) {
    start = pstart;
    end = pend;
    dotColor = pDotColor;
    endColor = pEndColor;
    lineColor = pLineColor;
    drad = pdrad;
    dProgress=pdProgress;
    endRad=pEndRad;
    len = sqrt(pow((end.x-start.x),2)+pow((end.y-start.y),2));
  }
  void draw() {
    fill(endColor);
    ellipse(start.x,start.y,endRad,endRad);
    ellipse(end.x,end.y,endRad,endRad);
    fill(lineColor);
    line(start.x,start.y,end.x,end.y);
    float xDiff = end.x - start.x;
    float yDiff = end.x - start.x;
     
    float dPercent=((100/len)*dProgress)/100;
    float xNew = start.x + (xDiff * dPercent);
    float yNew = start.y + (yDiff * dPercent);
    fill(dotColor);
    tint(255,128);
    ellipse(xNew,yNew,drad,drad);
  }
}
pnt start,end;
color dotColor,lineColor,endColor;
dotLine test;
float progress;
boolean isAdding;
 
void setup() {
  size(800,600);
  start = new pnt(5,5);
  end = new pnt(450,450);
  dotColor=color(0,0,255);
  lineColor=color(255,255,255);
  endColor=color(255,255,255);
  test=new dotLine(start,end,dotColor,endColor,lineColor,10,15,5);
  isAdding=true;
}
void draw() {
  background(128);
  if ((progress>=test.len && isAdding==true)||(progress<=0 && isAdding==false)) {
    isAdding = !isAdding;
  } else if (isAdding==true) {
    test.end.x=test.end.x+1.5;
    test.end.y=test.end.y+1;
    test.start.x=test.start.x+1.5;
    test.start.y=test.start.y+1;
    progress=progress+5;
  } else if (isAdding==false) {
    test.end.x=test.end.x-1.5;
    test.end.y=test.end.y-1;
    test.start.x=test.start.x-1.5;
    test.start.y=test.start.y-1;
    progress=progress-5;
  }
  print(progress + " " + test.len + "\n");
  test.dProgress=progress;
  test.draw();
}

