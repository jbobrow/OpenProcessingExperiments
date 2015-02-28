
int numOfArcs = 22;
int strokeWidth = 11 ;
int rDist = 1;
LightArc lArcsMobile[] = new LightArc[numOfArcs];
 
void setup(){
  size(500,500);
  noFill();
  smooth();
  strokeWeight(strokeWidth);
  strokeCap(ROUND);
  for(int i=0;i<numOfArcs;i++){
    rDist = i * 20;
    lArcsMobile[i] = new LightArc(rDist,0);
  }
}
 
void draw(){
  background(0,0);

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
    arcStartDeg = random(0,360);
    arcLength = random(0,360);
    arcStopDeg = arcStartDeg + arcLength;
    dia = tempDia;
    arcColour = (255,255,155);
    direction = round(random(0,1));
    speed = random(0.05,(11.));
  }
   
  void update(){
    arcStartRad = radians(arcStartDeg);
    arcStopRad = radians(arcStopDeg);
    stroke(arcColour);
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

                                                                                
