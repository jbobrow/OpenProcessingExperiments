


size(400,400);

colorMode(RGB,255);
background(255);
noStroke();


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

int eSize =15;
for(int y = 50; y<=350; y+=20){
for(int x = 50; x<=350; x+=20){
   fill(y/2,x/2,200);
  ellipse(x,y,eSize,eSize);}}

int eSize2 =5;
for(int y = 300; y<=400; y+=10){
for(int x = 300; x<=400; x+=10){
   fill(#AFEEEE-x);
  ellipse(x,y,eSize2,eSize2);}}

int eSize3 =5;
for(int y = 0; y<=100; y+=10){
for(int x = 0; x<=100; x+=10){
   fill(#AFEEEE-x);
  ellipse(x,y,eSize3,eSize3);}}

int eSize4 =5;
for(int y = 300; y<=400; y+=10){
for(int x = 0; x<=100; x+=10){
   fill(#e6e6fa-x);
  ellipse(x,y,eSize4,eSize4); }}

int eSize5 =5;
for(int y = 0; y<=100; y+=10){
for(int x = 300; x<=400; x+=10){
   fill(#e6e6fa-x);
  ellipse(x,y,eSize5,eSize5);}}

int eSize6 =5;
for(int y = 150; y<=250; y+=10){
for(int x = 0; x<=100; x+=10){
   fill(#48D1CC-x);
  rect(x,y,eSize6,eSize6);}}

int eSize7 =5;
for(int y = 150; y<=250; y+=10){
for(int x = 300; x<=400; x+=10){
   fill(#48D1CC-x);
  rect(x,y,eSize7,eSize7);}}

int eSize8 =5;
for(int y = 0; y<=100; y+=10){
for(int x = 150; x<=250; x+=10){
   fill(#4b0082-x);
  rect(x,y,eSize8,eSize8);}}

int eSize9 =5;
for(int y = 300; y<=400; y+=10){
for(int x = 150; x<=250; x+=10){
   fill(#4b0082-x);
  rect(x,y,eSize9,eSize9);}}


