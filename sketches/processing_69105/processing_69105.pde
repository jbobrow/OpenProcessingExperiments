
size (400, 400);
background(255);

for(int v = 1; v<= 400; v = v + 20){
  for(int w = 30; w<= 400; w = w + 50){
    for(int z = 20; z<= 400; z = z+ 60){
  
  fill(72, 0, 50, 8);
  triangle(v, 1, w, 150, z, 400 );
    }
  }
}
