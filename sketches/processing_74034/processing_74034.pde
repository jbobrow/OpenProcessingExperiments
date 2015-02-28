
import geomerative.*;
import org.json.*;
import processing.pdf.*;

RShape drawing;
//RPoint[] pnts1, pnts2, tans;
int k0 = -135;
int k1 = -180;
int k2 = -90;
int k3 = -45;
int k4 = -225;
int k5 = 0;
int premillis = 0;
float x1, x2, y1, y2;

int deg = 0;
float compass = 0;

float la = 42.954;
float lo = -78.820;
SunPos sun;

String weatherStr;
int SR, UV, PR;
String icon;
PImage img;
PFont myFont;

void setup()
{
  size(1280, 720);
  //size(1280, 720, PDF, "test.pdf");
  myFont = createFont("DINOT-Regular", 24);
  textFont(myFont);
  //g.smooth = true;
  background(255);
  //frameRate(60);
  smooth();
  noFill();
  strokeCap(SQUARE);
  RG.init(this);
  drawing = RG.loadShape("data/2.svg");
  //println(drawing.children[0].countChildren());
  translate(360, 360);
  loadSunPos();
  println(sun.elevation + " " + sun.azimuth);
  loadJsonData();
  weatherCheck();
  image(img, -370, -340);
  println(weatherStr + " " + SR + " " + UV + " " + PR);
}

void draw()
{
  //UV = 3;
  compass = (frameCount/5) % 360;
  background(255);
  translate(360, 360);
  fill(0);
  textAlign(LEFT);
  if (minute() < 10)
    text("Time: " + hour() + ":0" + minute(), -330, 240);
  else
    text("Time: " + hour() + ":" + minute(), -330, 240);
  text("Direction: " + int(compass) + "°", -330, 264);
  if (sun.elevation > 0) {
    text("Sun Azimuth: " + int(sun.azimuth) + "°", -330, 288);
    text("Sun Elevation: " + int(sun.elevation) + "°", -330, 312);
  }
  else {
    text("Sun Azimuth: NA", -330, 288);
    text("Sun Elevation: NA", -330, 312);
  }  
  text("UV Level: " + UV + "/16", -330, 336);
  noFill();
  strokeWeight(3);
  ellipse(0, 0, 7, 7);
  loadSunPos();
  noFill();
  //println(compass);
  UVCheck();
  compassCheck();
  image(img, -330, -340);
  //println(compass);

  if (millis() - premillis >= 6010) {
    loadJsonData();
    weatherCheck();
    premillis = millis();
  }

  //die folgenden einstellungen beinflussen wieviele punkte die
  //polygone am ende bekommen werden.
  //The following settings will define how many points used to construct the polygon

  //RCommand.setSegmentStep(3);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);

  //RCommand.setSegmentOffset(0);
  //RCommand.setSegmentLength(15);
  //RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);

  if (1 == 1) {
    if (k4 < int(deg) - 225) {
      k4++;
    }
    else if (k4 > int(deg) - 225) {
      k4--;
    }
    k4 = max(k4, -225);
    k1 = max(k4, -180);
    k0 = max(k4, -135);
    k2 = max(k4, -90);
    k3 = max(k4, -45);
  }

  showItem(4, k4);
  showItem(1, k1);
  showItem(0, k0);
  showItem(2, k2);
  showItem(3, k3);
  showItem(5, k5);

  drawLine(4, 1, k4, k1, 3);
  drawLine(1, 0, k1, k0, 3);
  drawLine(0, 2, k0, k2, 3);
  drawLine(2, 3, k2, k3, 3);
  drawLine(3, 5, k3, k5, 1);

  deg = 0;
  //exit();
}

void showItem(int item, int k) {
  rotate(radians(-k));
  strokeWeight(6);
  curveTightness(1);
  beginShape();
  RPoint[] pnts = drawing.children[item].getPoints();
  //noFill();
  //float leng = drawing.children[item].getCurveLength();
  //RPoint[] pnts = new RPoint[int(leng/10)+1];//drawing.children[item].getPoints();
  //println(int(leng/10) + " " + pnts.length);
  //for (int step = 0; step <= int(leng/10); step++) {
  //float t = float(step)/int(leng/10);
  //println(t);
  //pnts[step] = drawing.children[item].getPoint(t);
  //}
  for (int i = 0; i < int(pnts.length); i++) {
    //ellipse(pnts[i].x - 334.021, pnts[i].y - 375.061, 2, 2);
    if ((i % 2 == 0) || (i < 5) || (i > pnts.length-6)) {
      curveVertex(pnts[i].x - 334.021, pnts[i].y - 375.061);
    }
  }
  endShape();
  strokeWeight(1);
  rotate(radians(k));
}

