
size(250,250);
background(0);
smooth();
noStroke();


for(int y=25; y<=height; y+=50){
  for(int x=25; x<=width; x+=50){
    fill(247,190,30);
    ellipse(y,x,50,50);
    fill(250,68,40);
    ellipse(y,x,25,25);
  }
}

for(int l=0; l<=height; l+=50){
  for(int m=0; m<=width; m+=50){
    fill(137,252,255,140);
    ellipse(l,m,50,50);
  }
}

