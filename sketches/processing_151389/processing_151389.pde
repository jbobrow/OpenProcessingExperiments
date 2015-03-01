
void setup() {
 size(600,600);
 background(0);
 rectMode(CENTER);
}
 
void draw() {
 int num=5;
 int margin=80;
 int c=0; //counter
 float gutter=0;
 float cellsize=(width-(2*margin)-gutter*(num-1))/(num-1);
 for(int i=0;i<num;i++) {
  for(int j=0;j<num;j++) {
   ++c;
   float tx=margin+cellsize*i+gutter*i;
   float ty=margin+cellsize*j+gutter*j;
   movingObj (c,tx,ty,cellsize,c*TWO_PI*millis()/60000.0);
  }
 }
}

void movingObj (int n,float x,float y,float size,float angle) {
 stroke(255,255,0);
 strokeWeight(2);
 fill(255,0,128);
 float tempX=x+(size/2)*sin(angle); //calculate endpoint of line
 float tempY=y+(size/2)*cos(angle);
 if((n%2)==0) {
  tempX=x+(size/2)*cos(angle);
  tempY=y+(size/2)*sin(angle);
  rect(x,y,size,size);
 } 
 else {
  ellipse(x,y,size,size);
 }
 line(x,y,tempX,tempY);
}
 
 




