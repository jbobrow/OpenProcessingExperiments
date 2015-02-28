
int w=255;
int h = 255;
void setup(){
  
 size(255,255);
smooth();
strokeWeight(3);
}
PVector midx;
PVector start = new PVector (w/2,h/2);
PVector end = new PVector (0,0);

void draw(){
  end = new PVector (mouseX,mouseY);
 background(-1);
line(start.x,start.y,end.x,end.y);
midx = mid(start,end);
ellipse(midx.x,midx.y,10,10);
squaremid(midx,start,end,"0");
squaremid(midx,start,end,"9");
}

PVector mid(PVector A, PVector B){
  PVector retval = new PVector ((A.x+B.x)/2,(A.y+B.y)/2);
 return retval; 
}

void squaremid(PVector A,PVector B,PVector C,String what){
  float xd = B.x-A.x;
   if (xd<0)xd=-xd;
  float yd= B.y-A.y;
  if (yd<0)yd = -yd;
  if(mousePressed)xd=xd/2;
 // xd=dist(A.x,A.y,B.x,B.y);
  yd=xd;
  if(what=="0"){ //start
    //rect(A.x,A.y-yd,xd,xd);
    line(A.x,A.y,A.x,A.y+yd);
    line(A.x-xd,A.y,A.x-xd,A.y+yd);
    line(A.x-xd,A.y+yd,A.x,A.y+yd);
    line(A.x-xd,A.y,A.x,A.y);
  }
  if(what=="9"){ //end
  
  line(A.x+xd,A.y,A.x+xd,A.y-yd);
    line(A.x,A.y,A.x,A.y-yd);
    line(A.x,A.y-yd,A.x+xd,A.y-yd);
        line(A.x,A.y,A.x+xd,A.y);
    //rect(A.x,A.y,xd,xd);
  }
  rect(A.x,A.y,xd,xd);
  rect(A.x-xd,A.y-xd,xd,xd);
  
  
}                               
