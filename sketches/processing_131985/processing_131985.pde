
size(400,400);
background(110,212,240);
noStroke();
fill(255,255,255,15);
for(int k=0; k<400; k=k+10){
  ellipse(200,200,k,k);
}
for(int l=0; l<=400; l=l+10){
  for(int m=0; m<=400; m=m+10){
  float r=random(400);
    stroke(255,255,255,20);
    fill(237,208,76,50);
    ellipse(r,m,20,20);
  }
}
stroke(0);
for(int i=0; i<=400; i=i+400){
  for(int j=20; j<=380; j=j+4){
    if(i==0){
      line(width/2,i,j,400);
    }
    else{
      line(width/2,i,j,0);
    }
  }
}
      
    

