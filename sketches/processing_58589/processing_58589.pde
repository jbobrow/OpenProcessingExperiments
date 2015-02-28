
//set window, bg &anti-alias
void setup(){
size(800,600);
background(0);
smooth();
}

//set drawing
void draw(){
//set static image
noLoop();
  
//color variable
float c=random(100,220); 
//limit set
int w=width/4;
int h=height/8;

//bg layer loop
for (int i=0;i<=360; i=i+3)
{
  //variables
  float x1;
  float y1;

  //initial point of line
  x1=width/2;
  y1=height/2;
  //color & contour
  noFill();
  stroke(c,86,c,random(150,200));
  strokeWeight(random(0,1));
  
  bezier(x1,y1,random(width),random(height),x1,y1,random(width),random(height));
}

//2nd layer
for (int i=0;i<40;i=i+1){
  //arc diameters
  float pArc= random(50,350);
  //color & stroke
  fill(random(55),random(100,155),random(200),random(80));
  noStroke();
  //arc size
  float b=random(0,PI);
  float bx=random(PI,3*PI);
  //arc
  arc(random(2*w,2*w),4*h,pArc,pArc, b, bx);
}


saveFrame("line-####.png");
}

