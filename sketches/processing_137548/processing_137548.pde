
int i,j;
float x,y;



size(640,640);
background(225,240,250);

for(i=0;i<width;i++){
for(j=0;j<height;j++){
  x=map(i,0,width,0,255);
  y=map(j,0,height,0,255);
  
if(i>200 && i<440 && j>200 && j<440){
  stroke(x+20,y+20,155);
point(i,j);}
else {
  stroke(x,y,140);
point(i,j);
}
}
}



