
float x;
float y;
float radius=10;
float rnoise;
float ang;
float newradius;
float rad;
float r=random(100,255);

void setup() {
 size(500,500);
 smooth();
 background(0);
 stroke(r,0,0);
 strokeWeight(3);
 frameRate(5);
 rnoise=random(10);
}

void draw() {
 translate(width/2, height/2);
 for (ang=0;ang<=360;ang+=1) {
  newradius=radius+(noise(rnoise)*400);
  rad=radians(ang);
  
  if(mousePressed) {
   noLoop();
}
 
  x=newradius*cos(rad);
  y=newradius*sin(rad);
  point(x,y);
  rnoise=rnoise+1;
 } 
}
