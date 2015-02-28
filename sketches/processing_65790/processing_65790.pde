
PVector circle(float startx,float starty, float angle,float distance){

  float endx = startx + cos(angle) * distance;
  float endy = starty + sin(angle) * distance;
 // stroke(startx,endx);
 // vertex(endx,endy,0,endx,endy);
 PVector retval = new PVector(endx,endy,0);
 return retval;
 
 
 
} 

int w=255;
int h=255;
PVector [] karl  = new PVector [64];
int i =0;
void setup(){

 
 size(255,255);
 smooth();
for (float z=0;z< 6.3;z+=.1){
 karl[i] = circle( w/2,h/2,z,100);
 if(i>0)line(karl[i-1].x,karl[i-1].y,karl[i].x,karl[i].y);
 
 i++;
 
}
//line(karl[i-].x,karl[i-2].y,karl[1].z,karl[1].y);
  
}

void draw(){
 background(255);
  beginShape(LINES);
for (int ix=0;ix<i-1;ix++){
  
 if(ix>0){
   float dis = dist(karl[ix-1].x,karl[ix-1].y,mouseX,mouseY);
   float dis2 = dist(mouseX,mouseY,w/2,h/2);
   
  strokeWeight(1);
  if(dis<100 )strokeWeight(6);
 //  line(karl[ix-1].x,karl[ix-1].y,karl[ix].x,karl[ix].y);
 vertex(karl[ix].x,karl[ix].y);
   
 }
} 
endShape(CLOSE);
}

String where (PVector place,int x,int y){
  String retval = "";
  if(x<=place.x && y<=place.y)retval = "A";
  if(x>=place.x && y<=place.y)retval = "B";
  if(x<=place.x&& y>=place.y)retval="C";
  if(x>=place.x && y>=place.y)retval="D";
   
 return retval;
   
}
