
size (800, 800);
smooth();

background(255);
strokeWeight(5);

for (int i=50;i<800;i+=20) {

  line(i, 0, i+i/2, 700);
  line(i+i/2, 700,i*1.2,800);
}
