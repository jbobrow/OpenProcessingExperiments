
size(500,500);
smooth();

colorMode(HSB);
for(int i=0; i<width;i++){


for (int x=5;x<=500;x+=40){
  for(int y=5;y<=500;y+=40){
    stroke(i*255.0/width,255,255);
    fill(i*255.0);
    line(i,0,i,height);
    fill(#FFFFFF);
rect(x,y,10,10);
}
}
}


for(int x=0;x<25;x++){
  for(int y=0;y<25;y++){
    float r= random(500);
  ellipse(x*20,y+r,15,15);
  }
}
