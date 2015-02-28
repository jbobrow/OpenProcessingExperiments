
int nbEllipses = 34;
int smallestDiameter = 50;
int diameterIncrement = 20;
int controlPointOffset = 20;
color p=#5413F0;
color q=#D42AE8;
int c=1;
PImage bg;
float x, y;
ArrayList positionHistory = new ArrayList();
AngleMeter angleMeter = new AngleMeter(smallestDiameter/2.0);
 
void setup() {
  size(600,600);
  bg=loadImage("stars.jpg");
  noStroke();
  smooth();
  while(positionHistory.size()<nbEllipses*2){
    positionHistory.add(new float[]{
      width/2,height/2,0    }
    );
  }
}
 
void draw() { 
  background(bg);
  if (c>5) {
    c=1;
  }
  if (c==1){
    p=#31C0CB;
  }else if (c==2) {
    p=#F757A2;
  }else if (c==3) {
    p=#F5C411;
  }else if (c==4) {
    p=#104D9B;
  }else if (c==5) {
    p=#FF0808;
  }
  
  if (c==1){
    q=#FAD53F;
  }else if (c==2) {
    q=#A952E8;
  }else if (c==3) {
    q=#083162;
  }else if (c==4) {
    q=#08FFDC;
  }else if (c==5) {
    q=#FA9C0F;
  }
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
    drawEllipse(position, majorAxis, i%2==0 ? p:q);
  } 
}
 
void drawEllipse(float [] x_y_angle, int majorAxis, int fillColor){ 
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
void mousePressed() {
  c=c+1;
}

