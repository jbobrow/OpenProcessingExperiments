
String where (PVector place,int x,int y){
  String retval = "";
  if(x<=place.x && y<=place.y)retval = "A";
  if(x>=place.x && y<=place.y)retval = "B";
  if(x<=place.x&& y>=place.y)retval="C";
  if(x>=place.x && y>=place.y)retval="D";
  
 return retval; 
  
}
int w = 255;
int h = 255;
PImage a;
PVector center;
int resetcount = 300;
int cnt = 0;
void keyPressed(){
if(key=='r')setup();

}
void setup(){
  center = new PVector(w/2,h/2);
  size(255,255,JAVA2D);
  cnt=0;
 smooth();
  a=createImage(w,h,ARGB);
  for (int x=0;x<w;x+=1){
   for (int y=0;y<h;y+=1){
    float dis = dist(x,y,center.x,center.y);
    
    if(dis<100 && dis> 75) {
      String wh = where(center,x,y);
     if(wh=="A") a.set(x,y,color(255,0,0));
      if(wh=="B") a.set(x,y,color(0,255,0));
       if(wh=="C") a.set(x,y,color(0,0,255));
        if(wh=="D") a.set(x,y,color(255,128,0));
      
    }
   } 
  }
  //image(a,0,0);
  //image(a,1,0);
 // image(a,0,1);
  //image(a,1,1);
}
float z;
void draw(){
  translate(center.x,center.y);
  z+=2;
  rotate(radians(z));
  imageMode(CENTER);
  image(a,0,0);
  a=get();
  cnt++;
  if(cnt>resetcount)setup();
}
