
int width = 800;
int height = 1000;
float x1 = 0;
float y1 = 500;
float x2 = 500;
float y2 = 500;
float w = 3;

void setup(){
  size(500,1000);
  background(0);
  smooth();
}

void draw(){
  while(width<1000){
  noFill();
  strokeWeight(w);
  stroke(255,0,0,60);
  ellipse(x1,y1,width,height);
//  x1 = x1+8;
  y1 = 10/y1;
//  width = width + 4;
//  height = height + 4;
  
    noFill();
    strokeWeight(w);
    stroke(255,0,0,60);
    ellipse(x2,y2,width,height);
//    x2 = x2+8;
    y2 = 20/y2;
    width = width + 15;
    height = height - 15;
    w = w+0.5;
  }
  
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
                                
