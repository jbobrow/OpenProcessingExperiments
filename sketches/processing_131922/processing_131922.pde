
size(400,250);
background(134,204,94);
fill(98,138,76,100);
stroke(255,255,255,255);
ellipse(width/2,height/2,250,250);
noFill();
for(int i=0; i<600; i=i+20){
if(5<7){
  ellipse(width/2,height/2,i,i);
  }
else {
  ellipse(10,10,i,i);
}
}
for(int j=0; j<=500; j=j+50){
  if(7<10){
    line(width/2,height/2,j,0);
  }
  else{
    line(10,10,50,50);
  }
}
for(int k=0; k<=250; k=k+50){
  if(11>8){
    line(width/2,height/2,0,k);
  }
  else{
    point(25,8);
  }
}
for(int l=0; l<=250; l=l+50){
  if(7<13){
    line(width/2, height/2,500,l);
  }
  else{
    triangle(20,20,10,50,40,50);
  }
}
for(int m=0; m<=500; m=m+50){
  if(7<10){
    line(width/2,height/2,m,250);
  }
  else{
    line(10,10,50,50);
  }
}
fill(15,15,15,1);
noStroke();
for(int i=0; i<350; i=i+5)
{
  fill(0,0,0,15);
  ellipse(width/2, height/2, i,i);
}
fill(48,100,94,20);
for(int i=0; i<70; i=i+5){
  ellipse(width/2, height/2, i,i);
}

