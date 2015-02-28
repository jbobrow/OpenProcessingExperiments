
size(800, 800);
background(255);
stroke(0);
noFill();
smooth();
stroke(0);

for (int x = 0; x < 800; x += 3) {
  if (x<300) {
    float n = norm(x, 0.0, 400.0);
    float p = pow(n, 4);
    strokeWeight(n/8);

    beginShape();
    vertex(400, p); 
    bezierVertex(450-x, x*1.8, x, 0, x+800, 700);  
    endShape();
  }

  else if (x<600) {
    float n = norm(x, 0.0, 300.0);
    float p = pow(n, 4);
    strokeWeight(n/4);

    beginShape();
    vertex(800, x); 
    bezierVertex(x, x*1.3, x-100, 800, 800, 800-x);
    endShape();
  }


  else {
    float n = norm(x, 0.0, 120.0);
    float p = pow(n, 3);
    strokeWeight(n/100);

    beginShape();
    vertex(x*1.2, 800); 
    bezierVertex(100-x, x, x, 0, x*2, p*1.3); 
    endShape();
  }
}
