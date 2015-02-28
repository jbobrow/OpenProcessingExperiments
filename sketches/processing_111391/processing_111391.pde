
size(500, 500);
background(255);
noStroke();

for (int i=0; i<510; i=i+30) {
  for (int j=0; j<510; j=j+30) {
    float fv = map(i*j,0,120000, 0, 255);
  
    
   strokeWeight(5);
   stroke(fv,200,229,149);
    ellipse(i, j, 20, 20);

    
     strokeWeight(1);
    stroke(fv,200,229,149);
    rect(j, i, 500, 500);
    

    

    
   
  }
}


