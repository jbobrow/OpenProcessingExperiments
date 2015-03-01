
int r;
int a=100;
PVector v[]=new PVector[360+a];
boolean drawOK=false;
void setup(){
  size(640,480);
  colorMode(RGB);
  background(0);
}
void draw(){
  if(drawOK){
  drawLine(mouseX,mouseY,r);
  r++;
  }
}
void mousePressed(){
  drawOK=true;
}
void mouseReleased(){
  drawOK=false;
  r=0;
}

void drawLine(float x,float y,int r){
  for(int i=0; i<v.length; i+=10){
   v[i]=new PVector(r*cos(radians(i)),r*sin(radians(i)));
  }
  for(int i=0; i<v.length-a; i+=10){
  stroke(random(i),random(x),random(y));
   line(x+v[i].x,y+v[i].y,x+v[i+a].x,y+v[i+a].y);
 }
}


