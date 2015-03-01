
int eSize = 5;

size(400,400);
colorMode(RGB,400);
background(255);
noStroke();
smooth();



for(int y=0; y<=400; y+=5){
  for(int x=0; x<=400; x+=5){
    fill(x,y,255,400);
    rect(x,y,eSize,eSize);
  }
}


fill(255,250,0,150);
noStroke();
ellipse(50,50,55,55);

fill(255,250,0,150);
noStroke();
ellipse(50,50,40,40);

fill(255,110,110,150);
noStroke();
ellipse(115,115,80,80);

fill(255,110,110,150);
noStroke();
ellipse(115,115,60,60);

fill(110,255,110,150);
noStroke();
ellipse(200,200,120,120);

fill(110,255,110,150);
noStroke();
ellipse(200,200,95,95);

fill(110,110,255,150);
noStroke();
ellipse(320,320,175,175);

fill(110,110,255,150);
noStroke();
ellipse(320,320,145,145);


 
for (int x = 0; x<=width; x ++){
  stroke(400,400,60,10); 
  line( width, 173, x, height); 
}

for (int x = 0; x<=width; x ++){
  stroke(400,400,60,10); 
  line( width, -220, x, height); 
}

for (int x = 0; x<=width; x ++){
  stroke(400,400,60,30); 
  line( width, -1180, x, height); 
}

for (int x = 0; x<=width; x ++){
  stroke(400,400,60,60); 
  line( width, -6000, x, height); 
}


