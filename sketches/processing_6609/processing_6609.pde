
class Cycloid{
  int finished = 0;
  ArrayList dotX2List = new ArrayList();
  ArrayList dotY2List = new ArrayList();  
  float innerDegree = random(0,360);
  float degree = random(0,360);;
  float degree2 = random(0,360);;

  float ox;
  float oy;
  float innerRadius;
  float innerX, innerY;
  float r;
  float r2;
  int distance;
  int count = 500;
  int life;
  
  public Cycloid(int upX, int upY, int distance, int life){
    this.ox = upX;
    this.oy = upY;
    this.distance = distance;        
    this.life = life;            
  }
  
  public void update(){
//draw inner circle\
  pushMatrix();
  translate(ox, oy);
  //println(innerDegree);
  innerRadius = distance;
  
  innerX = innerRadius*cos(radians(innerDegree));
  innerY = innerRadius*sin(radians(innerDegree));
//  stroke(255,40);
//  strokeWeight(1);
//  point(innerX, innerY);
  innerDegree = innerDegree + 1;

  noFill();
//  stroke(255,40);
//  strokeWeight(1);
//  ellipse(ox, oy, innerRadius*2, innerRadius*2);
  
  //create new dot
  r =distance/2;//5
  float dotX = innerX + r*cos(radians(degree));
  float dotY = innerY + r*sin(radians(degree));
  degree = degree + 7;

  //draw dot
//  stroke(255,40);
//  strokeWeight(1);
//  point(dotX, dotY);  
  
  //create new dot2
  r2 = 20+distance/5;
  float dotX2 = dotX + r2*cos(radians(degree2));
  float dotY2 = dotY + r2*sin(radians(degree2));
  degree2 = degree2 + 23.3;
  dotX2List.add(dotX2);
  dotY2List.add(dotY2);
  
  finished = 0;
  }
  
  public void show(){
  for(int i=0; i<dotX2List.size()-1; i++){
    float x1 = (Float)dotX2List.get(i);
    float y1 = (Float)dotY2List.get(i);
    float x2 = (Float)dotX2List.get(i+1);
    float y2 = (Float)dotY2List.get(i+1);

    stroke(abs(degrees(atan2((y1-y2), (x2-x1)))-2*distance), abs(degrees(atan2((y2-y1), (x1-x2)))-5*2*distance), abs(degrees(atan2((y2-y1), (x1-x2)))+2*distance), 100);
    strokeWeight(5);
    line(x1, y1, x2, y2);
  }
  //println(dotX2List.size());
  //println(finished);
  if(dotX2List.size() > life){
    //dotX2List.remove(0);
    //dotY2List.remove(0);
    finished = 1;
  }
  popMatrix();
}
 public int isFilled(){
   return finished;}
}

