
size(250,250);
background(#745f8a);//backgrong circles
for(int m=0;m<400;m+=10){
  noStroke();
  strokeWeight(0.3);
  fill(#b095a3,10);
  ellipse(width/2,height/2,300-m,300-m);
  }
for(int n=0;n<300;n+=1){//top triangle
  stroke(#60b086);
  strokeWeight(1);
  noFill();
  smooth();
  float x1=random(0,width/2);
  float y1=random(0,height/2);
  if(x1>=y1){
  ellipse(x1,y1,15,15);}
  float x2=random(125,250);
  float y2=random(0,125);
  if (x2<=250-y2){
  ellipse(x2,y2,15,15);}
}
for(float p=0;p<100;p+=7){//tw0 branches
  float x3=125;
  float y3=120;
  ellipse(x3+p,y3+p,15,15);
  ellipse(x3-p,y3+p,15,15);
  }
  

