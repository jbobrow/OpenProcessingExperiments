
import penner.easing.*;
import gifAnimation.*;
GifMaker export;
boolean first = true;



//List of lines
public ArrayList<cLine> lines1, lines2;

cLine test;
void setup() {
  size(700, 700);
  test = new cLine(10, 10, 90, 90);
  lines1 = new ArrayList<cLine>();
  lines2 = new ArrayList<cLine>();
  for (int x = 0; x <initDur; x++) {
    lines1.add(new cLine(0, 0, 350, Cubic.easeInOut(time, 0, 700, initDur)));
    time ++;
  }
  time = 0;
  for (int x = 0; x <initDur; x++) {
    lines2.add(new cLine(700, 700, Cubic.easeInOut(time, 0, 700, initDur), 350));
    time ++;
  }

  export =  new GifMaker(this, "export.gif");
  export.setRepeat(0); 

  strokeWeight(2);
}
float time, tTime = 0;
float t1, t2, t3, t4 = 0;
float r = 0;
float g = 189;
float b = 57;
float initDur = 30;
float moveDur = 90;
int initIdex = 0;
void draw() {
background(255);
  drawBackground();
  /*
  if (first) {
   //fourth goes from 0 to 700
   lines.add(new cLine(0, 0, 350, Cubic.easeInOut(time, 0, 700, initDur)));
   
   println(tTime);
   if (time<initDur) {
   time ++;
   }
   
   else if (time >= initDur) {
   tTime ++;
   }
   if (tTime > 5) {
   first = false;
   time = 0;
   }
   }
   */
  moveStartPoint();



  for (int x = 0; x < lines1.size(); x++) {
    lines1.get(x).drawLine();
    //lines2.get(x).drawLine();
  }
 // export.setDelay(20);
 // export.addFrame();
}

public class cLine {
  float sX, sY, eX, eY;
  cLine(float sx_, float sy_, float ex_, float ey_) {
    sX = sx_;
    sY = sy_;
    eX = ex_;
    eY = ey_;
  }
  void drawLine() {
    line(sX, sY, eX, eY);
  }
  void setSX(float v) {
    sX = v;
  }
  void setSY(float v) {
    sY = v;
  }
  void setEX(float v) {
    eX = v;
  }
  void setEY(float v) {
    eY = v;
  }
}
void drawBackground() {
  noStroke();
  int cSize = 250;
  fill(0, 123, 37);
  //rect(0, 0, 350, 350);
  
  fill(2,81,103);
  //rect(0,350,350,350);
  
  fill(166,84,0);
  //rect(350,350,350,350);
  
  fill(166,23,0);
  //rect(350,0,350,350);
  
  fill(55,222,106);
  ellipse(0,0,cSize,cSize);
  
  fill(57,174,207);
  ellipse(0,700,cSize,cSize);
  
  fill(255,160,64);
  ellipse(700,700,cSize,cSize);
  
  fill(255,90,64);
  ellipse(700,0,cSize,cSize);
  
  stroke(r,g,b);
}
void moveStartPoint() {

  if (t1 < moveDur) {
    for (int x = 0; x < lines1.size(); x++) {
      lines1.get(x).setSY(Cubic.easeInOut(t1, 0, 700, moveDur));
    }
    r = setStroke(0, 5, t1);
    g = setStroke(189, 125, t1);
    b = setStroke(57, 159, t1);
    stroke(r, g, b);

    t1 ++;
  }

  else if (t2< moveDur) {
    for (int x = 0; x < lines1.size(); x++) {
      lines1.get(x).setSX(Cubic.easeInOut(t2, 0, 700, moveDur));
    }
    r = setStroke(5, 255, t2);
    g = setStroke(125, 129, t2);
    b = setStroke(159, 0, t2);
    stroke(r, g, b);

    t2 ++;
  }

  else if (t3 < moveDur) {
    for (int x = 0; x < lines1.size(); x++) {
      lines1.get(x).setSY(Cubic.easeInOut(t3, 700, -700, moveDur));
    }
    r = setStroke(255, 255, t3);
    g = setStroke(129, 35, t3);
    b = setStroke(0, 0, t3);
    stroke(r, g, b);

    t3 ++;
  }

  else if (t4<moveDur) {
    for (int x = 0; x < lines1.size(); x++) {
      lines1.get(x).setSX(Cubic.easeInOut(t4, 700, -700, moveDur));
    }
    r = setStroke(255, 0, t4);
    g = setStroke(35, 189, t4);
    b = setStroke(0, 57, t4);
    stroke(r, g, b);

    t4 ++;
  }

  else {
    t1 = 0;
    t2 = 0;
    t3 = 0;
    t4 = 0;
    export.finish();
  }
}

float setStroke(float s, float e, float time) {
  return Cubic.easeInOut(time, s, e-s, moveDur);
}



