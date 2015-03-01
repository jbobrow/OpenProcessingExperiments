

size(800,800);
background(50);
rectMode(CENTER);



 float r=0;
 r= r+.005;
  for(int i=25; i<800; i= i+50){
    for(int j=25; j<800; j= j+50) {
      rect(i,j,35,35);
       if( j>750) { rotate(r);}
 }
 }

