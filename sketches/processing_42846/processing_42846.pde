
//dan 01:42 17/10/2011
 
int ellipseSize=1;
float rom=0;


void setup(){
size(400,400);
background(255);
noStroke();
smooth();

}

void draw(){
 background(231,242,213,10);
 drawMe(70,70,100);
 drawMe(mouseX,mouseY,100);
 drawMe(330,330,100);
 drawMe(70,330,100);
 drawMe(330,70,100);
}

void drawMe(int cx, int cy, int ellipseSize){
  float x;
  float y;
  strokeWeight(ellipseSize*random(0.1,0.12));
  stroke(5,242,155,60);
  fill(5,242,155,80);
  ellipse(cx,cy,ellipseSize,ellipseSize);
  rom=random(1,5);
  fill(124,5,242);
  for(int i=0;i<=ellipseSize;i++) {
    x=random(0,width);
    y=random(0,width);
    if(dist(x,y,cx,cy) < ellipseSize/2){
    ellipse(x,y,rom,rom);
  }
  }
}
