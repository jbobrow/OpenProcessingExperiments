
PVector [] now = new PVector [4];
 
 
int w = 255;
int h = 255;
float dek = 199;
boolean firstrun = true;
PImage vu;
void setup(){
  size(255,255,P2D);
  vu = createImage(w,h,ARGB);
  now[0]=new PVector (w-1,h-1);
  now[1]=new PVector (w,h-1);
  now[2]=new PVector (w,h);
  now[3]=new PVector (w-1,h);
 
  //smooth();
  if(firstrun)background(-1);
  firstrun=false;
}
int pass;
int ii;
void draw(){
  background(-1);
  pass++;
 
  stroke(1,45);
  move();
  for (int ii =0;ii<4;ii++){
 
//    point(now[ii].x,now[ii].y);
 setx(vu,int(now[ii].x),int(now[ii].y));
    if(ii>3)ii=0;
  }
  for (int i =0;i<4;i++){
 
    if(now[i].x<0)outside=true;
    if(now[i].x>w)outside=true;
 
    if(now[i].y<0)outside=true;
    if(now[i].y>h)outside=true;
  }
  if(outside){
    now[0]=new PVector (w-1,h-1);
  now[1]=new PVector (w,h-1);
  now[2]=new PVector (w,h);
  now[3]=new PVector (w-1,h);
  }
  outside = false;
  image(vu,0,0);
}
void setx(PImage im, int xloc,int yloc){
  
 color c =  im.get(xloc,yloc);
 float aa = c >>24&255;
 if (aa<45*5){
  im.set(xloc,yloc,color(1,aa+45)); 
 }
  
}
boolean outside = false;
float [] dis = new float [4];
int mxi=0;
//float mx = dis[0];
void move(){
  float mx = dis[0];
 
  if(pass%2==0)mxi=int(random(3));
  if(mxi==0){ //up-left
    for (int i =0;i<4;i++){
      now[i].x-=1;
      now[i].y--;
    }
  }
  if(mxi==1){ //up-right
    for (int i =0;i<4;i++){
      now[i].x+=1;
      now[i].y--;
    }
  }
  if(mxi==2){ //down-left
    for (int i =0;i<4;i++){
      now[i].x-=1;
      now[i].y++;
    }
  }
  if(mxi==3){ //down-right
    for (int i =0;i<4;i++){
      now[i].x+=1;
      now[i].y++;
    }
  }
 
 
}
