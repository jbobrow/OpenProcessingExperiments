
size(500,500); 

background(50, 100, 100); 

for (int i= 0; i< 200; i++) {
  float r = random(10,100);
  stroke(r*1, 50, r*10); 
  strokeWeight(r);
  float offset = r * 5.0;
  line(i-20, 400, i+offset, 0);
}


for (int i= 0; i< 200; i++) {
  float a = random(20,1);
  stroke(a*10, 50, a*3); 
  strokeWeight(a);
  float offset = a * 50.0;
  line(i-20, 400, i+offset, 0);
}


for (int i= 0; i< 200; i++) {
  float d = random(90,255);
  stroke(d*10, 50, d*3); 
  strokeWeight(d);
  float offset = d * 50.0;
  line(i-20, 400, i+offset, 0);
}


