
size(600,600);
background(100);
randomSeed(6);
for (int i=10; i<200; i+=10)
{
  float r=random(0, 700);
  noStroke();
  fill(i*i,i*2,190);
  ellipse(r,i,r/7,r/7);
  ellipse(i,r,r/10,r/10);
  ellipse(r,i*2,20,20);
  //fill(i*i,i*2,190,r);
  ellipse(r,i*2,r/3,r/3);
  fill(i*i,i*2,190,150);
  ellipse(r,i*3,r/2.5,r/2.5);
  fill(i*r,r*2,200);
  ellipse(i*2,r,10,10);
  if(i<100)
  {
  strokeWeight(100);
  stroke(i*i,i*2,190,180);
  line(i*5,0,i*5,600);
  }
  else
  {
  strokeWeight(300);
  stroke(i*i,i*2,190,200);
  line(i*5,0,i*5,600);
  }
}
