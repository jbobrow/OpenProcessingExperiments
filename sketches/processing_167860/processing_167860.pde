
int eSize = 10;

size(400, 400);
colorMode(RGB, 400);
background(400);
smooth();
noStroke();

for (int y = 0; y <200; y += 10) { //upperleft
  for (int x = 0; x < 200; x += 8) {
    fill(400-(y+x), 100, 250, 350);
    ellipse(x, y, eSize, eSize);
  }
}
for (int y = 0; y <200; y += 10) { //upperrRight
  for (int x = 200; x < 400; x += 8) {
    fill(x-y, 100, 250, 350);
    ellipse(x, y, eSize, eSize);
  }
}



for (int y = 200; y < 400; y += 10) {//downleft
  for (int x = 0; x < 200; x += 8) {
    fill(y-x, 100, 250, 350);
    ellipse(x, y, eSize, eSize);
  }
}

for (int y = 200; y < 400; y += 10) {//downRight
  for (int x = 200; x < 400; x += 8) {
    fill((x+y)-400, 100, 250, 350);
    ellipse(x, y, eSize, eSize);
  }
}


for(int y = 0; y <=400; y += 10) { 
for (int x = 0; x <= 400; x += 10) {
 fill(400);
 ellipse(x,y,eSize,eSize);
}
}

 

for(int x= 0; x <= 380; x+=40){ 
  stroke(0,100,x,x); 
  noFill(); 
  ellipse(0,-50,x,x); 

}


for(int x= 0; x <= 500; x+=50){ 
  stroke(0,100,x,x); 
  noFill(); 
  ellipse(330,-20,x,x); 

}


