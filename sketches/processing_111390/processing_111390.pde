
size(500, 500);
background(0);
noStroke();

for (int i=0; i<510; i=i+70) {
  for (int j=0; j<510; j=j+70) {
    float fv = map(i*j,0,120000, 0, 255);
    
    fill(fv,20,45,111);
    rect(i, j, 200, 200);
    
    stroke(fv,20,45,111);
    strokeWeight(50);
    fill(fv,9,47,149);
    rect(i, j, 120, 120);
    
    fill(fv,26, 98, 211);
    rect(i, j, 100, 100);
    




  }
}