void drawLine(int i, int j, int l, int m, int th) {
  RPoint[] pnts1 = drawing.children[i].getPoints();
  RPoint[] pnts2 = drawing.children[j].getPoints();
  //float leng1 = drawing.children[i].getCurveLength();
  //RPoint[] pnts1 = new RPoint[int(leng1/5)];//drawing.children[item].getPoints();
  //for (int step = 0; step < int(leng1/5); step++) {
  //float t = float(step)/int(leng1/5);
  //println(t);
  //pnts1[step] = drawing.children[i].getPoint(t);
  //}
  //float leng2 = drawing.children[j].getCurveLength();
  //RPoint[] pnts2 = new RPoint[int(leng2/5)];//drawing.children[item].getPoints();
  //for (int step = 0; step < int(leng2/5); step++) {
  //float t = float(step)/int(leng2/5);
  //println(t);
  //pnts2[step] = drawing.children[j].getPoint(t);
  //}
  //RPoint[] pnts2 = drawing.children[j].getPoints();
  //float leng = drawing.children[j].getCurveLength();
  //pnts2 = new RPoint[int(leng/3)];
  //tans = new RPoint[int(leng/3)];
  //for (int step = 0; step < int(leng/3); step++) {
  //float t = float(step)/int(leng/3);
  //println(step + " " + t);
  //pnts2[step] = drawing.children[j].getPoint(t);
  //tans[step] = drawing.children[j].getTangent(t);
  //}
  //println(pnts2.length + " " + leng/pnts2.length);
  //for (int t = 0; t < tans.length; t++) {
  //x2 = cos(radians(-m))*(pnts2[t].x-334.021) - sin(radians(-m))*(pnts2[t].y-375.061);
  //y2 = sin(radians(-m))*(pnts2[t].x-334.021) + cos(radians(-m))*(pnts2[t].y-375.061);
  //float dx = x2 - x1;
  //float dy = y2 - y1;
  //println(dy/dx);
  //float tanx2 = cos(radians(-m))*(tans[tans.length-1].x-334.021) - sin(radians(-m))*(tans[tans.length-1].y-375.061);
  //float tany2 = sin(radians(-m))*(tans[tans.length-1].x-334.021) + cos(radians(-m))*(tans[tans.length-1].y-375.061);
  //println(tany2/tanx2);
  //if (abs(dx/dy - tany2/tanx2) < 0.05) {
  //println("tangential");
  //line(x1,y1,x2,y2);
  //}
  //}
  x1 = cos(radians(-l))*(pnts1[pnts1.length-1].x-334.021) - sin(radians(-l))*(pnts1[pnts1.length-1].y-375.061);
  y1 = sin(radians(-l))*(pnts1[pnts1.length-1].x-334.021) + cos(radians(-l))*(pnts1[pnts1.length-1].y-375.061);
  x2 = cos(radians(-m))*(pnts2[pnts2.length-1].x-334.021) - sin(radians(-m))*(pnts2[pnts2.length-1].y-375.061);
  y2 = sin(radians(-m))*(pnts2[pnts2.length-1].x-334.021) + cos(radians(-m))*(pnts2[pnts2.length-1].y-375.061);
  noFill();
  //curve(x1, y1, (x1 + x2)/2, (y1 + y2)/2, x2, y2);
  //int steps = 6;
  //for (int ii = 0; ii <= steps; ii++) {
  //float t = ii / float(steps);
  //float x = curvePoint(x1, (x1 + x2)/3, 2*(x1 + x2)/3, x2, t);
  //float y = curvePoint(y1, (y1 + y2)/3, 2*(y1 + y2)/3, y2, t);
  //float x = curvePoint(5, 73, 73, 15, t);
  //float y = curvePoint(26, 24, 61, 65, t);
  //ellipse(x, y, 5, 5);
  //float tx = curveTangent(x1, (x1 + x2)/3, 2*(x1 + x2)/3, x2, t);
  //float ty = curveTangent(y1, (y1 + y2)/3, 2*(y1 + y2)/3, y2, t);
  //float ty = curveTangent(26, 24, 61, 65, t);
  //float a = atan2(ty, tx);
  //a -= PI/2.0;
  //line(x, y, cos(a)*8 + x, sin(a)*8 + y);
  //}
  strokeWeight(th);
  line(x1, y1, x2, y2);
  //curveTightness(0);
  //beginShape();
  //curveVertex(x1,y1);
  //curveVertex((x1+x2)/3,(y1+y2)/3);
  //curveVertex(2*(x1+x2)/3,2*(y1+y2)/3);
  //curveVertex(x2,y2);
  //endShape();
  fill(255);
  strokeWeight(2);
  ellipse(x1, y1, 5, 5);
  ellipse(x2, y2, 5, 5);
  noFill();
  strokeWeight(1);
}

