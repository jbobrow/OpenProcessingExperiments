
size (800, 800);
smooth();
strokeWeight(2);

background(255);
for (int i=0;i<800;i+=10) {

  line(i, 0, i+i/2, 50);
  line(i+i/2, 50, i*1.2, 300);
  line(i, 300, i*2.4, 600);
  
  line(i+i/2, 600, i*1.2, 800);


}
