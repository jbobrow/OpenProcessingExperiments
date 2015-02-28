
size(500,500);
background(255);
smooth();

strokeWeight(2);

for(int i=0; i<515; i=i+10){
   for(int j=0; j<515; j=j+15) {
          float fv = map(i*j, 0, 120000, 0, 90);
     stroke(fv,203,66,16);
     line(j, i, 0, 0);
      stroke(fv,203,66,16);
     line(j, i, 500, 0);
     stroke(fv,152,44,25);
     line(j, i,  250, 250);   
   }
}


