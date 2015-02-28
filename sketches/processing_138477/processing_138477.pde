
float x,y;
int i,j;
float n,m;
float a,b;

//void setup(){
  size(240,240);
  background(255);
//}

//void draw(){
  colorMode(HSB);
  for(i=0;i<width;i++){
for(j=0;j<height;j++){
  x=map(i,0,width,0,360);
  y=map(j,0,height,0,360);
  n = norm(i, 0.0, 240.0); 
  m=pow(n,2)*300;
if(j>m){
  stroke(x*1.5,y*0.5,240);
  point(i,j);
}
else {
  stroke(360-x,360-y,120);
  
point(i,j);
}
}
  }
//}


