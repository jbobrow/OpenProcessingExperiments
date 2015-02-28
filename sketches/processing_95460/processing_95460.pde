
size(200, 200);
background(255);

noStroke();
fill(0, 50);
ellipse(100,100, 20, 20);
pushMatrix();
for (int x = 0; x <500; x+=1) {
  for (int z = 1; z <200; z += 1) {
translate((-x)*z,(-x)*z);
ellipse(100, 100, 20, 20); 
}
}
