
int eSize=40;
int qSize=500;
int a = -70 ; //quadのｘ座標
int h = -20; //quad no y zahyou
size(800,800);
smooth();
noStroke();
background(10,16,22);
colorMode(HSB);


//under_quad
a=-70;
h = 50;
for(int w = 0; w <= 90; w +=10){
for(int x = 0 ; x < 200 ; x += 20 ){
  fill(180+w-x,90+w,20+w,x/8);
  quad(x+a+w,x+qSize/2+h,x+qSize/2+a+w,x+qSize+h,x+qSize+a+w,x+qSize/2+h
  ,x+qSize/2+a+w,x+h);
 }
}


//top_quad
h = 0;
a=10;
for(int w = 0; w <= 90; w +=10){
for(int x = 0 ; x < 200 ; x += 20 ){
  fill(180+w-x,100+w,500,x/8);//coloer
  quad(x+a+w,x+qSize/2+h,x+qSize/2+a+w,x+qSize+h,x+qSize+a+w,x+qSize/2+h
  ,x+qSize/2+a+w,x+h);
 }
}

//border
colorMode(RGB);
fill(10,16,22,90);
for(float r=1;r<=800; r=r*1.1){
for(int t=0 ;t<=800; t+=11){
  
ellipse(t,r,eSize,eSize);
}
}




