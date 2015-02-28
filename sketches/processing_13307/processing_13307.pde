
class Color {
  int r,g,b;

  Color(int r,int g,int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  int getRed() { 
    return r;
  }
  int getGreen() { 
    return g;
  }
  int getBlue() { 
    return b;
  }
  void setRed(int r) {
    this.r = r;
  }
  void setGreen(int g) {
    this.g = g;
  }
  void setBlue(int b) {
    this.b = b;
  }
}

class Point {
  PVector pos, vel, noiseVec;
  float nfloat, maxLayer, layer;
  boolean display;
  boolean trans = false;
  Color tColor;

  Point(PVector pos, PVector vel, float maxLayer,Color tc) {
    this.pos = pos;
    this.vel = vel;
    this.maxLayer = maxLayer;
    layer = 0;
    display = true;
    noiseVec = new PVector();
    tColor = new Color(tc.getRed(),tc.getGreen(),tc.getBlue());
    if(random(0,1)<0.5) trans = true;
  }

  void update() {

    nfloat = noise(pos.x * 0.0025, pos.y * 0.0025, frames * 0.001);
    /*tColor.setRed(tColor.getRed() + (int)(nfloat * 2));
    tColor.setGreen(tColor.getGreen() + (int)(nfloat * 2));
    tColor.setBlue(tColor.getBlue() + (int)(nfloat * 2));*/

    if(trans) {
      noiseVec.x = cos(((nfloat -0.3) * TWO_PI) * 10);
      noiseVec.y = sin(((nfloat - 0.3) * TWO_PI) * 10);
    }
    else {
      noiseVec.y = cos(((nfloat -0.3) * TWO_PI) * 10);
      noiseVec.x = sin(((nfloat - 0.3) * TWO_PI) * 10);
    }

    vel.add(noiseVec);
    vel.div(2);
    pos.add(vel);

    if(layer == maxLayer || pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height) {
      display = false;
      return;
    }

    layer++;
  }

  float getPercentage() { 
    return ((float)layer/maxLayer);
  }
}

PShape img;
Color initColor;
ArrayList points;
int frames = 0;
float ranx,rany;
int maxPoints = 20000;
PFont font;
int showStringIndex = 360;
int showRect1Index = 690;
int showRect2Index = 760;
int showRect3Index = 820;
int showRect4Index = 880;
int showRect5Index = 1040;

void setup() {
  size(640,480);

  img = loadShape("string.svg");
  int temp = (int)random(0,255);
  initColor = new Color(temp,temp,temp);

  smooth(); 

  ranx = random(280,360);
  rany = random(210,270);

  points = new ArrayList();
  temp = (int)random(30,50);
  for(int i=0;i < temp; i++) {
    points.add(new Point(new PVector(ranx,rany), new PVector(0,0), random(150,250),initColor));
  }

  background(255);
  noStroke();
  
  font = loadFont("Backslash-32.vlw");
  //createFont("Backslash", 72);
  textFont(font);
}

void draw() {
  if(points.size() <= maxPoints) {
    int temp = (int)random(0,30);
    Color tempColor = new Color(initColor.getRed(),initColor.getGreen(),initColor.getBlue());
    if(temp > 4 && temp < 10) { 
      initColor.setRed(70); 
      initColor.setGreen(70); 
      initColor.setBlue(70);
    }
    else if(temp > 9 && temp < 15) { 
      initColor.setRed(140); 
      initColor.setGreen(140); 
      initColor.setBlue(140);
    }
    else if(temp > 14) { 
      initColor.setRed(210); 
      initColor.setGreen(210); 
      initColor.setBlue(210);
    }

    for(int i=0;i < temp; i++) {
      points.add(new Point(new PVector(ranx,rany), new PVector(0,0), random(200,300),initColor));
    }

    initColor.setRed(tempColor.getRed());
    initColor.setGreen(tempColor.getGreen());
    initColor.setBlue(tempColor.getBlue());
  }

  for(int i = 0; i < points.size(); i++) {
    Point tempPoint = (Point) points.get(i);
    if(!tempPoint.display) {
      points.remove(i);
    }
    tempPoint.update();
    fill(tempPoint.tColor.getRed(),tempPoint.tColor.getGreen(),tempPoint.tColor.getBlue(),10);
    ellipse(tempPoint.pos.x, tempPoint.pos.y, 1-tempPoint.getPercentage(), 1-tempPoint.getPercentage());
  }

  frames ++;
  
  if(frames >= showStringIndex && frames < showStringIndex + 35){
    fill(70,70,70,3);
    text("A river of time...", ranx-30, rany+20);
  }else if(frames >= showRect1Index && frames < showRect1Index + 120){
    fill(60,60,60,2);
    rect(30, 470 - 2 * (frames - showRect1Index) + 1 , 4, 2 * (frames - showRect1Index) + 1);
  }else if(frames >= showRect2Index && frames < showRect2Index + 70){
    fill(60,60,60,3);
    rect(620, 10, 6, 2 * (frames - showRect1Index) + 1);
  }else if(frames >= showRect3Index && frames < showRect3Index + 70){
    fill(60,60,60,3);
    rect(540, 460, frames - showRect3Index + 1, 6);    
  }else if(frames >= showRect4Index && frames < showRect4Index + 50){
    fill(60,60,60,1);
    rect(60, 19, 3 * (frames - showRect4Index) + 1, 4);        
  }else if(frames >= showRect5Index && frames < showRect5Index + 35){
    fill(0,0,0,7);
    text("without an end...", ranx-30, rany+30);
  }else if(frames > showRect5Index + 35 && frames % 79 == 0){
    ranx = random(0,640);
    rany = random(0,480);
  }
}


