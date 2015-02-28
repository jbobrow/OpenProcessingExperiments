
color r = color(255,100,100);
color g = color(100,255,100);
color b = color(100,100,255);
int numOfArcs = 15;
int strokeWidth = 10;
int rDist = 0;
LightArc lArcsMobile[] = new LightArc[numOfArcs];

void setup(){
  size(900,450);
  noFill();
  smooth();
  strokeWeight(strokeWidth);
  strokeCap(SQUARE);
  for(int i=0;i<numOfArcs;i++){
    rDist = i * 20;
    lArcsMobile[i] = new LightArc(rDist,b);
  }
}

void draw(){
  background(0);
  for(int j = 0; j < numOfArcs; j++){
    lArcsMobile[j].update();
  }
}

class LightArc {
  int randAlph;
  int dia;
  float arcStartDeg;
  float arcStopDeg;
  float arcStartRad;
  float arcStopRad;
  float arcLength;
  int xPos;
  int yPos;
  float speed;
  color arcColour;
  int direction;
  
  LightArc(int tempDia, color c){
    randAlph = round(random(50,200));
    arcStartDeg = random(0,360);
    arcLength = random(0,360);
    arcStopDeg = arcStartDeg + arcLength;
    dia = tempDia;
    arcColour = c;
    direction = round(random(0,1));
    speed = random(0.1,1);
  }
  
  void update(){
    arcStartRad = radians(arcStartDeg);
    arcStopRad = radians(arcStopDeg);
    stroke(arcColour,randAlph);
    arc(width/2,height/2,dia,dia,arcStartRad,arcStopRad);
    if(direction > 0){
      arcStartDeg+= speed;
      arcStopDeg+= speed;
    } else {
      arcStartDeg-= speed;
      arcStopDeg-= speed;
    }    
  }
}                               
