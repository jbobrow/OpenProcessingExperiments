
size (255,255);
smooth();
rectMode(CENTER);
ellipseMode(CENTER);
background(-1);
noStroke();
boolean dorect = false;
if(dorect){
fill(255,0,0,128);
rect(width/2-100,height/2-100,150,150);
fill(0,255,0,128);
rect(width/2+100,height/2-100,150,150);
fill(0,0,255,128);
rect(width/2,height/2+100,150,150);
fill(0,0,255,128);
rect(width/2,height/2,250,250);
}

boolean doellipse=true;
if (doellipse){
fill(255,0,0,128);
ellipse(width/2-100,height/2-100,150,150);
for (int x=0;x<150;x++){
  fill(255,0,0,128-x);
  ellipse(width/2-100,height/2-100,x,x);
  
}
fill(0,255,0,128);
ellipse(width/2+100,height/2-100,150,150);
for (int x=0;x<150;x++){
  fill(0,255,0,128-x);
ellipse(width/2+100,height/2-100,x,x);
}
fill(0,0,255,128);
ellipse(width/2,height/2+100,150,150);
for (int x=0;x<150;x++){
 fill(0,0,255,128-x);
ellipse(width/2,height/2+100,x,x);
}
fill(0,0,255,128);
ellipse(width/2,height/2,250,250);
}

for (int x=0;x<width;x++){
 for (int y=0;y<height;y++){
  float dis = dist(width/2,height/2,x,y);
  stroke(-1);
  //if (dis>100)point(x,y);
  if (dis>100)set(x,y,-1);
 } 
}

noFill();
stroke(1);
ellipse(width/2,height/2,200,200);
