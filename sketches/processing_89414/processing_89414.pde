
size (1000,500);
for (int i=0; i<10; i++) {
   for (int ii=0; ii<5; ii++) {
      noStroke();
      fill(255-((ii*10+i)/50)*255);
      rect (i*100,ii*100,100,100);
    }  
 }
