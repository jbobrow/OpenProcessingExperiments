
//with a lot of help (mostly stolen) from Chris Bamborough: http://www.openprocessing.org/visuals/?visualID=8669
//and Andréas Kündig: http://www.openprocessing.org/visuals/?visualID=8666

int nbEllipses = 22;
int smallestDiameter = 60;
//int LargestDiameter = 100;
int diameterIncrement = 20;
int controlPointOffset = 100;
 
float x, y;
ArrayList positionHistory = new ArrayList();
AngleMeter angleMeter = new AngleMeter(smallestDiameter/2.0);
 
void setup() {
  size(1200,1000);
  noStroke();
  smooth();
  while(positionHistory.size()<nbEllipses*2){
    positionHistory.add(new float[]{
      width/2,height/2,0    }
    );
  }
}
 
void draw() { 
  positionHistory.remove(positionHistory.size()-1);
  x = 0.6 * x + 0.4 * mouseX;
  y = 0.6 * y + 0.4 * mouseY;
  angleMeter.drag(x,y);
  positionHistory.add(0,new float[]{
    x,y,angleMeter.angle  }
  );
  drawEllipses();
}
 
void drawEllipses(){
  for(int i = 0; i<nbEllipses; i++){
    int positionIndex = 2* (nbEllipses-1  - i);
    float [] position = (float[])positionHistory.get(positionIndex);
    int majorAxis = smallestDiameter + diameterIncrement * (nbEllipses -1 -i);
    drawEllipse(position, majorAxis, i%2==0 ? 0:255);
  } 
}
 
void drawEllipse(float [] x_y_angle, int majorAxis, int fillColor){ 
  stroke (random(255),random(255),random(255),random(255));
  strokeWeight(4);
  fill(fillColor);
  pushMatrix();
  translate(x_y_angle[0],x_y_angle[1]);
  rotate(x_y_angle[2]);
  ellipse(-controlPointOffset, 0, majorAxis, majorAxis * 0.85);
  popMatrix();
}
 
class AngleMeter{
  float [] draggedPoint = new float[2];
  float angle;
  float distance;
  AngleMeter(float distance){
    this.distance = distance;
  }
  void drag(float x, float y){
    float dx = x - draggedPoint[0];
    float dy = y - draggedPoint[1];
    angle = atan2(dy, dx); 
    draggedPoint[0] = x - (cos(angle) * distance);
    draggedPoint[1] = y - (sin(angle) * distance);
  }
}

void mousePressed()
{
  setup();
}


