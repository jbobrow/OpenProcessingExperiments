
size(200,200);
background(245,245,245);
int t=1;
for(int x=10;t<width;x+=22){
  if(t%2!=0){
  rectMode(CENTER);
  fill(255,0,0);
  rect(x,height/2,18,18);
  }else{
    fill(0,255,0);
    ellipse(x,height/2,18,18);
  }
  t++;
}

