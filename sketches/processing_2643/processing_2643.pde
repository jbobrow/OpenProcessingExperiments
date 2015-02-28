
int num = 2500 ;
Curve[] myCurve = new Curve[num];
void setup(){
  background(0);
  smooth();
  colorMode(HSB, 255);
  noStroke();
  size(500, 500);
  
  for(int i = 0; i < num; i++){
    myCurve[i] = new Curve(2*PI/2500*i*1.61*500, 1, i/(i+1), 100, 250+i/8*sin(2*PI/2500*i*1.61*500), 250+i/8*cos(2*PI/2500*i*1.61*500));
}
}
void draw(){
  for(int i = 0; i < num; i++){
      myCurve[i].display();
}

}
void mousePressed(){
  background(0);
}
class Curve {
  float lineX;
  float lineY;
  float angle;
  float increment;
  float frequency;
  float amplitude;
  float disOr = 0;
  float angleNorm = -1/angle;
  float slope;
  float mx;
  float my;
  float originX;
  float originY;
Curve(float tempangle, float tempincrement, float tempfrequency, float tempamplitude, float templineX, float templineY){
  angle = tempangle;
  amplitude = tempamplitude;
  increment = tempincrement;
  frequency = tempfrequency;
  disOr = 0;
  angleNorm = -1/angle;
  if (angle%(2*PI) > PI/2 && angle%(2*PI) < 3*PI/2){
  slope = -tan(angle);
}
if (angle%(2*PI) < PI/2 || angle%(2*PI) > 3*PI/2){
  slope = tan(angle);
}
  mx = sqrt(sq(increment)/(1+sq(slope)));
  my = slope*mx;
  frequency = tempfrequency/500*sqrt(2);
  lineX = templineX;
  lineY = templineY;
}
void display() {
  if(lineX + amplitude*sin(disOr*2*PI*frequency)*cos(angleNorm) > 500){
    lineX -= 500;
  }
  if(lineX + amplitude*sin(disOr*2*PI*frequency)*cos(angleNorm) < 0){
    lineX += 500;
  }
  if(lineY+amplitude*sin(disOr*2*PI*frequency)*sin(angleNorm) > 500){
    lineY -= 500;
  }
  if(lineY+amplitude*sin(disOr*2*PI*frequency)*sin(angleNorm) < 0){
    lineY += 500;
  }
  fill(disOr%255, 255, 255, 2);
  ellipse(lineX + amplitude*sin(disOr*2*PI*frequency)*cos(angleNorm), lineY+amplitude*sin(disOr*2*PI*frequency)*sin(angleNorm), 10, 10);
  lineX += mx;
  lineY += my;
  disOr += increment;
  }
}


