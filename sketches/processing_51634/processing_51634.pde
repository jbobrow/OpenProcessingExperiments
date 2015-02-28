
int numOfArcs = 25;
int strokeWidth = 20;
int rDist = 0;
int rc;
LightArc lArcsMobile[] = new LightArc[numOfArcs];
 
void setup(){
  //do not change, this is fixed for LED screens.
  size(512, 160); 
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);
  smooth();
  strokeWeight(strokeWidth);
  strokeCap(SQUARE);
  for(int i=0;i<numOfArcs;i++){
    rDist = i * 30;
    rc = round(random(255));
    lArcsMobile[i] = new LightArc(rDist,rc);
  }
  noFill();
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
  int arcColour;
  int direction;
   
  LightArc(int tempDia, int c){
    arcStartDeg = random(0,360);
    arcLength = random(0,360);
    arcStopDeg = arcStartDeg + arcLength;
    dia = tempDia;
    arcColour = c;
    direction = round(random(0,1));
    speed = random(1,1);
  }
   
  void update(){
    arcStartRad = radians(arcStartDeg);
    arcStopRad = radians(arcStopDeg);
    stroke(255,0,0);
    arc(width/2+100,height/2,dia,dia,arcStartRad,arcStopRad);
    if(direction > 0){
      arcStartDeg+= speed;
      arcStopDeg+= speed;
    } else {
      arcStartDeg-= speed;
      arcStopDeg-= speed;
    }   
  }
}

