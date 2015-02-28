
size (600, 600, P3D);
background (#ACF778);
fill (255, 10);


for (int i=0; i<600; i++) {
  float c = random(80);
  float u = random(90);
  float b = random(100);
  box(c, u, b);
  //translate(u, b, c); 
  rotate(c);
}


for (int i=0; i<200; i++) {
  float c = random(200,500);
  float u = random(200,400);
  float b = random(100,500);
  ellipse(height/2, width/2, b, c);
}


