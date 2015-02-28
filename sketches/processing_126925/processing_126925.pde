
/* @pjs preload = "apple_mask.png"; */
/*@pjs preload = "apple_maskaka.png"; */
PImage img;



PFont Apple;


int eSize = 10;
int eSize2 = 15;
int eSize3 = 13;
int eSize4 = 10;
int eSize5 = 5;
int eSize6 = 7;
int eSize7 = 17;
int eSize8 = 20;
int eSize9 = 20;
int eSize10 = 6;
int eSize11 = 11;
int eSize12 = 6;
int eSize13 = 12;
int eSize14 = 14;
int eSize15 = 14;
int eSize16 = 10;
int eSize17 = 6;
int eSize18 = 11;

////hayai/////
float speed2=3;
float y2 =0;

float speed4=5;
float y4 =0;

float speed6=4;
float y6 =0;

float speed7=3.5;
float y7 =0;

float speed8=6.5; //dekai
float y8 =0;

float speed11=5.3; 
float y11 =0;

float speed13=4.5; 
float y13 =0;

float speed14=5.5; 
float y14 =0;

float speed16=6; 
float y16 =0;


/////osoi/////
float speed=0.7;
float y =0;

float speed3=2;
float y3 =0;

float speed5=1;
float y5 =0;

float speed9=3; //dekai
float y9 =0;

float speed10=1.5;
float y10 =0;

float speed12=0.6;
float y12 =0;

float speed15=1.2;
float y15 =0;

float speed17=2.5;
float y17 =0;

float speed18=0.5;
float y18 =0;



/////timer/////
int timer = 0;

float x;

void setup(){
size(450, 450);
noStroke();
fill(255);
frameRate(5);
smooth();
x = 0;
//Apple = loadFont("BodoniMTCondensed-60.vlw");


}


void draw(){
  


/////img/////
background(10, 18, 80);

if(timer > 50*5){
  fill(255);
  rect(0,400,445,200);
}
timer++;

if(timer > 55*5){
  fill(255);
  rect(0,380,445,150);
}
timer++;

if(timer > 60*5){
  fill(255);
  rect(0,350,445,150);
}
timer++;

if(timer > 70*5){
  fill(255);
  rect(0,320,445,150);
}
timer++;

if(timer > 75*5){
  fill(255);
  rect(0,280,445,150);
}
timer++;

if(timer > 85*5){
  fill(255);
  rect(0,250,445,150);
}
timer++;

if(timer > 90*5){
  fill(255);
  rect(0,220,445,150);
}
timer++;

if(timer > 100*5){
  fill(255);
  rect(0,190,445,150);
}
timer++;

if(timer > 110*5){
  fill(255);
  rect(0,160,445,150);
}
timer++;

if(timer > 115*5){
  fill(255);
  rect(0,140,445,150);
}
timer++;

img = loadImage("apple_mask.png");
tint(0, 18, 80);
image(img, 0, 80);

//snow

/////osoi/////

for(int x=0; x<450; x+=136) {    
  ellipse(x, y, eSize, eSize); 
y = y + speed;
if(y >= height){
  y =0;

  }
}

for(int i=15; i<450; i+=150) {    
  ellipse(i, y3, eSize3, eSize3); 
y3 = y3 + speed3;
if(y3 >= height){
  y3 =0;
  }
}

for(int i=10; i<450; i+=110) {    
  ellipse(i, y5, eSize5, eSize5); 
y5 = y5 + speed5;
if(y5 >= height){
  y5 =0;
  }
}

for(int i=5; i<450; i+=250) {    
  ellipse(i, y9, eSize9, eSize9); 
y9= y9 + speed9;
if(y9 >= height){
  y9 =0;
  }
}

for(int i=40; i<450; i+=170) {    
  ellipse(i, y10, eSize10, eSize10); 
y10= y10 + speed10;
if(y10 >= height){
  y10 =0;
  }
}

for(int i=30; i<450; i+=160) {    
  ellipse(i, y12, eSize12, eSize12); 
y12= y12 + speed12;
if(y12 >= height){
  y12 =0;
  }
}

for(int i=25; i<450; i+=160) {    
  ellipse(i, y15, eSize15, eSize15); 
y15 = y15 + speed15;
if(y15 >= height){
  y15 =0;
  }
}

for(int i=8; i<450; i+=155) {    
  ellipse(i, y17, eSize17, eSize17); 
y17 = y17 + speed17;
if(y17 >= height){
  y17 =0;
  }
}

for(int i=110; i<450; i+=150) {    
  ellipse(i, y18, eSize18, eSize18); 
y18 = y18 + speed18;
if(y18 >= height){
  y18 =0;
  }
}

/////hayai/////


for(int i=10; i<450; i+=150) {    
  ellipse(i, y2, eSize2, eSize2); 
y2 = y2 + speed2;
if(y2 >= height){
  y2 =0;
  }
}

for(int i=10; i<450; i+=125) {    
  ellipse(i, y4, eSize4, eSize4); 
y4 = y4 + speed4;
if(y4 >= height){
  y4 =0;
  }
}

for(int i=10; i<450; i+=136) {    
  ellipse(i, y6, eSize6, eSize6); 
y6 = y6 + speed6;
if(y6 >= height){
  y6 =0;
  }
}

for(int x=0; x<450; x+=170) {    
  ellipse(x, y7, eSize7, eSize7); 
y7 = y7 + speed7;
if(y7 >= height){
  y7 =0;

  }
}

for(int x=200; x<450; x+=200) {    
  ellipse(x, y8, eSize8, eSize8); 
y8 = y8 + speed8;
if(y8 >= height){
  y8 =0;

  }
}


for(int x=26; x<450; x+=147) {    
  ellipse(x, y11, eSize11, eSize11); 
y11 = y11 + speed11;
if(y11 >= height){
  y11 =0;

  }
}


for(int x=30; x<450; x+=140) {    
  ellipse(x, y13, eSize13, eSize13); 
y13 = y13 + speed13;
if(y13 >= height){
  y13 =0;
  }
}

for(int x=90; x<450; x+=100) {    
  ellipse(x, y14, eSize14, eSize14); 
y14 = y14 + speed14;
if(y14 >= height){
  y14 =0;
  }
}

for(int x=5; x<450; x+=90) {    
  ellipse(x, y16, eSize16, eSize16); 
y16 = y16 + speed16;
if(y16 >= height){
  y16 =0;
  }
}


x = x + speed;
println(x);

}


////event/////

void mousePressed(){
  if(x > 40){
   //////logo/////
//textFont(Apple, 60);
//fill(0);
//text("Apple" , 170,330);

img = loadImage("apple_maskuaka.png");

tint(255, 0, 0);
image(img, 0, 80);
   
    
 }
 
 
 // }
}





