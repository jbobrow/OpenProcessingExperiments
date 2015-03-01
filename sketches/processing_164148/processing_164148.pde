
float angle;
float angle_v;
 
int rad = 300;
float temp;
 
queue q = new queue(200);
 
void setup() {
  frameRate(60);
  size(640, 640);
  noStroke();
  smooth();
  ellipseMode(CENTER);
   
  angle_v=5;
}
 
void draw() {
  background(255);
 
  float c = angle/360*TWO_PI;
  angle = (angle+angle_v)%360;
   
  if (mousePressed && overCircle(mouseX,mouseY,rad))
  {
    int fx = mouseX-width/2;
    int fy = mouseY-height/2;
    int x2 =(int)(fx*cos(-c)-fy*sin(-c));
    int y2 =(int)(fx*sin(-c)+fy*cos(-c));
    q.insert(x2+width/2,y2+height/2);
  }
   
  pushMatrix();
  translate(width/2,height/2);
  rotate(c);
  draw_circle();
  draw_points();
  draw_circle2();
  popMatrix();
}
 
void draw_circle(){
  fill(random(5));
  noStroke();
  ellipse(0,0,rad*2,rad*2);
}
 
void draw_circle2(){
  fill(255-random(2));
  noStroke();
  ellipse(0,0,rad/2,rad/2);
}
 
void draw_points(){
  for(int i=0;i<q.size;i++)
    if (q.x[i]!=-1){
       
      color c = color(random(155,255),random(155,255),random(155,255));
      strokeWeight(3);
      stroke(c, 128);     
      point(q.x[i]-width/2,q.y[i]-height/2);
    }
}
 
boolean overCircle(int x, int y, int diameter) {
  float disX = x - width/2;
  float disY = y - height/2;
  if(sqrt(sq(disX) + sq(disY)) < diameter) {
    return true;
  } else {
    return false;
  }
}
 
void keyPressed(){
  if (key == '1'){
    if (angle_v==0){
      angle_v = temp;
    }
    else {
      temp = angle_v;
      angle_v = 0;
    }
  }
}
 
class queue{
  float x[];
  float y[];
  int count;
  int size;
   
  queue(int s){
    x = new float[s];
    y = new float[s];
    for(int i=0;i<s;i++){
      x[i]=-1;y[i]=-1;
    }
    count = 0;
    size = s;
  }
   
  void insert(float xval, float yval){
    x[count] = xval;
    y[count] = yval;   
    count++;
    count %= size;
  }  
};

