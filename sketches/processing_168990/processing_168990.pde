
int eSize = 10;
  
size(400, 400);
colorMode(RGB,400);
background(5000);
noStroke();
for(int y=0; y<=400; y +=10){
for(int x=0; x<=400; x +=10){
  stroke(y,x,0,0);
  fill(x,y,100,190);
  rect(x, y, eSize, eSize);
}
} 

for(int x=0; x<=400; x +=23){
fill(50,x,100,200);
ellipse(x,0,100,100);
}

for(int x=0; x<=400; x +=23){
fill(50,x,100,160);
ellipse(x,80,100,100);
}

for(int x=0; x<=400; x +=23){
fill(50,x,100,120);
ellipse(x,160,100,100);
}
for(int x=0; x<=400; x +=23){
fill(50,x,100,80);
ellipse(x,220,100,100);
}
for(int x=0; x<=400; x +=23){
fill(50,x,100,40);
ellipse(x,300,100,100);
}
for(int x=0; x<=400; x +=23){
fill(50,x,100,20);
ellipse(x,380,100,100);
}


