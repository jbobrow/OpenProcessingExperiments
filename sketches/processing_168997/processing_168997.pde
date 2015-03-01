
int eSize = 7;

size(400,400);
colorMode(RGB,256);
background(171,244,255);
noStroke();



for(int k=0; k<=400; k+=10){
 for(int h=0; h<=400; h+=10){
  fill(0,k,h,50);
  ellipse(k,h,15,15);
 } 
}

for(int z=0; z<=200; z+=10){
  fill(random(250),random(250),random(250),70);
  ellipse(random(400),random(400),40,40);
  ellipse(random(200),random(200),120,120);
}


for(int n=0; n<=300; n+=10){
 for(int m=0; m<=400; m+=5){
  fill(m,n,250);
  ellipse(m,390,3,3);
  ellipse(m,370,3,3);
  ellipse(m,345,3,3);
  ellipse(m,310,3,3);
  ellipse(m,270,3,3);
 }
}

for(int y=0; y<=400; y+=25){
 for(int x=0; x<=300; x+=20){
  fill(x,y,250);
  ellipse(270,x,eSize,eSize);
  ellipse(295,10+x,eSize,eSize);
  fill(x,y,200);
  ellipse(310,x,eSize,eSize);
  ellipse(325,10+x,eSize,eSize);
  fill(x,y,150);
  ellipse(350,x,eSize,eSize);
  ellipse(375,10+x,eSize,eSize);
  fill(x,y,100);
  ellipse(400,x,eSize,eSize);
 }
}

for(int l=0; l<=400; l+=30){
  for(int i=0; i<=400; i+=30){
    noFill();
    stroke(0,l,i,50);
    ellipseMode(CORNERS);
    ellipse(l,i,700,700);  
  }
}



