
size(400, 400, P3D);
background(0);
colorMode(RGB, 255);
noStroke();
smooth();

directionalLight(126, 126, 126, 0, 0, -1);
ambientLight(102, 102, 102);

for (int i=0; i<200; i++) {
  
  float y1 = random(100, 200);
  float y2 = random(10, 12);
  float y3 = random(10,20);
  float y4 = random(100,200);
  
  translate(y1, y2, y3);
  
  rotateY(PI/8);
  
  
   fill(255-y4, 255-y4, 200 , 100);
  float x = random(10, 150);
  box(x);
  
   
}