void loadJsonData() {
  String[] json = loadStrings("http://api.wunderground.com/api/d876dd1192a0aa65/conditions/q/NY/Buffalo.json");
  //String[] json = loadStrings("Buffalo.json");
  //println(json);
  for (int i = 0; i < json.length; i++) {
    if (json[i].length() >= 10) {
      if (json[i].substring(3, 10).equals("weather")) {
        //println(i);
        weatherStr = json[i].substring(13, json[i].length()-2);
        //println(weatherStr);
      }
    }
    if (json[i].length() >= 8) {
      if (json[i].substring(3, 8).equals("solar")) {
        //println(i);
        SR = int(json[i].substring(20, json[i].length()-2));
        //println(SR);
      }
    }
    if (json[i].length() >= 5) {
      if (json[i].substring(3, 5).equals("UV")) {
        //println(i);
        UV = int(trim(json[i]).substring(8, json[i].length()-2));
        //println(UV);
      }
    }
    if (json[i].length() >= 20) {
      if (json[i].substring(3, 20).equals("precip_1hr_metric")) {
        //println(i);
        PR = int(json[i].substring(25, json[i].length()-2));
        //println(PR);
      }
    }
    if (json[i].length() >= 8) {
      if (json[i].substring(2, 8).equals("\"icon\"")) {
        //println(i);
        icon = "http://icons.wxug.com/i/c/i/" + json[i].substring(10, json[i].length()-2) + ".gif";
        //println(icon);
      }
    }
  }
}

void compassCheck() {
  //println(sun.elevation);
  if (sun.elevation > 0 && sun.elevation < 20 && abs(compass - sun.azimuth) < 20) {
    deg = 0;
    //println(deg);
  }
}

void loadSunPos() {
  int mo = month();
  int da = day();
  int ho = hour();
  int mi = minute();
  int se = second();
  sun = new SunPos(la, lo, mo, da, ho, mi, se, -4);

  ellipse(580, 0, 300, 300);
  textAlign(CENTER, CENTER);
  line(580, -145, 580, -155);
  text("N", 580, -190);
  line(580, 145, 580, 155);
  text("S", 580, 180);
  line(425, 0, 435, 0);
  text("W", 400, -5);
  line(725, 0, 735, 0);
  text("E", 760, -5);

  translate(580, 0);

  textSize(10);
  for (int d = 0; d < 36; d++) {
    rotate(radians(d*10));
    text(d*10, 0, -140);
    rotate(-radians(d*10));
  }
  textSize(24);

  if (sun.elevation > 0) {
    rotate(radians(sun.azimuth));
    float sunlen = cos(radians(sun.elevation));
    strokeWeight(1);
    line(0, 0, 0, -150*sunlen);
    strokeWeight(32);
    stroke(60);
    fill(60);
    line(0, 0, 0, 100*sunlen);
    noStroke();
    ellipse(0, 100*sunlen, 32, 30*sin(radians(sun.elevation)));
    strokeWeight(3);
    stroke(0);
    fill(255, 200, 0);
    ellipse(0, -150*sunlen, 30, 30);
    rotate(radians(-sun.azimuth));
  }

    fill(255);
    rotate(radians(compass)- PI);
    strokeWeight(3);
    //triangle(-25, -25*sqrt(3)/3, 25, -25*sqrt(3)/3, 0, 50*sqrt(3)/3);
    fill(255,0,0);
    strokeWeight(0);
    triangle(-12.5, 7.2169, 12.5, 7.2169, 0, 75*sqrt(3)/3);
    strokeWeight(3);
    //line(-25,-25*sqrt(3)/3,25,-25*sqrt(3)/3);
    //line(-25,-25*sqrt(3)/3,0,50*sqrt(3)/3);
    //line(0,50*sqrt(3)/3,25,-25*sqrt(3)/3);
    rotate(radians(-compass) - PI);

    translate(-580, 0);

  if (sun.elevation > 0) {
    fill(255, 200, 0);
    float sunele = acos((cos(radians(compass - sun.azimuth)))*cos(radians(sun.elevation)))-PI/2;
    //println(degrees(sunele)-90);
    rotate(sunele);
    //stroke(255,200,0);
    ellipse(0, -320, 30, 30);
    strokeWeight(1);
    line(0, -4, 0, -305);
    //stroke(0);
    rotate(-sunele);
  }

    strokeWeight(3);
    fill(255);
    ellipse(580, 0, 30, 30);
    noFill();
  //}
}

void weatherCheck() {
  if (weatherStr.indexOf("Rain") != -1) {
    deg = 225;
    //println("Rain");
  }
  img = loadImage(icon);
}

void UVCheck() {
  //print(abs(compass - sun.azimuth) + " ");
  if (UV > 2 && abs(compass - sun.azimuth) >= 90 && abs(compass - sun.azimuth) <= 270) {
    deg = int(map(degrees(acos(abs(cos(radians(compass - sun.azimuth)))*cos(radians(sun.elevation)))), 0, 90, 90, 225));
    //println(UV);
  }
  else if (UV > 2 && (abs(compass - sun.azimuth) < 90 || abs(compass - sun.azimuth) > 270)) {
    deg = 225;
    //println("2");
  }
}


