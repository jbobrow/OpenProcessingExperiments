
int eSize = 10;

size(400,400);

colorMode(RGB,400);
background(400);
//noStroke();

for(int y =0; y <=400; y += 10) {
for(int x =0; x <=400; x += 10) {
  stroke(y,x,0,400);
  stroke(y,x,400,0);
  fill(x,400,y,400);
  rect(x,y,eSize,eSize);
  ellipse(x,200,eSize,eSize);
  ellipse(200,200,eSize,eSize);
  ellipse(100,100,eSize,eSize);
  ellipse(100,300,eSize,eSize);
  fill(x,400,x,400);
  ellipse(300,100,eSize,eSize);
  ellipse(300,300,eSize,eSize);
  fill(x,400,x,y);
  ellipse(200,y,eSize,eSize);
  ellipse(x,100,eSize,eSize);
  ellipse(x,300,eSize,eSize);
   fill(200,y,x,200);
  ellipse(350,y,eSize,eSize);
  ellipse(50,y,eSize,eSize);
}
}
for(int y =0; y <=400; y += 10) {
for(int x =0; x <=400; x += 10) {
  fill(200,y,x,200);
  ellipse(300,y,eSize,eSize);
  ellipse(100,y,eSize,eSize);
  ellipse(x,y,eSize,eSize);
  ellipse(x,y,eSize,eSize);
 fill(300,y,x,300);
  ellipse(300,y,eSize,eSize);
  ellipse(100,y,eSize,eSize);
}
}
 for(int y =0; y <=400; y += 10) {
for(int x =0; x <=400; x += 10) {
  fill(200,y,x,200);
  ellipse(x,100,eSize,eSize);
  ellipse(x,300,eSize,eSize); 
 }
} 
   for(int y =0; y <=400; y += 10) {
for(int x =0; x <=400; x += 10) {
  fill(100,y,x,100);
  ellipse(x,y,eSize,eSize);
  ellipse(x,y,eSize,eSize); 
   }
} 
    for(int y =0; y <=400; y += 10) {
for(int x =0; x <=400; x += 10) {
  fill(50,y,x,50);
  ellipse(150,y,eSize,eSize);
  ellipse(250,y,eSize,eSize); 
   }
} 
  


