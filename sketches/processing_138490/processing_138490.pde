
int i,j;
float x,y;
color c;
String m;

size(640,640);
background(255);


for(i=0;i<width;i++){
for(j=0;j<height;j++){
  x=map(i,0,width,0,255);
  y=map(j,0,height,0,255);
  
if(i>200 && i<440 && j>200 && j<440){
  c=color(x+15,y+15,155);
println(hex(c));
stroke(c);
point(i,j);}
else {
  c=color(x+1,y+1,140);
  println(hex(c));

//m=hex(c);
stroke(c);
  
point(i,j);
}
}
}



