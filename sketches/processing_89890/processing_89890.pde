
PFont font;
String title="Attempt at robust regression visualization";
boolean toggleRun;
int num=60;
float[] x=new float[num];
float[] y=new float[num];

void setup(){
  size(1000,500);
  frameRate(1);
  smooth();
  font=loadFont("Kokila-48.vlw");
  textFont(font);
//  85
  randomSeed(95);
  for(int i=0;i<x.length;i++){
  x[i]=random(20,900);
  y[i]=random(-400,-50);
  }
}

float[] xy=new float[x.length];
float[] xx=new float[x.length];
float[] resid=new float[x.length];
float[] residsq=new float[x.length];

void draw(){
  if(toggleRun)
  return;
  
//  axes
  fill(250,10);
  rect(0,0,width,height);
  stroke(100);
  line(25,0,25,height);
  line(0,475,width,475);
  fill(80,160,255);
  text(title,30,30);
  
//  points
  
  translate(25,475);
  strokeWeight(3);
  fill(100);
  for(int i=0;i<x.length;i++){
      ellipse(x[i],y[i],15,15);
      xy[i]=x[i]*y[i];
      xx[i]=x[i]*x[i];
  }
//  slope and intercept
  float xysum=0;
  float xxsum=0;
  float xsum=0;
  float ysum=0;
  float m=0;
  float c=0;
  
  for(int j=0;j<x.length;j++){
     xysum+=xy[j];
     xxsum+=xx[j];
     xsum+=x[j];
     ysum+=y[j];
  }
  m=((x.length*xysum)-(xsum*ysum))/((x.length*xxsum)-(xsum*xsum));
  println(m);
  c=(ysum-(m*xsum))/x.length;
  println(c);
  
//  fitted line
  line(0,c,max(x),(m*(max(x))+c));
  
//  ordinary least square algo
  strokeWeight(1);
  stroke(0,120,0);
  for(int k=0;k<x.length;k++){
     resid[k]=dist(x[k],(m*x[k]+c),x[k],y[k]);
     residsq[k]=resid[k]*resid[k];
     line(x[k],(m*x[k]+c),x[k],y[k]);
  }
//  println(resid);

//  outlier flag
  int outlier=0;
  for(int l=0;l<x.length;l++){
    if(residsq[l]==max(residsq)){outlier=l;}
//    else{outlier=0;}
  }
  println(outlier);
  fill(120,0,0);
  ellipse(x[outlier],y[outlier],30,30);
  y[outlier]=m*x[outlier]+c;
}

void mousePressed(){
  if(mouseButton==LEFT){
    toggleRun=!toggleRun;
  }
}
