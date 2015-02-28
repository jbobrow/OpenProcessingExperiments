
size(400,400);
background(0);
colorMode(HSB,255);
smooth();
strokeWeight(2);

for(int i=0;i<=width;i=i+15){
float h=map (i,0,width,0,255);
stroke(255-h,255,255);
line(0,i,i+30,height);
stroke(h,255,255);
line(i,0,width,i+30);
line(0,height-i,i+10,0);
line(width-i,400,i+10,0);
}
