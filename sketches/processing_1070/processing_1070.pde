
float[] xpoints;
float[] ypoints;
float[] pointColor;
float[] Xspeed;
float[] Yspeed;
int magicNumber;
void setup(){
 size(200,200);
 background(0,0,0);
 magicNumber = width;
xpoints = new float[magicNumber];
ypoints = new float[magicNumber];
Xspeed = new float[magicNumber];
Yspeed = new float[magicNumber];
pointColor = new float[magicNumber];
for(int x = 0;x<xpoints.length;x++){
 xpoints[x] = random(width);
 ypoints[x] = random(width);
 pointColor[x] = 256;
}
}
void draw(){
 for(int x = 0; x<xpoints.length;x++){
  if(xpoints[x] >= width){
    xpoints[x] =1;
    if(pointColor[x]<=0){
   pointColor[x] = 256;
  }else{
   pointColor[x]--;  
  }
  }
  if(xpoints[x] <= 0){
    xpoints[x] =width-1;
    if(pointColor[x]<=0){
   pointColor[x] = 256;
  }else{
   pointColor[x]--;  
  }
  }
  if(ypoints[x] >= height){
    ypoints[x] = 1;
    if(pointColor[x]<=0){
   pointColor[x] = 256;
  }else{
   pointColor[x]--;  
  }
  }
  if(ypoints[x] <= 0){
    ypoints[x] =height-1;
    if(pointColor[x]<=0){
   pointColor[x] = 256;
  }else{
   pointColor[x]--;  
  }
  }
  stroke(pointColor[x],pointColor[x],pointColor[x]);
  point(xpoints[x],ypoints[x]);
  Xspeed[x] = random(-2,2);
  Yspeed[x] = random(-2,2);  
  xpoints[x]+= Xspeed[x];
  ypoints[x]+= Yspeed[x];
  stroke(0,0,0);
  point(xpoints[x],ypoints[x]);
 }  
}
//void mousePressed() {
//  exit();
//}


