
class Man{
 float x,y;
 int sz;
 int life=255;
 float vx,vy;
 boolean death;
 int id;
 color c;
 Man[] others;  
 float[] sx = new float[20];
 float[] sy = new float[20];
 float segLength = 3;

 Man(float _x, float _y, float _sz, int _id, Man[] _others){
   x=_x;
   y=_y;
   sx[0]=x;
   sy[0]=y;
   for(int i=1; i<sx.length-1; i++){
     sx[i]=sx[i-1]+random(- segLength, segLength);
     sy[i]=sy[i-1]+random(- segLength, segLength);
   }
   sz=(int)_sz;
   death=false;
   int cRed=(int)random(125,255);
   int cGreen=(int)random(125,255);
   int cBlue=(int)random(125,255);
   c=color(cRed,cGreen,cBlue);   
   vx=random(20,30);
   if(random(-1,1)<0){
     vx=-vx;
   }
   vy=random(20,30);
   if(random(-1,1)<0){
     vy=-vy;
   }  
   id = _id;
   others = _others;
 }
 
void display(){
   if(death==false){
    fill(life);
    stroke(life);
   }else{
     fill(c);
     stroke(c);    
   }
   ellipse(x,y,sz,sz);
   dragSegment(0, x, y);
   for(int i=0; i<sx.length-1; i++) {
    dragSegment(i+1, sx[i], sy[i]);
   }
 }
 
void move(){
   
   if(death==false){
     x += random(-3, 3);
     y += random(-3, 3);
     if(((x+vx)<=0)||((x+vx)>=width)){
       vx=-vx;
     }
     if(((y+vy)<=0)||((y+vy)>=height)){
       vy=-vy;
     }
     x=x+vx;
     y=y+vy;
   }
 }

void hunt(){
   int maxSzDiff=0;
   int targetID=id;
   for (int i = 0; i < numMen; i++) {
    if((i!=id)&&(others[i].death==false)){
      if((sz-others[i].sz)>maxSzDiff){
        maxSzDiff=sz-others[i].sz;
        targetID=others[i].id;        
      }
    }
 }
 if(targetID!=id){
   float oAngle=atan2(vy, vx);
   float d=vy/sin(oAngle);
   float dy=others[targetID].y-y;
   float dx=others[targetID].x-x;   
   float nAngle=atan2(dy,dx);
   vx=cos(nAngle)*d;
   vy=sin(nAngle)*d;
 }
}

void runOut(){
  int maxSzDiff=0;
   int targetID=id;
   for (int i = 0; i < numMen; i++) {
    if((i!=id)&&(others[i].death==false)){
      if ((others[i].x>(this.x-sz*5))&&(others[i].x<(this.x+sz*5))&&(others[i].y>(this.y-sz*5))&&(others[i].y<(this.y+sz*5))){
      if((others[i].sz-sz)>maxSzDiff){
        maxSzDiff=others[i].sz-sz;
        targetID=others[i].id;        
      }
      }
    }
 }
 if(targetID!=id){
   float oAngle=atan2(vy, vx);
   float d=vy/sin(oAngle);
   float dy=others[targetID].y-y;
   float dx=others[targetID].x-x;   
   float nAngle=atan2(dy,dx);
   vx=-cos(nAngle)*d;
      vy=-sin(nAngle)*d; 
     // println();
     
 }
}

void dieOut(){
  if((life-=1)<0){
  death=true;
  }
}

void ate(){
     for (int i = 0; i < numMen; i++) {
    if((i!=id)&&(others[i].death==false)&&(death==false)){
      if ((others[i].x>(this.x-sz/2))&&(others[i].x<(this.x+sz/2))&&(others[i].y>(this.y-sz/2))&&(others[i].y<(this.y+sz/2))){
        if((sz>others[i].sz)){
        others[i].death=true;
        others[i].life=0;
      //  sz+=(int)(others[i].sz/2);
        life=255;
       sz++;
       // println((int)c);
        }
      }
    }
 }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - sx[i];
  float dy = yin - sy[i];
  float angle = atan2(dy, dx);  
  sx[i] = xin - cos(angle) * segLength;
  sy[i] = yin - sin(angle) * segLength;
  segment(sx[i], sy[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
 //ellipse(x,y,sz,sz);
  line(0, 0, segLength, 0);
  popMatrix();
}


}

