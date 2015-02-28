
size(400,400);
background(0,0,0);

for (int i=0; i<400; i=i+10) 
{
  float r=random(200);
  float s=random(150);
  float t=random(150);
  float w=random(5);
  float x=random(400);
  noFill();
  stroke(r,s,t);
  strokeWeight(w);
  rect(i,s,r,x); 
  for(int u=0; u<400; u=u+100)
 {
  noFill();
  stroke(171,130,255);
  strokeWeight(w);
  triangle(0,0,i,w,i,x);
 }
}
