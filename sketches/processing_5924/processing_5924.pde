
//Koch Curve
void setup(){
  size(800,600);
  smooth();
  background(0);
  noLoop();
}
void draw(){
  koch(0,0,800, 600, 4);
}
void koch(int x1, int y1,int x2,int y2,int iterations){
  //line(x1,y1,x2,y2);

  strokeWeight(0.5);
  stroke(255,150);
  noFill();
  rectMode(CORNERS);
  if(iterations==0){
  line(x1,y1,(x2-x1)/3+x1,(y2-y1)/3+y1);
  line((x2-x1)/3+x1,(y2-y1)/3+y1,(x2-x1)/2+x1+(y2-y1)/3,(y2-y1)/2+y1-(x2-x1)/3);
  line((x2-x1)/2+x1+(y2-y1)/3,(y2-y1)/2+y1-(x2-x1)/3,(x2-x1)/3*2+x1,(y2-y1)/3*2+y1);
  line((x2-x1)/3*2+x1,(y2-y1)/3*2+y1,x2,y2);
  }

  if(iterations>0){
    koch(x1,y1,(x2-x1)/3+x1,(y2-y1)/3+y1,iterations-1);
    koch((x2-x1)/3+x1,(y2-y1)/3+y1,(x2-x1)/2+x1+(y2-y1)/3,(y2-y1)/2+y1-(x2-x1)/3,iterations-1);
    koch((x2-x1)/2+x1+(y2-y1)/3,(y2-y1)/2+y1-(x2-x1)/3,(x2-x1)/3*2+x1,(y2-y1)/3*2+y1,iterations-1);
    koch((x2-x1)/3*2+x1,(y2-y1)/3*2+y1,x2,y2,iterations-1);
      stroke(0);
  } 
  iterations--;
}


