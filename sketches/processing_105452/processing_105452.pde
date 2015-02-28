
float[]x=new float[10];
float[]y=new float[10];
float[]spanX =new float[10];


void setup(){
  size(600,200);
  frameRate(15);
}

void draw(){
  fill(random(20,120),random(85,180),random(70,170),60);
  noStroke();
  
  for(int i=0;i<x.length;i++){
    x[i]=random(width);
    y[i]=random(height);
    spanX[i]=random(100,150);
    ellipse(x[i],y[i],spanX[i],spanX[i]);
  }
  
  fill(0,20);
  rect(0,0,width,height);
}


