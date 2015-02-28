
float point_direction(float x1,float y1,float x2,float y2) {
  float rads1 = atan2((y1-y2),(x1-x2));
  float deg = degrees(rads1);
  return deg;
}
 
float point_distance(float x1,float y1,float x2,float y2) {
  return (sqrt(pow(x2-x1,2)+pow(y2-y1,2)));
}
 
float lengthdir_x(float dist1,float ang) {
//  return dist1 * cos(ang*PI);
    return dist1 * cos(ang*PI/180);
}
 
float lengthdir_y(float dist1,float ang) {
//  return dist1 * sin(ang*PI);
    return dist1 * sin(ang*PI/180);
}
 
PVector rotates(PVector point1, float angle) {
  PVector rotated_point = new PVector(float(0),float(0));
  rotated_point.x = point1.x * cos(radians(angle)) - point1.y * sin(radians(angle));
  rotated_point.y = point1.x * sin(radians(angle)) + point1.y * cos(radians(angle));
  return rotated_point;
}

class ball {
  private float x = (float)Math.random()*400;
  private float y = (float)Math.random()*400;
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float topspeed;
  float maxrange = 100;

  ball() {
    
  }
  void doo() {
    ellipse(x,y,10,10);
    float dir = point_direction(x,y,mouseX,mouseY);
    float diff = sqrt(pow((x-mouseX),2) + pow((y - mouseY),2));
    float mod = (-diff/maxrange)+1;
    if (mod < 0) {
      mod = 0;
    }
    //println(mod);
    if (diff > (maxrange+400)) {
      x = mouseX;
      y = mouseY;
    }
    PVector AddVel = new PVector(lengthdir_x(15,dir),lengthdir_y(15,dir));
    acceleration =(rotates(AddVel,-90*mod));
    velocity.x-=acceleration.x/5;
    velocity.y-=acceleration.y/5;
    velocity.x = velocity.x/1.08;
    velocity.y = velocity.y/1.08;
    x+=(velocity.x);
    y+=(velocity.y);
  }
}

ArrayList<ball> derp = new ArrayList<ball>();
void setup(){
  size(400,400);
  for(int i = 0;i<50;i++){
    derp.add(new ball());
  }
}

void draw(){
  background(100);
//  for(int i = 0;i<10;i++){
//    derp.add(new ball());
//  }
  for(ball d:derp){
    d.doo();
  }
//  for(int i = 0;i<10;i++){
//    derp.remove(i/2);
//  }
}


