
int eSize = 3;

size(510, 510);
background(255);

for(int x=0; x<=width; x+=1){
  stroke(x,179,66,100);
  line(x, 0, x, height);
  line(0, x, width, x);
}

for(int x=0; x<=width; x+=5){
  stroke(x,179,66,255);
  line(x, 0, x, height);
  line(0, x, width, x);
}

for(int y=50; y<=height-50; y+=10){
  for(int x=50; x<=width-410; x+=10){
    fill(255);
    noStroke();
    ellipse(x, y, eSize, eSize);
  }
}


for(int y=50; y<=height-50; y+=10){
  for(int x=410; x<=width-50; x+=10){
    fill(255);
    noStroke();
    ellipse(x, y, eSize, eSize);
  }
}

for(int y=50; y<=height-410; y+=10){
  for(int x=50; x<=width-50; x+=10){
    fill(255);
    noStroke();
    ellipse(x, y, eSize, eSize);
  }
}

for(int y=410; y<=height-50; y+=10){
  for(int x=50; x<=width-50; x+=10){
    fill(255);
    noStroke();
    ellipse(x, y, eSize, eSize);
  }
}




