
int width = 500;
int height = 500;
float x1 = 250;
float y1 = 12.5;
float x2 = 250;
float y2 = 987.5;

void setup(){
  size(500,1000);
  background(0);
  smooth();
}

void draw(){
while(y1<1000){
smooth();
  noFill();
  strokeWeight(2);
  stroke(255,0,0,60);
  ellipse(x1,y1,width,height);
//  x1 = x1+8;
  y1 = y1+8;
//  width = width + 4;
//  height = height + 4;
  
    smooth();
    noFill();
    strokeWeight(2);
    stroke(255,0,0,60);
    ellipse(x2,y2,width,height);
//    x2 = x2+8;
    y2 = y2-8;
    width = width - 4;
    height = height - 4;
    
/*      noFill();
      strokeWeight(2);
      stroke(255,0,0, 25);
      ellipse(x3,y3,width,height);
      x3 = x3-8;
      y3 = y3+8;
      width = width + 4;
      height = height + 4;
 */ 
//  if(y==500);
  //  x=50;
 //   y=0;
 }
}                                                                               
