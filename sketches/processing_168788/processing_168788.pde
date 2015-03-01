
int eSize=10;

size(400, 400);
colorMode(RGB, 400);
noStroke();
background(0);

for(int y = 0; y<=400; y+= 10){
for (int x=0; x<=400; x += 10) {
  fill(95^y, 50^x, 90^x, 30^y);
  rect(13^x,13^y, eSize, eSize);
  ellipse(20^x,10^y,eSize,eSize);
}
}




