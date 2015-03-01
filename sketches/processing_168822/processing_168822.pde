
int eSize = 10;

size(400,400);
colorMode(RGB,400);
background(350,30,300,0);
noStroke();

for(int i=-40; i<=400; i+=20){
  fill(400-i,0,200,200);
  triangle(i,0,40+i,0,20+i,40);
}
for(int i=-40; i<=400; i+=20){
  fill(390-i,0,200,200);
  triangle(-20+i,40,20+i,40,0+i,80);
}
for(int i=-40; i<=400; i+=20){
  fill(380-i,0,200,200);
  triangle(i,80,40+i,80,20+i,120);
}
for(int i=-40; i<=400; i+=20){
  fill(370-i,0,200,200);
  triangle(-20+i,120,20+i,120,0+i,160);
}
for(int i=-40; i<=400; i+=20){
  fill(360-i,0,200,200);
  triangle(i,160,40+i,160,20+i,200);
}
for(int i=-40; i<=400; i+=20){
  fill(350-i,0,200,200);
  triangle(-20+i,200,20+i,200,0+i,240);
}
for(int i=-40; i<=400; i+=20){
  fill(340-i,0,200,200);
  triangle(i,240,40+i,240,20+i,280);
}
for(int i=-40; i<=400; i+=20){
  fill(330-i,0,200,200);
  triangle(-20+i,280,20+i,280,0+i,320);
}
for(int i=-40; i<=400; i+=20){
  fill(320-i,0,200,200);
  triangle(i,320,40+i,320,20+i,360);
}
for(int i=-40; i<=400; i+=20){
  fill(310-i,0,200,200);
  triangle(-20+i,360,20+i,360,0+i,400);
}



