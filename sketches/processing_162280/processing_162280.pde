
size(500,500);
background(50);
float v = 0.0;
float inc = 0.1;
noStroke();

noiseSeed(22);
for (int i = -150; i < width; i +=3.5) {
  float n = noise(v) * 420.0;
  fill(100,150,230,50);
  ellipse(i+120,n,35,120);
  n = noise(v) * 120.0;
  fill(200,150,130,60);
  ellipse(i+80,n,15,120);
  n = noise(v) * 220.0;
  fill(100,150,230,40);
  ellipse(i+120,n,35,120);
   fill(200,150,130,38);
  ellipse(i+80,n,15,120);
  n = noise(v) * 620.0;
  fill(100,250,160,20);
  ellipse(i+120,n,35,120);
  n = noise(v) * 880.0;
  fill(100,250,160,60);
  ellipse(i+120,n,35,120);
 
 
  v += inc;
}



