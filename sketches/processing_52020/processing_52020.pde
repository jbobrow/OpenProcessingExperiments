
// an animated version of Joseph Muller-Brockmann's classic "beethoven" poster
// http://3.bp.blogspot.com/-KQRqVNH7wPg/Tm6HZicoJPI/AAAAAAAAAGY/t1LGAoFG0h8/s1600/beethoven3.jpg
// by Ruairí Murphy

int numOfArcs = 10;
int arcW = 5;
int dia = 136;
int cx = 108;
int cy = 410;
ArrayList sArcs;

void setup(){
  size(400,575);
  background(255);
  stroke(0);
  smooth();
  noFill();
  strokeCap(SQUARE);
  sArcs = new ArrayList();
  // set up arcs
  // inner circle
  dia = dia + cx;
  sArcs.add(new SArc(cx,cy,dia,arcW,338.0,54.0,0.1,1)); // inner circle / arc 1
  sArcs.add(new SArc(cx,cy,dia,arcW,136.0,54.0,0.1,1)); // inner circle / arc 2
  updateVars();
  sArcs.add(new SArc(cx,cy,dia,arcW,315.0,65.0,0.08,-1)); // circle 2 / arc 1
  sArcs.add(new SArc(cx,cy,dia,arcW,90.0,90.0,0.08,-1)); // circle 2 / arc 2
  updateVars();
  sArcs.add(new SArc(cx,cy,dia,arcW,282,78,0.05,1)); // circle 3 / arc 1
  sArcs.add(new SArc(cx,cy,dia,arcW,43,90,0.05,1)); // circle 3 / arc 2
  updateVars();
  sArcs.add(new SArc(cx,cy,dia,arcW,270,270,0.1,-1)); // circle 4 / arc 1
  updateVars();
  sArcs.add(new SArc(cx,cy,dia,arcW,316,180,0.09,1)); // circle 5 / arc 1
  updateVars();
  sArcs.add(new SArc(cx,cy,dia,arcW,258,200,0.1,-1)); // circle 6 / arc 1
  updateVars();
  sArcs.add(new SArc(cx,cy,dia,arcW,200,200,0.12,1)); // circle 7 / arc 1
  
}

void draw(){
  background(255);
  for(int i = 0; i<sArcs.size();i++){
    SArc thisSArc = (SArc) sArcs.get(i);
    thisSArc.display();
    if(frameCount > 150){
      thisSArc.update();
    }
  }
}

class SArc {
  int arcX;
  int arcY;
  int arcDia;
  int arcWidth;
  float startAngle;
  float stopAngle;
  float arcLength;
  float speed;
  float direction;
  
  SArc(int tempX,int tempY,int tempDia, int tempWidth, float tempStart, float tempLength, float tempSpeed, float tempDirection){
    arcX = tempX;
    arcY = tempY;
    arcDia = tempDia;
    arcWidth = tempWidth;
    startAngle = tempStart;
    arcLength = tempLength;
    speed = tempSpeed;
    direction = tempDirection;
  }
  
  void display(){
    strokeWeight(arcWidth);
    arc(arcX,arcY,arcDia,arcDia,radians(startAngle),radians(startAngle + arcLength));
  }
  
  void update(){
    if(direction == 1){
      startAngle = startAngle + speed;
    }else{
      startAngle = startAngle - speed;
    }
  }
}

void updateVars(){
  dia = dia + (arcW * 3) + 3;
  arcW *= 2;
}
    
  
