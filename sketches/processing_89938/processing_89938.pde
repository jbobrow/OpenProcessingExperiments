
PFont font;
String title="Robust regression visualization";
boolean toggleRun;
int num=20;

ArrayList cord=new ArrayList(num);

void setup(){
  size(1000,500);
  background(255);
  frameRate(1);
  smooth();
  font=loadFont("Kokila-48.vlw");
  textFont(font);
//  85
 randomSeed(85);
 
  for(int i=0;i<num;i++){
    PVector point=new PVector(random(20,900),random(-400,-50));
  cord.add(point);
  }
}



float[] xy=new float[num];
float[] xx=new float[num];
float[] resid=new float[num];
float[] residsq=new float[num];

void draw(){
  if(toggleRun)
  return;
println(cord.size());
//  axes
  fill(255,10);
  rect(0,0,width,height);
  stroke(100);
  line(25,0,25,height);
  line(0,475,width,475);
  fill(8,160,255);
  textSize(30);
  text(title,240,30);
  textSize(18);
  text("...approximation of bisquare function",350,45);
  
//  points
  
  translate(25,475);
  strokeWeight(3);
  fill(100);
  for(int i=0;i<cord.size();i++){
   PVector pointcord=(PVector)cord.get(i);
   float pointx=pointcord.x;
   float pointy=pointcord.y;
      ellipse(pointx,pointy,15,15);
      xy[i]=pointx*pointy;
      xx[i]=pointx*pointx;
  }
//  slope and intercept
  float xysum=0;
  float xxsum=0;
  float xsum=0;
  float ysum=0;
  float m=0;
  float c=0;
  
  for(int j=0;j<cord.size();j++){
   PVector pointcord=(PVector)cord.get(j);
   float pointx=pointcord.x;
   float pointy=pointcord.y;
     xysum+=xy[j];
     xxsum+=xx[j];
     xsum+=pointx;
     ysum+=pointy;
  }
  m=((cord.size()*xysum)-(xsum*ysum))/((cord.size()*xxsum)-(xsum*xsum));
  println(m);
  c=(ysum-(m*xsum))/cord.size();
  println(c);
  
  
//  fitted line
  stroke(0);
  line(0,c,width-20,(m*(width-20)+c));
  
//  ordinary least square algo
  strokeWeight(1);
  stroke(0,120,0);
  for(int k=0;k<cord.size();k++){
    PVector pointcord=(PVector)cord.get(k);
    float pointx=pointcord.x;
    float pointy=pointcord.y;
     resid[k]=dist(pointx,(m*pointx+c),pointx,pointy);
     residsq[k]=resid[k]*resid[k];
     line(pointx,(m*pointx+c),pointx,pointy);
  }
//  println(resid);

//  outlier flag
  int outlier=0;
  for(int l=0;l<cord.size();l++){
    if(residsq[l]==max(residsq)){outlier=l;}

  }
  
//  Residual cutoff
   if(resid[outlier]<100){noLoop();}
   
//  outlier treatment
//  old method
  println(outlier);
  fill(120,0,0);
  PVector pointcord=(PVector)cord.get(outlier);
    float pointx=pointcord.x;
    float pointy=pointcord.y;
  ellipse(pointx,pointy,30,30);
  cord.remove(outlier);
  
 
  
}
 
void mousePressed(){
  if(mouseButton==LEFT){
    toggleRun=!toggleRun;
  }
}
