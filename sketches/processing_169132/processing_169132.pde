
size(400,400);
background(RGB,255);
noStroke();

for(int r=0; r<=250; r+=10){
 for(int g=0; g<=250; g+=10){
  for(int b=0; b<=250; b+=10){
   
  if(r<140 && g<170 && b<170){
  fill(0,0,0,0);}
  else{
  fill(random(250),random(250),random(250),90);}
  
  ellipse(random(400),random(400),40,40);
  ellipse(random(200),random(200),120,120);
  }
 }
}


for(int m=0; m<=400; m+=30){
  for(int n=0; n<=400; n+=30){
    noFill();
    stroke(n,m,0,80);
    quad(120,120,120,120,m,400,400,n);
    quad(0,0,0,0,400,n,m,400);
    stroke(0,m,n,40);
    quad(280,280,280,280,m,0,0,n);
    quad(400,400,400,400,0,n,m,0);
  }
}


