
//透明度叠加的经典阐释;it if from PROCESSING HANDBOOK
size(500,500);
noStroke();
fill(0,56);
for (int x = -10;x<=width;x+=10){
  for (int y = -10;y<=height;y+=10){
    ellipse(x+y/8,y+x/8,15+x/2,10);
  }
}
