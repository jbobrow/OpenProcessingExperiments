
size(500,500);
noStroke();
background(0);
float r = random(10);
for (int i = 0; i < 250; i += r/2) {
  float rr = random(255);
  float rb = random(100);
  float ra = random(120);
  float x = random (0,450);
  float y = random (0,450);
  fill(rr,rr*1.8,rb+60,ra*2);
  ellipse(x,y,r/2,y/2);
  ellipse(x,y,x/2,r/2);
  ellipse(x*1.5,y/1.5,r/2,y/2);
  ellipse(x/1.2,y*1.2,x/2,r/2);
}


