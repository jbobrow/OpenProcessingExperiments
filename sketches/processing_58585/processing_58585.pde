
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
  
//limit set
int w=width/4;
int h=height/8;

//bg layer loop
for (int i=0;i<50;i=i+1){
  //arc diameters
  float pArc= random(100,250);
  //color & stroke
  fill(random(255),0,random(150),random(100));
  noStroke();
  //arc size
  float b=random(0,PI);
  float bx=random(PI,3*PI);
  //arc
  arc(random(2*w,2*w),random(2*h,6*h),pArc,pArc, b, bx);
}

//2nd layer loop
for (int i=0; i<100000; i=i+2)
{
  //variable for color
  float c=random(50,200);
  //countour  
  strokeWeight (random(10));
  //drawing inside a specific area
  stroke(c,random(70,120),random(150));
  point (random(width/4,width/4+350),random(0,height));
    
  //arc diameters
  float pArc= random(50,100);
  //color & stroke
  noFill();
  //countour  
  strokeWeight (random(5));
  stroke(c,random(70,120),random(100,200),random(100));
  //arc size
  float b=random(0,PI);
  float bx=random(PI,3*PI);
  
  arc(random(0,width),random(0,height),pArc,pArc, b, bx);
}

saveFrame("line-####.png");
}

