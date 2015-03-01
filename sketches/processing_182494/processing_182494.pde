
size (600,400);
background(250);
for(int i=0; i<=1000; i=i+20)
{
  float w = random(255);
  float y = random (10);
  float z = random(600);
  float x = random(600);
  strokeWeight(1);
  fill(250,250,250,w);
  noStroke();
  ellipse(x,z,10,10);
  stroke(1);
  strokeWeight (y*2);
  line(i+10,100,i+10,0);
  line(i+10,100,i-50,200);
  line(i-50,200,i,300);
  line(i,300,i,400);
 
  }
