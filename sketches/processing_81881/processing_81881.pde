
size(800, 800);
background(148,138,183);
noFill();
smooth();


for (int x = 0; x < 800; x += 5) {
  float n = norm(x, 0.0, 100.0);
  float p = pow(n, 5);

  strokeWeight(n/10);
  stroke(250, 255, 110);
  beginShape();
  vertex(800-p, 900-n); 
  bezierVertex(x-400, 500, x, 100, x, 0); 
  endShape();
  
 // yellow line 1


  strokeWeight(n/8);
  stroke(110, 255, 246);
  beginShape();
  vertex(600-x, n/5); 
  bezierVertex(800, 800, 0, 800, p, 4000); 
  endShape();
  
  // cyan line
  

  strokeWeight(n/8);
  stroke(250, 255, 110);
  beginShape();
  vertex(800-n, x); 
  bezierVertex(x, 0, 0, 800, p, 800); 
  endShape();
  
  // yellow line 2
}
