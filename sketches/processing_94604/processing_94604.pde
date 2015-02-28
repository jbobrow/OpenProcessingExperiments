
int i;
float x,y;
size(400,400);
noStroke();
smooth();
for (i=1;i<=1000;i++){
  x=random(400);
  y=random(400);
  fill(random(255),random(255),random(255));
  ellipse(x,y,20,20);
}
