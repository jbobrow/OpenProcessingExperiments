
size (500,500);
background(250);
float r;
noStroke();
for (int i=0; i<30; i++){
  r=round(random(width));
  if (r>(width/2)){
  fill(r/2,r/3,r/2,r/3);
  ellipse(r,r,r,r);
 }else{
  fill(r/3,r/3,r/2,r/3);
  ellipse(r,r,r,r);
 }
}


