
int eSize = 40;

size(400,400);
colorMode(RGB,400);
background(0);
strokeWeight(0);

for (int y = 0; y <= 400; y += 10){
  for (int x = 0; x <= 400; x += 2){
    
    stroke(x,55,255-x,50);
    
    line(400,0,x,height);
    line(400,400,0,400-x);
}
}

 
for(int x =0; x<=400; x+=10) {
for(int y =0; y<=400; y+=10) {
  
  stroke(255-y,x*2,y);
 line(0,200,1000-x*5,y*5);
 line(400,200,1000-x*5,y*5);
}
}


