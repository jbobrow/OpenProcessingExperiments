
int numOfArcs = 25;
int strokeWidth = 2;
int rDist = 0;
LightArc lArcs[] = new LightArc[numOfArcs];


void setup(){
  size(800,400);
  noFill();
  smooth();
  strokeWeight(strokeWidth);
  strokeCap(SQUARE);
  for(int i = 0 ; i < numOfArcs; i++){
    rDist = round(random(5,200));   
    lArcs[i] = new LightArc(rDist);
  }
}

void draw(){
  background(0);
  for(int j = 0; j < numOfArcs; j++){
    lArcs[j].update();
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
  color c;
  int direction;
  
  LightArc(int x){
    randAlph = round(random(50,150));
    arcStartDeg = random(0,360);
    arcLength = random(0,360);
    arcStopDeg = arcStartDeg + arcLength;
    dia = x;
    c = color(100,100,255);
    direction = round(random(0,1));
    
  }
  
  void update(){
    arcStartRad = radians(arcStartDeg);
    arcStopRad = radians(arcStopDeg);
    stroke(c,randAlph);
    arc(width/2,height/2,dia,dia,arcStartRad,arcStopRad);
    if(direction > 0){
      arcStartDeg++;
      arcStopDeg++;
    } else {
      arcStartDeg--;
      arcStopDeg--;
    }    
  }
}
