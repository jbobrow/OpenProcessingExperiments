
PVector [] cc = new PVector [3];
int pNum= 1;
PVector [] p= new PVector [pNum];
float xm = w/2;
float ym = h/2;
int w = 200;
int h = 200;


void setup(){
  size(200,200);
  smooth();
  background(255,0,0);
    for (int i = 0;i<3;i++){

    cc[i]=new PVector (r(),r(),r()); 
  }
  p[0]= new PVector (random(w),random(h),0);
  }
  
  float r(){
  return random(50)+random(50)+random(50)+random(50)+random(50); 
}

void draw(){
 move();
ellipse(p[0].x,p[0].y,10,10);
for (int x=0;x<w;x++){
 for (int  y=0;y<h;y++){
    float dis2 =dist(p[0].x,p[0].y,x,y); 
  float dis1 = (p[0].x-x)+(p[0].y-y);
  if(dis1<0)dis1=-dis1;
    float dis3  = (dis2-dis1)*2;
     if(dis3<0)dis3=-dis3;
   float dis = (dis1+dis3)/2;
    if (int(dis)<25){
       stroke(255,dis);

        strokeWeight(5);
        point(x,y);
 }
 }
 }
 }

void move(){
  float dx = (mouseX-p[0].x)/w;
  p[0].x+=dx;
  if(p[0].x>w)p[0].x=0;
  float dy = (mouseY-p[0].y)/h;
  p[0].y+=dy;
  if(p[0].y>h)p[0].y=0;



}
