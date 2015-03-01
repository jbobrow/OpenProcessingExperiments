
int nbePoints=100;
Points pointsGroup;
PVector center;
boolean drawing=true;

void setup() {
  size(800, 800);
  smooth();
  colorMode(HSB,360,255,255);
  PVector[]points=new PVector[nbePoints];
  for (int i=0; i<nbePoints; i++) {
    points[i]=new PVector(random(width),random(height));//width/2+random(-width/4,width/4),height/2+ random(-height/4,height/4));
  }
  pointsGroup=new Points(points);
  background(0,0,255);
  noStroke();
}
void draw() {
  if(drawing){
  fill((frameCount/3)%360, 255, 255,30);}
  else{
  fill((frameCount/3)%360, 255, 255);
  background(0);
  }
  
  pointsGroup.display();
  pointsGroup.transform();
}
void mouseReleased(){
   drawing=!drawing;
   if(drawing)background(0,0,255);
}
class Points {
  PVector[] points;
  float speed;
  Points(PVector[] points) {
    this.points=points;
    speed=random(5);
  }
  void display() {
    for (PVector pv : points) {
      ellipse(pv.x, pv.y, 3, 3);
    }
  }
  void transform() {
    for (int i=0; i<nbePoints; i++) {
      
      //float distance0=dist(center.x,center.y,points[i].x,points[i].y);
      PVector temp=new PVector(points[i].x, points[i].y);
      temp.x+=random(-speed,speed);
      temp.y+=random(-speed, speed);
      if ((getMaxDist(i,points[i])>getMaxDist(i,temp) && frameCount%800<300) ||(getMinDist(i,points[i])<getMinDist(i,temp)&& frameCount%800>=300)) {  
        points[i]=temp;
      }
    }
  }
  float getMinDist(int index,PVector pv){
    float distance=500;
      for (int j=0; j<nbePoints; j++) {
        center=points[j];
        if (j!=index)distance=min(distance, dist(center.x, center.y, pv.x, pv.y));
      }
      distance=min(distance, pv.y);
      distance=min(distance, pv.x);
      distance=min(distance, height-pv.y);
      distance=min(distance, width-pv.x);
      return distance;
  }
  float getMaxDist(int index,PVector pv){
    float distance=0;
      for (int j=0; j<nbePoints; j++) {
        center=points[j];
        distance=max(distance, dist(center.x, center.y, pv.x, pv.y));
      }
      
      return distance;
  }
}
