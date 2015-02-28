
float t=0;
float r=10;
float x1;
float y1;
float x2;
float y2;
float x3;
float y3;
float x4;
float y4;
float x;
float y;
float g;
float st;
void setup(){
  background(20);
  frameRate(90);
  size(800,400);
  stroke(random(50,200),random(30,100));
  strokeWeight(0.01);
  g=0;
  t=0;
}
void draw(){
  //background(20);
  for (int i=0 ; i<100;i++ ) {
    x4=(1-t)*(1-t)*x1+g*t*(1-t)*x2+t*t*x3;
    y4=(1-t)*(1-t)*y1+g*t*(1-t)*y2+t*t*y3;
    x = x4 ;
    y = y4 ;
    //speed
    t+=0.001;
    float linewidth=5-t*3;
    strokeWeight(linewidth);
    smooth();
    stroke(st,100-t*50);
    line(x,y,x4,y4);
    //println(linewidth);
    
    if(x>width || y<0 ||x<0 || y>height || linewidth<1){
      x1=0;
      y1=height/2;
      x2=(x1+x3)/2;
      y2=(y1+y3)/2;
      x3=random(width);
      y3=random(height);
      g=random(-10,10);
      t=0;
      st=random(50,200);
      strokeWeight(0);
    }
    
  }
  //fadeToWhite();
}
void fadeToWhite(){
  rectMode(CORNER);
  fill(20,0);
  noStroke();
  rect(0,0,width,height);
}

