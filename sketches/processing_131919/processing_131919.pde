
size(400,400);
background(255,255,255);
for (int a=0; a<400; a+=5) {
  float r=random(400);
  float t=random(400);
  float y=random(400);
  float u=random(10);
  stroke(r,t,y);
  strokeWeight(u);
  line(r,r,r,a);
}
  strokeWeight(50);
  stroke(255,255,255);
  noFill();
  ellipse(320,250,200,200);
