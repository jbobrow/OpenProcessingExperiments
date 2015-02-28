
size (400,400);
background (0);
colorMode(HSB,255);
smooth();
for(int i=0;i<width;i=i+2){
float h=map(i,0,width,0,50);
stroke(h,255,255,40);
line(0,i,i,height);
line(i,0,width,i);
line(0,height-i,i,0);
line(width,i,width-i,height);
}
for(int i=0;i<width;i=i+10){
float h=map(i,0,width,0,50);
stroke(h,255,255,80);
line(0,i,i,height);
line(i,0,width,i);
line(0,height-i,i,0);
line(width,i,width-i,height);
}
for(int i=0;i<width;i=i+10){
float h=map(i,0,width,0,50);
stroke(h,255,255,80);
line(50,i,i,height-50);
line(i,50,width-50,i);
line(50,height-i,i,50);
line(width-50,i,width-i,height-50);
}
for(int i=0;i<width;i=i+10){
float h=map(i,0,width,0,50);
stroke(h,255,255,80);
line(100,i,i,height-100);
line(i,100,width-100,i);
line(100,height-i,i,100);
line(width-100,i,width-i,height-100);
}
for(int i=0;i<width;i=i+10){
float h=map(i,0,width,0,50);
stroke(h,255,255,80);
line(150,i,i,height-150);
line(i,150,width-150,i);
line(150,height-i,i,150);
line(width-150,i,width-i,height-150);
}





