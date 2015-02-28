
size (500, 500);
background (250,189,204);



stroke(255, 255, 255);
strokeWeight(2);
fill(252,46,98); 
for (int i=5; i<width; i=i+10) {
  for (int j=5; j<height; j=j+10) 
 triangle ( i+2, j+1, j*10, i+15, j+10, i+10);
}

for (int k=5; k<250; k=k+10){
  
 triangle ( k+50, 20, k*10, k+15, k+10, k);
 
}


