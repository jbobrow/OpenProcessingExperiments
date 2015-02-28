
//Copyright Christopher Henley 2014

size(600,300);
rectMode(CORNER);

fill(0);
rect(0,0,width/2,height);
fill(255);
rect(width/2,0,width/2,height);

int wd=(width/2)/25;

int a=0;
while(a<width/2){
  fill(255,0,0);
  rect(a,0,wd,wd);
  rect(a,height-wd,wd,wd);
  rect(0,a,wd,wd);
  rect((width/2)-wd,a,wd,wd);
  a+=wd;
}

for (int b=0; b<width/2; b+=wd){
  fill(0,0,255);
  ellipse(b+width/2,b,wd,wd);
  ellipse(width-b,b,wd,wd);
}
  
  





