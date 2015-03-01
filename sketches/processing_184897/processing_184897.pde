
size(400,400);
background(0);
smooth();
noStroke();

for (int i = 0; i <=height; i += 30){
  for (int z = 0; z <=width; z += 30){
    fill(255, 140);
    ellipse(i, z, 40, 40);
  }
}

smooth();
noStroke();
fill(250,0,0,100);
rect(200,200,400,400);
fill(0,250,0,100);
rect(0,200,400,400);
fill(0,0,250,100);
rect(200,0,400,400);
fill(12,89,91,100);
rect(0,0,400,400);


