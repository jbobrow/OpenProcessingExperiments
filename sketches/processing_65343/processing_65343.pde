
size(400, 400);

smooth();

colorMode(RGB, 255);

background(0, 0, 0);

for (int i=0;i<80;i++) { 
  stroke(0, random(200), 255, random(255));
  float ry1=random(height);
  float ry2=random(height);
  line(0, ry1, width, ry2);
}


