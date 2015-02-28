
float x[],y[],dir,dirD,speed,rad,radD;
int stateCnt,num;

void setup() {
  size(920,400);

  num=280;
  x=new float[num];
  y=new float[num];

  newPoint(width/2,height/2);
  
  dir=random(360);
  rad=40;
  radD=(1-rad)/(float)num;
  
  initMove();  
}

void draw() {
  background(200);
  
  stateCnt--;
  if(stateCnt<0) initMove();
  
  dir+=dirD;
  newPoint(x[0]+cos(radians(dir))*speed,
    y[0]+sin(radians(dir))*speed);

  for(int i=num-1; i>0; i--) 
    ellipse(x[i],y[i], rad+radD*i,rad+radD*i);
}

void newPoint(float px,float py) {
  // check to see if the point is off-screen
  if(px<0) px=width;
  else if(px>width) px=0;
  if(py<0) py=height;
  else if(py>height) py=0;
  
  // move old values up the array
  for(int i=num-1; i>0; i--) {
    x[i]=x[i-1];
    y[i]=y[i-1];
  }
  
  // insert new point
  x[0]=px;
  y[0]=py;
}

void initMove() {
  if(dirD<0) dirD=random(0.25,1);
  else dirD=-random(0.25,1);
  
  speed=random(1,2);
  stateCnt=(int)random(100,2200);
}
