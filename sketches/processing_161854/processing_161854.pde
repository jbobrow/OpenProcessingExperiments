
size (1000,1000);
noStroke ();
 for (int i=0; i<100; i++) {
   for (int j=0; j<100; j++){
        fill ((i+j)*1.4,100,255);
        rect (i*9.999,j*9.999,200,200);
      }
 }
for (int x=17; x<1000; x+=17) {
  for (int y=0; y<x; y+=17) {
    stroke (175,206,169); 
    fill (x*0.25,y*0.25,(x+y)*0.25, 150);
    ellipse (x*1.5, y*1.5, 300, 300);
    
    fill (x*0.25,y*0.25,(x+y)*0.25, 10);
    ellipse (1000-x*1.5, 1000-y*1.5, 300, 300);
  }
}
fill (244, 38, 192, 50);
noStroke ();
ellipse (1000, 1000, 1500,1500);
ellipse (0, 0, 1500,1500);

