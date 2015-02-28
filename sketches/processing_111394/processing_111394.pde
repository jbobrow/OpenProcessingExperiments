
size(500, 500);
background(200);
noStroke();

for (int i=0; i<530; i=i+40) {
  for (int j=0; j<530; j=j+40) {
    float fv = map(i*j,0,120000, 0, 255);
    
 
    stroke(fv,20,45,100);
   
    fill(fv,20,45,200);
    rect(i-30, j-30, 200, 200);
    
    fill(fv,20,45,100);
    ellipse(i-30, j-30, 100, 100);
    
   

  }
}


