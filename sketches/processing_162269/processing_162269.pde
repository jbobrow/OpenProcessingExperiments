
size(500,500);
background(0);

for (int i = 0; i < 500; i++) {
  float r = random(10);
  float rr = random(150);
  float rb = random(155);
  float rg = random(255);
  float ra = random(120);
  stroke(rr,rb,rg,ra);
  strokeWeight(r);
  float offset = r * 5.0;
  line (i+40,500,i-offset,0);
}


