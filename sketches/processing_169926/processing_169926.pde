
size(400,400);
 
colorMode(RGB,255);
background(255);
noStroke();
smooth();
 
fill(#87CEEB);
 
rectMode(CENTER);
rect(25,25,50,50);
rect(375,25,50,50);
rect(25,375,50,50);
rect(375,375,50,50);
 
fill(#E0FFFF);
 
rect(25,200,50,260);
rect(375,200,50,260);
rect(200,25,260,50);
rect(200,375,260,50);
 
fill(#e0ffff);
rect(200,200,100,100);

 
 int eSize1 =7;//hidarishita
for(int y = 200; y<=400; y+=8){
for(int x = 0; x<=200; x+=8){
   if(x >50 && x <200 && y >200 && y<350){
   fill(180,x-100,x,x);
   }else{
   fill(400,x,18,230);
   }
   rect(x,y,eSize1,eSize1);}}
  
int eSize2 =7;//migiue
for(int y = 0; y<=200; y+=8){
for(int x = 200; x<=400; x+=8){
  if(x >200 && x <350 && y >50 && y <200) {
  fill(180,x-100,x,x);
  }else{
   fill(400,x,18,230);
  }
  rect(x,y,eSize2,eSize2);}}
 
 
 
 
int eSize3 =10;//center
for(int y = 50; y<=350; y+=12){
for(int x = 50; x<=350; x+=12){
  if(x> 120 && x<280 && y>120 && y<280){
  fill(y/2,x/2,200);
  }else{
   fill(x, 200-y, 510-y, 200);
  } 
  ellipse(x,y,eSize3,eSize3);}}

int eSize4 =5;//centerue
for(int y = 150; y<=250; y+=7){
for(int x = 0; x<=100; x+=7){
   fill(#48D1CC-x);
  rect(x,y,eSize4,eSize4);}}
 
int eSize5 =5;//centershita
for(int y = 150; y<=250; y+=7){
for(int x = 300; x<=400; x+=7){
   fill(#48D1CC-x);
  rect(x,y,eSize5,eSize5);}}
 
int eSize6 =5;//centerhidari
for(int y = 0; y<=100; y+=7){
for(int x = 150; x<=250; x+=7){
   fill(#4b0082-x);
  rect(x,y,eSize6,eSize6);}}
 
int eSize7 =5;//centermigi
for(int y = 300; y<=400; y+=7){
for(int x = 150; x<=250; x+=7){
   fill(#4b0082-x);
  rect(x,y,eSize7,eSize7);}}
  



