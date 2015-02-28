
int itterations=4,circlesPer360,speed;
float siz,ang,ang2,time,lastTime;
PVector pos;
boolean onFill,onStroke,invert,ballMode,ani;

void setup(){
  size(800,800);
  siz=1;
  pos=new PVector(0,0);
  
  onFill=false;
  onStroke=true;
  ang2=0;
  invert=false;
  circlesPer360=6;
  speed=70000;
  ballMode=false;
  ani=true;
}

void draw(){
  time=(millis()-lastTime)/speed;
  lastTime=millis();
  translate(400,400);
  if(!invert)background(0);
  else background(255);
  scale(siz);
  translate(pos.x,pos.y);
 recursiveCircle(0,0,400,circlesPer360,itterations);
 
 if(ani)
  ang2+=1*time;
  
  
}


 
 
    
void recursiveCircle(float centerX,float centerY,float radius,int numCircles,int itter){
   if(itter==0) return;
   if(!onFill)
     noFill();
   else{
     if(!invert)fill(255-255*itter/itterations);
     else fill(255*itter/itterations);
     }
     
     if(!onStroke)
     noStroke();
   else{
     if(invert)stroke(0,0,0,255*itter/itterations);
     else stroke(255,255,255,255*itter/itterations);
     }
    
    if(!ballMode)
   ellipse(centerX,centerY,radius*2,radius*2);
    else if(itter==1)
    ellipse(centerX,centerY,radius*2,radius*2);
   
   ang=TWO_PI/numCircles;
   
  itter--;
  
  for(int i=0;i<numCircles;i++)
  recursiveCircle(centerX+radius*cos(ang*(i+1))/2,centerY+radius*sin(ang*(i+1))/2,radius*abs(cos(ang2*7)),numCircles,itter);

}
